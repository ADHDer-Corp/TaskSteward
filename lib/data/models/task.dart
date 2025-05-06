import 'package:drift/drift.dart';
import 'package:tasksteward/data/models/converters/task_converter.dart';
import 'package:uuid/uuid.dart';

import '../../core/enums/task_enums.dart';


class TaskTemplates extends Table {
  TextColumn get id => text().withLength(min: 36, max: 36).clientDefault(() =>
      const Uuid().v4())();

  TextColumn get title => text().withLength(min: 1, max: 100)();

  TextColumn get description => text().nullable()();

  TextColumn get priority => textEnum<Priority>().nullable()();

  DateTimeColumn get dueDate => dateTime().nullable()();

  IntColumn get remindTime => integer().withDefault(const Constant(0))();

  TextColumn get repeat => text().map(const RRuleConverter()).nullable()();

  TextColumn get category =>
      text().withLength(min: 36, max: 36).nullable().references(TaskCategories, #id)();

  BoolColumn get autoRepeat => boolean().withDefault(const Constant(false))();

  TextColumn get parentTask =>
      text().withLength(min: 36, max: 36).nullable().references(TaskTemplates, #id)();

  @override
  Set<Column> get primaryKey => {id};
}

class TaskInstances extends Table {
  TextColumn get id => text().withLength(min: 36, max: 36).clientDefault(() =>
      const Uuid().v4())();

  TextColumn get taskTemplate =>
      text().withLength(min: 36, max: 36).references(TaskTemplates, #id)();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime()();

  BoolColumn get completed => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

class TaskTags extends Table {
  TextColumn get id => text().withLength(min: 36, max: 36).clientDefault(() =>
      const Uuid().v4())();

  TextColumn get name => text().withLength(min: 1, max: 100)();

  @override
  Set<Column> get primaryKey => {id};
}

class TaskCategories extends Table {
  TextColumn get id => text().withLength(min: 36, max: 36).clientDefault(() =>
      const Uuid().v4())();

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
  TextColumn get taskTemplate => text().withLength(min: 36, max: 36).references(TaskTemplates, #id)();
  TextColumn get taskTag => text().withLength(min: 36, max: 36).references(TaskTags, #id)();

  @override
  Set<Column> get primaryKey => {taskTemplate, taskTag};
}

