import 'package:drift/drift.dart';
import 'package:tasksteward/data/models/converters/task_converter.dart';

import '../../core/enums/task_enums.dart';


class TaskTemplates extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text().withLength(min: 1, max: 100)();

  TextColumn get description => text().nullable()();

  TextColumn get priority => textEnum<Priority>().nullable()();

  DateTimeColumn get dueDate => dateTime().nullable()();

  IntColumn get remindTime => integer().withDefault(const Constant(0))();

  TextColumn get repeat => text().map(const RRuleConverter()).nullable()();

  IntColumn get category =>
      integer().nullable().references(TaskCategories, #id)();

  BoolColumn get autoRepeat => boolean().withDefault(const Constant(false))();

  IntColumn get parentTask =>
      integer().nullable().references(TaskTemplates, #id)();

  @override
  Set<Column> get primaryKey => {id};
}

class TaskInstances extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get taskTemplate =>
      integer().references(TaskTemplates, #id)();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime()();

  BoolColumn get completed => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

class TaskTags extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 1, max: 100)();

  @override
  Set<Column> get primaryKey => {id};
}

class TaskCategories extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 1, max: 100)();

  TextColumn get description => text().nullable()();

  // emoji
  TextColumn get icon => text().nullable()();

  // priority
  TextColumn get priority => textEnum<Priority>().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class TaskTemplateTagJunction extends Table {
  IntColumn get taskTemplate => integer().references(TaskTemplates, #id)();
  IntColumn get taskTag => integer().references(TaskTags, #id)();

  @override
  Set<Column> get primaryKey => {taskTemplate, taskTag};
}

