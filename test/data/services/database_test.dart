import 'package:drift/drift.dart' hide isNotNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rrule/rrule.dart';
import 'package:tasksteward/core/enums/task_enums.dart';
import 'package:tasksteward/data/services/database.dart';

// 创建内存数据库用于测试
AppDatabase _createTestDb() {
  return AppDatabase(NativeDatabase.memory());
}

void main() {
  late AppDatabase database;

  setUp(() {
    database = _createTestDb();
  });

  tearDown(() async {
    await database.close();
  });

  group('数据库连接测试', () {
    test('数据库初始化成功', () {
      // 验证数据库是否成功创建
      expect(database, isNotNull);
      expect(database.schemaVersion, 1);
    });
  });

  group('基本CRUD操作测试', () {
    test('任务类别创建和查询', () async {
      // 创建一个任务类别
      final categoryId = await database.into(database.taskCategories).insert(
        TaskCategoriesCompanion.insert(
          name: '测试类别',
          description: const Value('测试描述'),
          priority: const Value(Priority.medium),
        ),
      );

      // 查询并验证
      final results = await database.select(database.taskCategories).get();
      expect(results.length, 1);
      expect(results.first.name, '测试类别');
      expect(results.first.priority, Priority.medium);
    });

    test('任务模板创建和查询', () async {
      // 先创建一个类别
      final categoryId = await database.into(database.taskCategories).insert(
        TaskCategoriesCompanion.insert(
          name: '测试类别',
        ),
      );

      // 创建一个任务模板
      final taskId = await database.into(database.taskTemplates).insert(
        TaskTemplatesCompanion.insert(
          title: '测试任务',
          description: const Value('测试描述'),
          priority: const Value(Priority.high),
          category: Value(categoryId),
        ),
      );

      // 查询并验证
      final results = await database.select(database.taskTemplates).get();
      expect(results.length, 1);
      expect(results.first.title, '测试任务');
      expect(results.first.priority, Priority.high);
      expect(results.first.category, categoryId);
    });

    test('任务实例创建和查询', () async {
      // 先创建任务模板
      final taskTemplateId = await database.into(database.taskTemplates).insert(
        TaskTemplatesCompanion.insert(
          title: '测试任务模板',
        ),
      );

      // 创建任务实例
      final now = DateTime.now();
      await database.into(database.taskInstances).insert(
        TaskInstancesCompanion.insert(
          taskTemplate: taskTemplateId,
          createdAt: now,
          updatedAt: now,
        ),
      );

      // 查询并验证
      final results = await database.select(database.taskInstances).get();
      expect(results.length, 1);
      expect(results.first.taskTemplate, taskTemplateId);
      expect(results.first.completed, false);
    });
  });

  group('类型转换测试', () {
    test('RRule转换器测试', () async {
      // 创建一个带有重复规则的任务
      final rrule = RecurrenceRule(
        frequency: Frequency.daily,
        count: 5,
      );
      
      await database.into(database.taskTemplates).insert(
        TaskTemplatesCompanion.insert(
          title: '重复任务',
          repeat: Value(rrule),
        ),
      );

      // 查询并验证RRule转换是否正常
      final results = await database.select(database.taskTemplates).get();
      expect(results.length, 1);
      expect(results.first.repeat?.frequency, Frequency.daily);
      expect(results.first.repeat?.count, 5);
      
      // 验证转换回字符串
      final rruleString = results.first.repeat.toString();
      expect(rruleString.contains('FREQ=DAILY'), true);
      expect(rruleString.contains('COUNT=5'), true);
    });

    test('枚举类型转换测试', () async {
      // 测试不同优先级
      await database.into(database.taskTemplates).insert(
        TaskTemplatesCompanion.insert(
          title: '枚举测试-高优先级',
          priority: const Value(Priority.high),
        ),
      );

      await database.into(database.taskTemplates).insert(
        TaskTemplatesCompanion.insert(
          title: '枚举测试-低优先级',
          priority: const Value(Priority.low),
        ),
      );

      // 查询并验证枚举转换是否正常
      final results = await (database.select(database.taskTemplates)
        ..orderBy([(t) => OrderingTerm.asc(t.title)]))
        .get();
      
      expect(results.length, 2);
      expect(results[0].title, '枚举测试-低优先级');
      expect(results[0].priority, Priority.low);
      expect(results[1].title, '枚举测试-高优先级');
      expect(results[1].priority, Priority.high);
    });
  });

  group('更新和删除测试', () {
    test('更新任务模板', () async {
      // 创建一个任务模板
      final taskId = await database.into(database.taskTemplates).insert(
        TaskTemplatesCompanion.insert(
          title: '原始标题',
          priority: const Value(Priority.low),
        ),
      );

      // 更新任务
      await (database.update(database.taskTemplates)..where((t) => t.id.equals(taskId)))
        .write(const TaskTemplatesCompanion(
          title: Value('更新后的标题'),
          priority: Value(Priority.high),
        ));

      // 验证更新
      final result = await (database.select(database.taskTemplates)..where((t) => t.id.equals(taskId)))
        .getSingle();
      
      expect(result.title, '更新后的标题');
      expect(result.priority, Priority.high);
    });

    test('删除任务模板', () async {
      // 创建一个任务模板
      final taskId = await database.into(database.taskTemplates).insert(
        TaskTemplatesCompanion.insert(
          title: '待删除任务',
        ),
      );

      // 确认任务创建
      var count = await database.select(database.taskTemplates).get();
      expect(count.length, 1);

      // 删除任务
      await (database.delete(database.taskTemplates)..where((t) => t.id.equals(taskId)))
        .go();

      // 验证删除
      count = await database.select(database.taskTemplates).get();
      expect(count.length, 0);
    });
  });
}
