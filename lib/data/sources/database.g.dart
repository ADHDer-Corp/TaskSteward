// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $TaskCategoriesTable extends TaskCategories
    with TableInfo<$TaskCategoriesTable, TaskCategory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskCategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
      'icon', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  late final GeneratedColumnWithTypeConverter<Priority?, String> priority =
      GeneratedColumn<String>('priority', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<Priority?>($TaskCategoriesTable.$converterpriorityn);
  @override
  List<GeneratedColumn> get $columns => [id, name, description, icon, priority];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'task_categories';
  @override
  VerificationContext validateIntegrity(Insertable<TaskCategory> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('icon')) {
      context.handle(
          _iconMeta, icon.isAcceptableOrUnknown(data['icon']!, _iconMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaskCategory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskCategory(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      icon: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon']),
      priority: $TaskCategoriesTable.$converterpriorityn.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}priority'])),
    );
  }

  @override
  $TaskCategoriesTable createAlias(String alias) {
    return $TaskCategoriesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<Priority, String, String> $converterpriority =
      const EnumNameConverter<Priority>(Priority.values);
  static JsonTypeConverter2<Priority?, String?, String?> $converterpriorityn =
      JsonTypeConverter2.asNullable($converterpriority);
}

class TaskCategory extends DataClass implements Insertable<TaskCategory> {
  final int id;
  final String name;
  final String? description;
  final String? icon;
  final Priority? priority;
  const TaskCategory(
      {required this.id,
      required this.name,
      this.description,
      this.icon,
      this.priority});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || icon != null) {
      map['icon'] = Variable<String>(icon);
    }
    if (!nullToAbsent || priority != null) {
      map['priority'] = Variable<String>(
          $TaskCategoriesTable.$converterpriorityn.toSql(priority));
    }
    return map;
  }

  TaskCategoriesCompanion toCompanion(bool nullToAbsent) {
    return TaskCategoriesCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      icon: icon == null && nullToAbsent ? const Value.absent() : Value(icon),
      priority: priority == null && nullToAbsent
          ? const Value.absent()
          : Value(priority),
    );
  }

  factory TaskCategory.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskCategory(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      icon: serializer.fromJson<String?>(json['icon']),
      priority: $TaskCategoriesTable.$converterpriorityn
          .fromJson(serializer.fromJson<String?>(json['priority'])),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'icon': serializer.toJson<String?>(icon),
      'priority': serializer.toJson<String?>(
          $TaskCategoriesTable.$converterpriorityn.toJson(priority)),
    };
  }

  TaskCategory copyWith(
          {int? id,
          String? name,
          Value<String?> description = const Value.absent(),
          Value<String?> icon = const Value.absent(),
          Value<Priority?> priority = const Value.absent()}) =>
      TaskCategory(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        icon: icon.present ? icon.value : this.icon,
        priority: priority.present ? priority.value : this.priority,
      );
  TaskCategory copyWithCompanion(TaskCategoriesCompanion data) {
    return TaskCategory(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      icon: data.icon.present ? data.icon.value : this.icon,
      priority: data.priority.present ? data.priority.value : this.priority,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TaskCategory(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('icon: $icon, ')
          ..write('priority: $priority')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description, icon, priority);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskCategory &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.icon == this.icon &&
          other.priority == this.priority);
}

class TaskCategoriesCompanion extends UpdateCompanion<TaskCategory> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<String?> icon;
  final Value<Priority?> priority;
  const TaskCategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.icon = const Value.absent(),
    this.priority = const Value.absent(),
  });
  TaskCategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    this.icon = const Value.absent(),
    this.priority = const Value.absent(),
  }) : name = Value(name);
  static Insertable<TaskCategory> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? icon,
    Expression<String>? priority,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (icon != null) 'icon': icon,
      if (priority != null) 'priority': priority,
    });
  }

  TaskCategoriesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? description,
      Value<String?>? icon,
      Value<Priority?>? priority}) {
    return TaskCategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      priority: priority ?? this.priority,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (priority.present) {
      map['priority'] = Variable<String>(
          $TaskCategoriesTable.$converterpriorityn.toSql(priority.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskCategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('icon: $icon, ')
          ..write('priority: $priority')
          ..write(')'))
        .toString();
  }
}

class $TaskTemplatesTable extends TaskTemplates
    with TableInfo<$TaskTemplatesTable, TaskTemplate> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskTemplatesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  late final GeneratedColumnWithTypeConverter<Priority?, String> priority =
      GeneratedColumn<String>('priority', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<Priority?>($TaskTemplatesTable.$converterpriorityn);
  static const VerificationMeta _dueDateMeta =
      const VerificationMeta('dueDate');
  @override
  late final GeneratedColumn<DateTime> dueDate = GeneratedColumn<DateTime>(
      'due_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _remindTimeMeta =
      const VerificationMeta('remindTime');
  @override
  late final GeneratedColumn<int> remindTime = GeneratedColumn<int>(
      'remind_time', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  late final GeneratedColumnWithTypeConverter<RecurrenceRule?, String> repeat =
      GeneratedColumn<String>('repeat', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<RecurrenceRule?>($TaskTemplatesTable.$converterrepeat);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<int> category = GeneratedColumn<int>(
      'category', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES task_categories (id)'));
  static const VerificationMeta _autoRepeatMeta =
      const VerificationMeta('autoRepeat');
  @override
  late final GeneratedColumn<bool> autoRepeat = GeneratedColumn<bool>(
      'auto_repeat', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("auto_repeat" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _parentTaskMeta =
      const VerificationMeta('parentTask');
  @override
  late final GeneratedColumn<int> parentTask = GeneratedColumn<int>(
      'parent_task', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES task_templates (id)'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        description,
        priority,
        dueDate,
        remindTime,
        repeat,
        category,
        autoRepeat,
        parentTask
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'task_templates';
  @override
  VerificationContext validateIntegrity(Insertable<TaskTemplate> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('due_date')) {
      context.handle(_dueDateMeta,
          dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta));
    }
    if (data.containsKey('remind_time')) {
      context.handle(
          _remindTimeMeta,
          remindTime.isAcceptableOrUnknown(
              data['remind_time']!, _remindTimeMeta));
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    }
    if (data.containsKey('auto_repeat')) {
      context.handle(
          _autoRepeatMeta,
          autoRepeat.isAcceptableOrUnknown(
              data['auto_repeat']!, _autoRepeatMeta));
    }
    if (data.containsKey('parent_task')) {
      context.handle(
          _parentTaskMeta,
          parentTask.isAcceptableOrUnknown(
              data['parent_task']!, _parentTaskMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaskTemplate map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskTemplate(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      priority: $TaskTemplatesTable.$converterpriorityn.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}priority'])),
      dueDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}due_date']),
      remindTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}remind_time'])!,
      repeat: $TaskTemplatesTable.$converterrepeat.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}repeat'])),
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category']),
      autoRepeat: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}auto_repeat'])!,
      parentTask: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}parent_task']),
    );
  }

  @override
  $TaskTemplatesTable createAlias(String alias) {
    return $TaskTemplatesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<Priority, String, String> $converterpriority =
      const EnumNameConverter<Priority>(Priority.values);
  static JsonTypeConverter2<Priority?, String?, String?> $converterpriorityn =
      JsonTypeConverter2.asNullable($converterpriority);
  static TypeConverter<RecurrenceRule?, String?> $converterrepeat =
      const RRuleConverter();
}

class TaskTemplate extends DataClass implements Insertable<TaskTemplate> {
  final int id;
  final String title;
  final String? description;
  final Priority? priority;
  final DateTime? dueDate;
  final int remindTime;
  final RecurrenceRule? repeat;
  final int? category;
  final bool autoRepeat;
  final int? parentTask;
  const TaskTemplate(
      {required this.id,
      required this.title,
      this.description,
      this.priority,
      this.dueDate,
      required this.remindTime,
      this.repeat,
      this.category,
      required this.autoRepeat,
      this.parentTask});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || priority != null) {
      map['priority'] = Variable<String>(
          $TaskTemplatesTable.$converterpriorityn.toSql(priority));
    }
    if (!nullToAbsent || dueDate != null) {
      map['due_date'] = Variable<DateTime>(dueDate);
    }
    map['remind_time'] = Variable<int>(remindTime);
    if (!nullToAbsent || repeat != null) {
      map['repeat'] =
          Variable<String>($TaskTemplatesTable.$converterrepeat.toSql(repeat));
    }
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<int>(category);
    }
    map['auto_repeat'] = Variable<bool>(autoRepeat);
    if (!nullToAbsent || parentTask != null) {
      map['parent_task'] = Variable<int>(parentTask);
    }
    return map;
  }

  TaskTemplatesCompanion toCompanion(bool nullToAbsent) {
    return TaskTemplatesCompanion(
      id: Value(id),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      priority: priority == null && nullToAbsent
          ? const Value.absent()
          : Value(priority),
      dueDate: dueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(dueDate),
      remindTime: Value(remindTime),
      repeat:
          repeat == null && nullToAbsent ? const Value.absent() : Value(repeat),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      autoRepeat: Value(autoRepeat),
      parentTask: parentTask == null && nullToAbsent
          ? const Value.absent()
          : Value(parentTask),
    );
  }

  factory TaskTemplate.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskTemplate(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      priority: $TaskTemplatesTable.$converterpriorityn
          .fromJson(serializer.fromJson<String?>(json['priority'])),
      dueDate: serializer.fromJson<DateTime?>(json['dueDate']),
      remindTime: serializer.fromJson<int>(json['remindTime']),
      repeat: serializer.fromJson<RecurrenceRule?>(json['repeat']),
      category: serializer.fromJson<int?>(json['category']),
      autoRepeat: serializer.fromJson<bool>(json['autoRepeat']),
      parentTask: serializer.fromJson<int?>(json['parentTask']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'priority': serializer.toJson<String?>(
          $TaskTemplatesTable.$converterpriorityn.toJson(priority)),
      'dueDate': serializer.toJson<DateTime?>(dueDate),
      'remindTime': serializer.toJson<int>(remindTime),
      'repeat': serializer.toJson<RecurrenceRule?>(repeat),
      'category': serializer.toJson<int?>(category),
      'autoRepeat': serializer.toJson<bool>(autoRepeat),
      'parentTask': serializer.toJson<int?>(parentTask),
    };
  }

  TaskTemplate copyWith(
          {int? id,
          String? title,
          Value<String?> description = const Value.absent(),
          Value<Priority?> priority = const Value.absent(),
          Value<DateTime?> dueDate = const Value.absent(),
          int? remindTime,
          Value<RecurrenceRule?> repeat = const Value.absent(),
          Value<int?> category = const Value.absent(),
          bool? autoRepeat,
          Value<int?> parentTask = const Value.absent()}) =>
      TaskTemplate(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description.present ? description.value : this.description,
        priority: priority.present ? priority.value : this.priority,
        dueDate: dueDate.present ? dueDate.value : this.dueDate,
        remindTime: remindTime ?? this.remindTime,
        repeat: repeat.present ? repeat.value : this.repeat,
        category: category.present ? category.value : this.category,
        autoRepeat: autoRepeat ?? this.autoRepeat,
        parentTask: parentTask.present ? parentTask.value : this.parentTask,
      );
  TaskTemplate copyWithCompanion(TaskTemplatesCompanion data) {
    return TaskTemplate(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      priority: data.priority.present ? data.priority.value : this.priority,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
      remindTime:
          data.remindTime.present ? data.remindTime.value : this.remindTime,
      repeat: data.repeat.present ? data.repeat.value : this.repeat,
      category: data.category.present ? data.category.value : this.category,
      autoRepeat:
          data.autoRepeat.present ? data.autoRepeat.value : this.autoRepeat,
      parentTask:
          data.parentTask.present ? data.parentTask.value : this.parentTask,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TaskTemplate(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('priority: $priority, ')
          ..write('dueDate: $dueDate, ')
          ..write('remindTime: $remindTime, ')
          ..write('repeat: $repeat, ')
          ..write('category: $category, ')
          ..write('autoRepeat: $autoRepeat, ')
          ..write('parentTask: $parentTask')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, description, priority, dueDate,
      remindTime, repeat, category, autoRepeat, parentTask);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskTemplate &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.priority == this.priority &&
          other.dueDate == this.dueDate &&
          other.remindTime == this.remindTime &&
          other.repeat == this.repeat &&
          other.category == this.category &&
          other.autoRepeat == this.autoRepeat &&
          other.parentTask == this.parentTask);
}

class TaskTemplatesCompanion extends UpdateCompanion<TaskTemplate> {
  final Value<int> id;
  final Value<String> title;
  final Value<String?> description;
  final Value<Priority?> priority;
  final Value<DateTime?> dueDate;
  final Value<int> remindTime;
  final Value<RecurrenceRule?> repeat;
  final Value<int?> category;
  final Value<bool> autoRepeat;
  final Value<int?> parentTask;
  const TaskTemplatesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.priority = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.remindTime = const Value.absent(),
    this.repeat = const Value.absent(),
    this.category = const Value.absent(),
    this.autoRepeat = const Value.absent(),
    this.parentTask = const Value.absent(),
  });
  TaskTemplatesCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.description = const Value.absent(),
    this.priority = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.remindTime = const Value.absent(),
    this.repeat = const Value.absent(),
    this.category = const Value.absent(),
    this.autoRepeat = const Value.absent(),
    this.parentTask = const Value.absent(),
  }) : title = Value(title);
  static Insertable<TaskTemplate> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? priority,
    Expression<DateTime>? dueDate,
    Expression<int>? remindTime,
    Expression<String>? repeat,
    Expression<int>? category,
    Expression<bool>? autoRepeat,
    Expression<int>? parentTask,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (priority != null) 'priority': priority,
      if (dueDate != null) 'due_date': dueDate,
      if (remindTime != null) 'remind_time': remindTime,
      if (repeat != null) 'repeat': repeat,
      if (category != null) 'category': category,
      if (autoRepeat != null) 'auto_repeat': autoRepeat,
      if (parentTask != null) 'parent_task': parentTask,
    });
  }

  TaskTemplatesCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String?>? description,
      Value<Priority?>? priority,
      Value<DateTime?>? dueDate,
      Value<int>? remindTime,
      Value<RecurrenceRule?>? repeat,
      Value<int?>? category,
      Value<bool>? autoRepeat,
      Value<int?>? parentTask}) {
    return TaskTemplatesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      priority: priority ?? this.priority,
      dueDate: dueDate ?? this.dueDate,
      remindTime: remindTime ?? this.remindTime,
      repeat: repeat ?? this.repeat,
      category: category ?? this.category,
      autoRepeat: autoRepeat ?? this.autoRepeat,
      parentTask: parentTask ?? this.parentTask,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (priority.present) {
      map['priority'] = Variable<String>(
          $TaskTemplatesTable.$converterpriorityn.toSql(priority.value));
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    if (remindTime.present) {
      map['remind_time'] = Variable<int>(remindTime.value);
    }
    if (repeat.present) {
      map['repeat'] = Variable<String>(
          $TaskTemplatesTable.$converterrepeat.toSql(repeat.value));
    }
    if (category.present) {
      map['category'] = Variable<int>(category.value);
    }
    if (autoRepeat.present) {
      map['auto_repeat'] = Variable<bool>(autoRepeat.value);
    }
    if (parentTask.present) {
      map['parent_task'] = Variable<int>(parentTask.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskTemplatesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('priority: $priority, ')
          ..write('dueDate: $dueDate, ')
          ..write('remindTime: $remindTime, ')
          ..write('repeat: $repeat, ')
          ..write('category: $category, ')
          ..write('autoRepeat: $autoRepeat, ')
          ..write('parentTask: $parentTask')
          ..write(')'))
        .toString();
  }
}

class $TaskInstancesTable extends TaskInstances
    with TableInfo<$TaskInstancesTable, TaskInstance> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskInstancesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _taskTemplateMeta =
      const VerificationMeta('taskTemplate');
  @override
  late final GeneratedColumn<int> taskTemplate = GeneratedColumn<int>(
      'task_template', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES task_templates (id)'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _completedMeta =
      const VerificationMeta('completed');
  @override
  late final GeneratedColumn<bool> completed = GeneratedColumn<bool>(
      'completed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("completed" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, taskTemplate, createdAt, updatedAt, completed];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'task_instances';
  @override
  VerificationContext validateIntegrity(Insertable<TaskInstance> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('task_template')) {
      context.handle(
          _taskTemplateMeta,
          taskTemplate.isAcceptableOrUnknown(
              data['task_template']!, _taskTemplateMeta));
    } else if (isInserting) {
      context.missing(_taskTemplateMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('completed')) {
      context.handle(_completedMeta,
          completed.isAcceptableOrUnknown(data['completed']!, _completedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaskInstance map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskInstance(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      taskTemplate: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}task_template'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      completed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}completed'])!,
    );
  }

  @override
  $TaskInstancesTable createAlias(String alias) {
    return $TaskInstancesTable(attachedDatabase, alias);
  }
}

class TaskInstance extends DataClass implements Insertable<TaskInstance> {
  final int id;
  final int taskTemplate;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool completed;
  const TaskInstance(
      {required this.id,
      required this.taskTemplate,
      required this.createdAt,
      required this.updatedAt,
      required this.completed});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['task_template'] = Variable<int>(taskTemplate);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['completed'] = Variable<bool>(completed);
    return map;
  }

  TaskInstancesCompanion toCompanion(bool nullToAbsent) {
    return TaskInstancesCompanion(
      id: Value(id),
      taskTemplate: Value(taskTemplate),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      completed: Value(completed),
    );
  }

  factory TaskInstance.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskInstance(
      id: serializer.fromJson<int>(json['id']),
      taskTemplate: serializer.fromJson<int>(json['taskTemplate']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      completed: serializer.fromJson<bool>(json['completed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'taskTemplate': serializer.toJson<int>(taskTemplate),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'completed': serializer.toJson<bool>(completed),
    };
  }

  TaskInstance copyWith(
          {int? id,
          int? taskTemplate,
          DateTime? createdAt,
          DateTime? updatedAt,
          bool? completed}) =>
      TaskInstance(
        id: id ?? this.id,
        taskTemplate: taskTemplate ?? this.taskTemplate,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        completed: completed ?? this.completed,
      );
  TaskInstance copyWithCompanion(TaskInstancesCompanion data) {
    return TaskInstance(
      id: data.id.present ? data.id.value : this.id,
      taskTemplate: data.taskTemplate.present
          ? data.taskTemplate.value
          : this.taskTemplate,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      completed: data.completed.present ? data.completed.value : this.completed,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TaskInstance(')
          ..write('id: $id, ')
          ..write('taskTemplate: $taskTemplate, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('completed: $completed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, taskTemplate, createdAt, updatedAt, completed);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskInstance &&
          other.id == this.id &&
          other.taskTemplate == this.taskTemplate &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.completed == this.completed);
}

class TaskInstancesCompanion extends UpdateCompanion<TaskInstance> {
  final Value<int> id;
  final Value<int> taskTemplate;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> completed;
  const TaskInstancesCompanion({
    this.id = const Value.absent(),
    this.taskTemplate = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.completed = const Value.absent(),
  });
  TaskInstancesCompanion.insert({
    this.id = const Value.absent(),
    required int taskTemplate,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.completed = const Value.absent(),
  })  : taskTemplate = Value(taskTemplate),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<TaskInstance> custom({
    Expression<int>? id,
    Expression<int>? taskTemplate,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? completed,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (taskTemplate != null) 'task_template': taskTemplate,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (completed != null) 'completed': completed,
    });
  }

  TaskInstancesCompanion copyWith(
      {Value<int>? id,
      Value<int>? taskTemplate,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<bool>? completed}) {
    return TaskInstancesCompanion(
      id: id ?? this.id,
      taskTemplate: taskTemplate ?? this.taskTemplate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      completed: completed ?? this.completed,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (taskTemplate.present) {
      map['task_template'] = Variable<int>(taskTemplate.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (completed.present) {
      map['completed'] = Variable<bool>(completed.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskInstancesCompanion(')
          ..write('id: $id, ')
          ..write('taskTemplate: $taskTemplate, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('completed: $completed')
          ..write(')'))
        .toString();
  }
}

class $TaskTagsTable extends TaskTags with TableInfo<$TaskTagsTable, TaskTag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskTagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'task_tags';
  @override
  VerificationContext validateIntegrity(Insertable<TaskTag> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaskTag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskTag(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $TaskTagsTable createAlias(String alias) {
    return $TaskTagsTable(attachedDatabase, alias);
  }
}

class TaskTag extends DataClass implements Insertable<TaskTag> {
  final int id;
  final String name;
  const TaskTag({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  TaskTagsCompanion toCompanion(bool nullToAbsent) {
    return TaskTagsCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory TaskTag.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskTag(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  TaskTag copyWith({int? id, String? name}) => TaskTag(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  TaskTag copyWithCompanion(TaskTagsCompanion data) {
    return TaskTag(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TaskTag(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskTag && other.id == this.id && other.name == this.name);
}

class TaskTagsCompanion extends UpdateCompanion<TaskTag> {
  final Value<int> id;
  final Value<String> name;
  const TaskTagsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  TaskTagsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<TaskTag> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  TaskTagsCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return TaskTagsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskTagsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $TaskTemplateTagJunctionTable extends TaskTemplateTagJunction
    with TableInfo<$TaskTemplateTagJunctionTable, TaskTemplateTagJunctionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskTemplateTagJunctionTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _taskTemplateMeta =
      const VerificationMeta('taskTemplate');
  @override
  late final GeneratedColumn<int> taskTemplate = GeneratedColumn<int>(
      'task_template', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES task_templates (id)'));
  static const VerificationMeta _taskTagMeta =
      const VerificationMeta('taskTag');
  @override
  late final GeneratedColumn<int> taskTag = GeneratedColumn<int>(
      'task_tag', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES task_tags (id)'));
  @override
  List<GeneratedColumn> get $columns => [taskTemplate, taskTag];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'task_template_tag_junction';
  @override
  VerificationContext validateIntegrity(
      Insertable<TaskTemplateTagJunctionData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('task_template')) {
      context.handle(
          _taskTemplateMeta,
          taskTemplate.isAcceptableOrUnknown(
              data['task_template']!, _taskTemplateMeta));
    } else if (isInserting) {
      context.missing(_taskTemplateMeta);
    }
    if (data.containsKey('task_tag')) {
      context.handle(_taskTagMeta,
          taskTag.isAcceptableOrUnknown(data['task_tag']!, _taskTagMeta));
    } else if (isInserting) {
      context.missing(_taskTagMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {taskTemplate, taskTag};
  @override
  TaskTemplateTagJunctionData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskTemplateTagJunctionData(
      taskTemplate: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}task_template'])!,
      taskTag: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}task_tag'])!,
    );
  }

  @override
  $TaskTemplateTagJunctionTable createAlias(String alias) {
    return $TaskTemplateTagJunctionTable(attachedDatabase, alias);
  }
}

class TaskTemplateTagJunctionData extends DataClass
    implements Insertable<TaskTemplateTagJunctionData> {
  final int taskTemplate;
  final int taskTag;
  const TaskTemplateTagJunctionData(
      {required this.taskTemplate, required this.taskTag});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['task_template'] = Variable<int>(taskTemplate);
    map['task_tag'] = Variable<int>(taskTag);
    return map;
  }

  TaskTemplateTagJunctionCompanion toCompanion(bool nullToAbsent) {
    return TaskTemplateTagJunctionCompanion(
      taskTemplate: Value(taskTemplate),
      taskTag: Value(taskTag),
    );
  }

  factory TaskTemplateTagJunctionData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskTemplateTagJunctionData(
      taskTemplate: serializer.fromJson<int>(json['taskTemplate']),
      taskTag: serializer.fromJson<int>(json['taskTag']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'taskTemplate': serializer.toJson<int>(taskTemplate),
      'taskTag': serializer.toJson<int>(taskTag),
    };
  }

  TaskTemplateTagJunctionData copyWith({int? taskTemplate, int? taskTag}) =>
      TaskTemplateTagJunctionData(
        taskTemplate: taskTemplate ?? this.taskTemplate,
        taskTag: taskTag ?? this.taskTag,
      );
  TaskTemplateTagJunctionData copyWithCompanion(
      TaskTemplateTagJunctionCompanion data) {
    return TaskTemplateTagJunctionData(
      taskTemplate: data.taskTemplate.present
          ? data.taskTemplate.value
          : this.taskTemplate,
      taskTag: data.taskTag.present ? data.taskTag.value : this.taskTag,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TaskTemplateTagJunctionData(')
          ..write('taskTemplate: $taskTemplate, ')
          ..write('taskTag: $taskTag')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(taskTemplate, taskTag);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskTemplateTagJunctionData &&
          other.taskTemplate == this.taskTemplate &&
          other.taskTag == this.taskTag);
}

class TaskTemplateTagJunctionCompanion
    extends UpdateCompanion<TaskTemplateTagJunctionData> {
  final Value<int> taskTemplate;
  final Value<int> taskTag;
  final Value<int> rowid;
  const TaskTemplateTagJunctionCompanion({
    this.taskTemplate = const Value.absent(),
    this.taskTag = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TaskTemplateTagJunctionCompanion.insert({
    required int taskTemplate,
    required int taskTag,
    this.rowid = const Value.absent(),
  })  : taskTemplate = Value(taskTemplate),
        taskTag = Value(taskTag);
  static Insertable<TaskTemplateTagJunctionData> custom({
    Expression<int>? taskTemplate,
    Expression<int>? taskTag,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (taskTemplate != null) 'task_template': taskTemplate,
      if (taskTag != null) 'task_tag': taskTag,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TaskTemplateTagJunctionCompanion copyWith(
      {Value<int>? taskTemplate, Value<int>? taskTag, Value<int>? rowid}) {
    return TaskTemplateTagJunctionCompanion(
      taskTemplate: taskTemplate ?? this.taskTemplate,
      taskTag: taskTag ?? this.taskTag,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (taskTemplate.present) {
      map['task_template'] = Variable<int>(taskTemplate.value);
    }
    if (taskTag.present) {
      map['task_tag'] = Variable<int>(taskTag.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskTemplateTagJunctionCompanion(')
          ..write('taskTemplate: $taskTemplate, ')
          ..write('taskTag: $taskTag, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TaskCategoriesTable taskCategories = $TaskCategoriesTable(this);
  late final $TaskTemplatesTable taskTemplates = $TaskTemplatesTable(this);
  late final $TaskInstancesTable taskInstances = $TaskInstancesTable(this);
  late final $TaskTagsTable taskTags = $TaskTagsTable(this);
  late final $TaskTemplateTagJunctionTable taskTemplateTagJunction =
      $TaskTemplateTagJunctionTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        taskCategories,
        taskTemplates,
        taskInstances,
        taskTags,
        taskTemplateTagJunction
      ];
}

typedef $$TaskCategoriesTableCreateCompanionBuilder = TaskCategoriesCompanion
    Function({
  Value<int> id,
  required String name,
  Value<String?> description,
  Value<String?> icon,
  Value<Priority?> priority,
});
typedef $$TaskCategoriesTableUpdateCompanionBuilder = TaskCategoriesCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<String?> description,
  Value<String?> icon,
  Value<Priority?> priority,
});

final class $$TaskCategoriesTableReferences
    extends BaseReferences<_$AppDatabase, $TaskCategoriesTable, TaskCategory> {
  $$TaskCategoriesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TaskTemplatesTable, List<TaskTemplate>>
      _taskTemplatesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.taskTemplates,
              aliasName: $_aliasNameGenerator(
                  db.taskCategories.id, db.taskTemplates.category));

  $$TaskTemplatesTableProcessedTableManager get taskTemplatesRefs {
    final manager = $$TaskTemplatesTableTableManager($_db, $_db.taskTemplates)
        .filter((f) => f.category.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_taskTemplatesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$TaskCategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $TaskCategoriesTable> {
  $$TaskCategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get icon => $composableBuilder(
      column: $table.icon, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Priority?, Priority, String> get priority =>
      $composableBuilder(
          column: $table.priority,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  Expression<bool> taskTemplatesRefs(
      Expression<bool> Function($$TaskTemplatesTableFilterComposer f) f) {
    final $$TaskTemplatesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.taskTemplates,
        getReferencedColumn: (t) => t.category,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TaskTemplatesTableFilterComposer(
              $db: $db,
              $table: $db.taskTemplates,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TaskCategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $TaskCategoriesTable> {
  $$TaskCategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get icon => $composableBuilder(
      column: $table.icon, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get priority => $composableBuilder(
      column: $table.priority, builder: (column) => ColumnOrderings(column));
}

class $$TaskCategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $TaskCategoriesTable> {
  $$TaskCategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get icon =>
      $composableBuilder(column: $table.icon, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Priority?, String> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

  Expression<T> taskTemplatesRefs<T extends Object>(
      Expression<T> Function($$TaskTemplatesTableAnnotationComposer a) f) {
    final $$TaskTemplatesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.taskTemplates,
        getReferencedColumn: (t) => t.category,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TaskTemplatesTableAnnotationComposer(
              $db: $db,
              $table: $db.taskTemplates,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TaskCategoriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TaskCategoriesTable,
    TaskCategory,
    $$TaskCategoriesTableFilterComposer,
    $$TaskCategoriesTableOrderingComposer,
    $$TaskCategoriesTableAnnotationComposer,
    $$TaskCategoriesTableCreateCompanionBuilder,
    $$TaskCategoriesTableUpdateCompanionBuilder,
    (TaskCategory, $$TaskCategoriesTableReferences),
    TaskCategory,
    PrefetchHooks Function({bool taskTemplatesRefs})> {
  $$TaskCategoriesTableTableManager(
      _$AppDatabase db, $TaskCategoriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TaskCategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TaskCategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TaskCategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> icon = const Value.absent(),
            Value<Priority?> priority = const Value.absent(),
          }) =>
              TaskCategoriesCompanion(
            id: id,
            name: name,
            description: description,
            icon: icon,
            priority: priority,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> description = const Value.absent(),
            Value<String?> icon = const Value.absent(),
            Value<Priority?> priority = const Value.absent(),
          }) =>
              TaskCategoriesCompanion.insert(
            id: id,
            name: name,
            description: description,
            icon: icon,
            priority: priority,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TaskCategoriesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({taskTemplatesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (taskTemplatesRefs) db.taskTemplates
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (taskTemplatesRefs)
                    await $_getPrefetchedData<TaskCategory,
                            $TaskCategoriesTable, TaskTemplate>(
                        currentTable: table,
                        referencedTable: $$TaskCategoriesTableReferences
                            ._taskTemplatesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TaskCategoriesTableReferences(db, table, p0)
                                .taskTemplatesRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.category == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$TaskCategoriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TaskCategoriesTable,
    TaskCategory,
    $$TaskCategoriesTableFilterComposer,
    $$TaskCategoriesTableOrderingComposer,
    $$TaskCategoriesTableAnnotationComposer,
    $$TaskCategoriesTableCreateCompanionBuilder,
    $$TaskCategoriesTableUpdateCompanionBuilder,
    (TaskCategory, $$TaskCategoriesTableReferences),
    TaskCategory,
    PrefetchHooks Function({bool taskTemplatesRefs})>;
typedef $$TaskTemplatesTableCreateCompanionBuilder = TaskTemplatesCompanion
    Function({
  Value<int> id,
  required String title,
  Value<String?> description,
  Value<Priority?> priority,
  Value<DateTime?> dueDate,
  Value<int> remindTime,
  Value<RecurrenceRule?> repeat,
  Value<int?> category,
  Value<bool> autoRepeat,
  Value<int?> parentTask,
});
typedef $$TaskTemplatesTableUpdateCompanionBuilder = TaskTemplatesCompanion
    Function({
  Value<int> id,
  Value<String> title,
  Value<String?> description,
  Value<Priority?> priority,
  Value<DateTime?> dueDate,
  Value<int> remindTime,
  Value<RecurrenceRule?> repeat,
  Value<int?> category,
  Value<bool> autoRepeat,
  Value<int?> parentTask,
});

final class $$TaskTemplatesTableReferences
    extends BaseReferences<_$AppDatabase, $TaskTemplatesTable, TaskTemplate> {
  $$TaskTemplatesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $TaskCategoriesTable _categoryTable(_$AppDatabase db) =>
      db.taskCategories.createAlias($_aliasNameGenerator(
          db.taskTemplates.category, db.taskCategories.id));

  $$TaskCategoriesTableProcessedTableManager? get category {
    final $_column = $_itemColumn<int>('category');
    if ($_column == null) return null;
    final manager = $$TaskCategoriesTableTableManager($_db, $_db.taskCategories)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $TaskTemplatesTable _parentTaskTable(_$AppDatabase db) =>
      db.taskTemplates.createAlias($_aliasNameGenerator(
          db.taskTemplates.parentTask, db.taskTemplates.id));

  $$TaskTemplatesTableProcessedTableManager? get parentTask {
    final $_column = $_itemColumn<int>('parent_task');
    if ($_column == null) return null;
    final manager = $$TaskTemplatesTableTableManager($_db, $_db.taskTemplates)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_parentTaskTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$TaskInstancesTable, List<TaskInstance>>
      _taskInstancesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.taskInstances,
              aliasName: $_aliasNameGenerator(
                  db.taskTemplates.id, db.taskInstances.taskTemplate));

  $$TaskInstancesTableProcessedTableManager get taskInstancesRefs {
    final manager = $$TaskInstancesTableTableManager($_db, $_db.taskInstances)
        .filter((f) => f.taskTemplate.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_taskInstancesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TaskTemplateTagJunctionTable,
      List<TaskTemplateTagJunctionData>> _taskTemplateTagJunctionRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.taskTemplateTagJunction,
          aliasName: $_aliasNameGenerator(
              db.taskTemplates.id, db.taskTemplateTagJunction.taskTemplate));

  $$TaskTemplateTagJunctionTableProcessedTableManager
      get taskTemplateTagJunctionRefs {
    final manager = $$TaskTemplateTagJunctionTableTableManager(
            $_db, $_db.taskTemplateTagJunction)
        .filter((f) => f.taskTemplate.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_taskTemplateTagJunctionRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$TaskTemplatesTableFilterComposer
    extends Composer<_$AppDatabase, $TaskTemplatesTable> {
  $$TaskTemplatesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Priority?, Priority, String> get priority =>
      $composableBuilder(
          column: $table.priority,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get dueDate => $composableBuilder(
      column: $table.dueDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get remindTime => $composableBuilder(
      column: $table.remindTime, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<RecurrenceRule?, RecurrenceRule, String>
      get repeat => $composableBuilder(
          column: $table.repeat,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<bool> get autoRepeat => $composableBuilder(
      column: $table.autoRepeat, builder: (column) => ColumnFilters(column));

  $$TaskCategoriesTableFilterComposer get category {
    final $$TaskCategoriesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.category,
        referencedTable: $db.taskCategories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TaskCategoriesTableFilterComposer(
              $db: $db,
              $table: $db.taskCategories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TaskTemplatesTableFilterComposer get parentTask {
    final $$TaskTemplatesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.parentTask,
        referencedTable: $db.taskTemplates,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TaskTemplatesTableFilterComposer(
              $db: $db,
              $table: $db.taskTemplates,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> taskInstancesRefs(
      Expression<bool> Function($$TaskInstancesTableFilterComposer f) f) {
    final $$TaskInstancesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.taskInstances,
        getReferencedColumn: (t) => t.taskTemplate,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TaskInstancesTableFilterComposer(
              $db: $db,
              $table: $db.taskInstances,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> taskTemplateTagJunctionRefs(
      Expression<bool> Function($$TaskTemplateTagJunctionTableFilterComposer f)
          f) {
    final $$TaskTemplateTagJunctionTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.taskTemplateTagJunction,
            getReferencedColumn: (t) => t.taskTemplate,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$TaskTemplateTagJunctionTableFilterComposer(
                  $db: $db,
                  $table: $db.taskTemplateTagJunction,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$TaskTemplatesTableOrderingComposer
    extends Composer<_$AppDatabase, $TaskTemplatesTable> {
  $$TaskTemplatesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get priority => $composableBuilder(
      column: $table.priority, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dueDate => $composableBuilder(
      column: $table.dueDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get remindTime => $composableBuilder(
      column: $table.remindTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get repeat => $composableBuilder(
      column: $table.repeat, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get autoRepeat => $composableBuilder(
      column: $table.autoRepeat, builder: (column) => ColumnOrderings(column));

  $$TaskCategoriesTableOrderingComposer get category {
    final $$TaskCategoriesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.category,
        referencedTable: $db.taskCategories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TaskCategoriesTableOrderingComposer(
              $db: $db,
              $table: $db.taskCategories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TaskTemplatesTableOrderingComposer get parentTask {
    final $$TaskTemplatesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.parentTask,
        referencedTable: $db.taskTemplates,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TaskTemplatesTableOrderingComposer(
              $db: $db,
              $table: $db.taskTemplates,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TaskTemplatesTableAnnotationComposer
    extends Composer<_$AppDatabase, $TaskTemplatesTable> {
  $$TaskTemplatesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Priority?, String> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

  GeneratedColumn<DateTime> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  GeneratedColumn<int> get remindTime => $composableBuilder(
      column: $table.remindTime, builder: (column) => column);

  GeneratedColumnWithTypeConverter<RecurrenceRule?, String> get repeat =>
      $composableBuilder(column: $table.repeat, builder: (column) => column);

  GeneratedColumn<bool> get autoRepeat => $composableBuilder(
      column: $table.autoRepeat, builder: (column) => column);

  $$TaskCategoriesTableAnnotationComposer get category {
    final $$TaskCategoriesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.category,
        referencedTable: $db.taskCategories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TaskCategoriesTableAnnotationComposer(
              $db: $db,
              $table: $db.taskCategories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TaskTemplatesTableAnnotationComposer get parentTask {
    final $$TaskTemplatesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.parentTask,
        referencedTable: $db.taskTemplates,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TaskTemplatesTableAnnotationComposer(
              $db: $db,
              $table: $db.taskTemplates,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> taskInstancesRefs<T extends Object>(
      Expression<T> Function($$TaskInstancesTableAnnotationComposer a) f) {
    final $$TaskInstancesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.taskInstances,
        getReferencedColumn: (t) => t.taskTemplate,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TaskInstancesTableAnnotationComposer(
              $db: $db,
              $table: $db.taskInstances,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> taskTemplateTagJunctionRefs<T extends Object>(
      Expression<T> Function($$TaskTemplateTagJunctionTableAnnotationComposer a)
          f) {
    final $$TaskTemplateTagJunctionTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.taskTemplateTagJunction,
            getReferencedColumn: (t) => t.taskTemplate,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$TaskTemplateTagJunctionTableAnnotationComposer(
                  $db: $db,
                  $table: $db.taskTemplateTagJunction,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$TaskTemplatesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TaskTemplatesTable,
    TaskTemplate,
    $$TaskTemplatesTableFilterComposer,
    $$TaskTemplatesTableOrderingComposer,
    $$TaskTemplatesTableAnnotationComposer,
    $$TaskTemplatesTableCreateCompanionBuilder,
    $$TaskTemplatesTableUpdateCompanionBuilder,
    (TaskTemplate, $$TaskTemplatesTableReferences),
    TaskTemplate,
    PrefetchHooks Function(
        {bool category,
        bool parentTask,
        bool taskInstancesRefs,
        bool taskTemplateTagJunctionRefs})> {
  $$TaskTemplatesTableTableManager(_$AppDatabase db, $TaskTemplatesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TaskTemplatesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TaskTemplatesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TaskTemplatesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<Priority?> priority = const Value.absent(),
            Value<DateTime?> dueDate = const Value.absent(),
            Value<int> remindTime = const Value.absent(),
            Value<RecurrenceRule?> repeat = const Value.absent(),
            Value<int?> category = const Value.absent(),
            Value<bool> autoRepeat = const Value.absent(),
            Value<int?> parentTask = const Value.absent(),
          }) =>
              TaskTemplatesCompanion(
            id: id,
            title: title,
            description: description,
            priority: priority,
            dueDate: dueDate,
            remindTime: remindTime,
            repeat: repeat,
            category: category,
            autoRepeat: autoRepeat,
            parentTask: parentTask,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            Value<String?> description = const Value.absent(),
            Value<Priority?> priority = const Value.absent(),
            Value<DateTime?> dueDate = const Value.absent(),
            Value<int> remindTime = const Value.absent(),
            Value<RecurrenceRule?> repeat = const Value.absent(),
            Value<int?> category = const Value.absent(),
            Value<bool> autoRepeat = const Value.absent(),
            Value<int?> parentTask = const Value.absent(),
          }) =>
              TaskTemplatesCompanion.insert(
            id: id,
            title: title,
            description: description,
            priority: priority,
            dueDate: dueDate,
            remindTime: remindTime,
            repeat: repeat,
            category: category,
            autoRepeat: autoRepeat,
            parentTask: parentTask,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TaskTemplatesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {category = false,
              parentTask = false,
              taskInstancesRefs = false,
              taskTemplateTagJunctionRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (taskInstancesRefs) db.taskInstances,
                if (taskTemplateTagJunctionRefs) db.taskTemplateTagJunction
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (category) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.category,
                    referencedTable:
                        $$TaskTemplatesTableReferences._categoryTable(db),
                    referencedColumn:
                        $$TaskTemplatesTableReferences._categoryTable(db).id,
                  ) as T;
                }
                if (parentTask) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.parentTask,
                    referencedTable:
                        $$TaskTemplatesTableReferences._parentTaskTable(db),
                    referencedColumn:
                        $$TaskTemplatesTableReferences._parentTaskTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (taskInstancesRefs)
                    await $_getPrefetchedData<TaskTemplate, $TaskTemplatesTable,
                            TaskInstance>(
                        currentTable: table,
                        referencedTable: $$TaskTemplatesTableReferences
                            ._taskInstancesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TaskTemplatesTableReferences(db, table, p0)
                                .taskInstancesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.taskTemplate == item.id),
                        typedResults: items),
                  if (taskTemplateTagJunctionRefs)
                    await $_getPrefetchedData<TaskTemplate, $TaskTemplatesTable,
                            TaskTemplateTagJunctionData>(
                        currentTable: table,
                        referencedTable: $$TaskTemplatesTableReferences
                            ._taskTemplateTagJunctionRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TaskTemplatesTableReferences(db, table, p0)
                                .taskTemplateTagJunctionRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.taskTemplate == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$TaskTemplatesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TaskTemplatesTable,
    TaskTemplate,
    $$TaskTemplatesTableFilterComposer,
    $$TaskTemplatesTableOrderingComposer,
    $$TaskTemplatesTableAnnotationComposer,
    $$TaskTemplatesTableCreateCompanionBuilder,
    $$TaskTemplatesTableUpdateCompanionBuilder,
    (TaskTemplate, $$TaskTemplatesTableReferences),
    TaskTemplate,
    PrefetchHooks Function(
        {bool category,
        bool parentTask,
        bool taskInstancesRefs,
        bool taskTemplateTagJunctionRefs})>;
typedef $$TaskInstancesTableCreateCompanionBuilder = TaskInstancesCompanion
    Function({
  Value<int> id,
  required int taskTemplate,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<bool> completed,
});
typedef $$TaskInstancesTableUpdateCompanionBuilder = TaskInstancesCompanion
    Function({
  Value<int> id,
  Value<int> taskTemplate,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> completed,
});

final class $$TaskInstancesTableReferences
    extends BaseReferences<_$AppDatabase, $TaskInstancesTable, TaskInstance> {
  $$TaskInstancesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $TaskTemplatesTable _taskTemplateTable(_$AppDatabase db) =>
      db.taskTemplates.createAlias($_aliasNameGenerator(
          db.taskInstances.taskTemplate, db.taskTemplates.id));

  $$TaskTemplatesTableProcessedTableManager get taskTemplate {
    final $_column = $_itemColumn<int>('task_template')!;

    final manager = $$TaskTemplatesTableTableManager($_db, $_db.taskTemplates)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_taskTemplateTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$TaskInstancesTableFilterComposer
    extends Composer<_$AppDatabase, $TaskInstancesTable> {
  $$TaskInstancesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get completed => $composableBuilder(
      column: $table.completed, builder: (column) => ColumnFilters(column));

  $$TaskTemplatesTableFilterComposer get taskTemplate {
    final $$TaskTemplatesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.taskTemplate,
        referencedTable: $db.taskTemplates,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TaskTemplatesTableFilterComposer(
              $db: $db,
              $table: $db.taskTemplates,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TaskInstancesTableOrderingComposer
    extends Composer<_$AppDatabase, $TaskInstancesTable> {
  $$TaskInstancesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get completed => $composableBuilder(
      column: $table.completed, builder: (column) => ColumnOrderings(column));

  $$TaskTemplatesTableOrderingComposer get taskTemplate {
    final $$TaskTemplatesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.taskTemplate,
        referencedTable: $db.taskTemplates,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TaskTemplatesTableOrderingComposer(
              $db: $db,
              $table: $db.taskTemplates,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TaskInstancesTableAnnotationComposer
    extends Composer<_$AppDatabase, $TaskInstancesTable> {
  $$TaskInstancesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get completed =>
      $composableBuilder(column: $table.completed, builder: (column) => column);

  $$TaskTemplatesTableAnnotationComposer get taskTemplate {
    final $$TaskTemplatesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.taskTemplate,
        referencedTable: $db.taskTemplates,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TaskTemplatesTableAnnotationComposer(
              $db: $db,
              $table: $db.taskTemplates,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TaskInstancesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TaskInstancesTable,
    TaskInstance,
    $$TaskInstancesTableFilterComposer,
    $$TaskInstancesTableOrderingComposer,
    $$TaskInstancesTableAnnotationComposer,
    $$TaskInstancesTableCreateCompanionBuilder,
    $$TaskInstancesTableUpdateCompanionBuilder,
    (TaskInstance, $$TaskInstancesTableReferences),
    TaskInstance,
    PrefetchHooks Function({bool taskTemplate})> {
  $$TaskInstancesTableTableManager(_$AppDatabase db, $TaskInstancesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TaskInstancesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TaskInstancesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TaskInstancesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> taskTemplate = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> completed = const Value.absent(),
          }) =>
              TaskInstancesCompanion(
            id: id,
            taskTemplate: taskTemplate,
            createdAt: createdAt,
            updatedAt: updatedAt,
            completed: completed,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int taskTemplate,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<bool> completed = const Value.absent(),
          }) =>
              TaskInstancesCompanion.insert(
            id: id,
            taskTemplate: taskTemplate,
            createdAt: createdAt,
            updatedAt: updatedAt,
            completed: completed,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TaskInstancesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({taskTemplate = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (taskTemplate) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.taskTemplate,
                    referencedTable:
                        $$TaskInstancesTableReferences._taskTemplateTable(db),
                    referencedColumn: $$TaskInstancesTableReferences
                        ._taskTemplateTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$TaskInstancesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TaskInstancesTable,
    TaskInstance,
    $$TaskInstancesTableFilterComposer,
    $$TaskInstancesTableOrderingComposer,
    $$TaskInstancesTableAnnotationComposer,
    $$TaskInstancesTableCreateCompanionBuilder,
    $$TaskInstancesTableUpdateCompanionBuilder,
    (TaskInstance, $$TaskInstancesTableReferences),
    TaskInstance,
    PrefetchHooks Function({bool taskTemplate})>;
typedef $$TaskTagsTableCreateCompanionBuilder = TaskTagsCompanion Function({
  Value<int> id,
  required String name,
});
typedef $$TaskTagsTableUpdateCompanionBuilder = TaskTagsCompanion Function({
  Value<int> id,
  Value<String> name,
});

final class $$TaskTagsTableReferences
    extends BaseReferences<_$AppDatabase, $TaskTagsTable, TaskTag> {
  $$TaskTagsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TaskTemplateTagJunctionTable,
      List<TaskTemplateTagJunctionData>> _taskTemplateTagJunctionRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.taskTemplateTagJunction,
          aliasName: $_aliasNameGenerator(
              db.taskTags.id, db.taskTemplateTagJunction.taskTag));

  $$TaskTemplateTagJunctionTableProcessedTableManager
      get taskTemplateTagJunctionRefs {
    final manager = $$TaskTemplateTagJunctionTableTableManager(
            $_db, $_db.taskTemplateTagJunction)
        .filter((f) => f.taskTag.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_taskTemplateTagJunctionRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$TaskTagsTableFilterComposer
    extends Composer<_$AppDatabase, $TaskTagsTable> {
  $$TaskTagsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  Expression<bool> taskTemplateTagJunctionRefs(
      Expression<bool> Function($$TaskTemplateTagJunctionTableFilterComposer f)
          f) {
    final $$TaskTemplateTagJunctionTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.taskTemplateTagJunction,
            getReferencedColumn: (t) => t.taskTag,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$TaskTemplateTagJunctionTableFilterComposer(
                  $db: $db,
                  $table: $db.taskTemplateTagJunction,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$TaskTagsTableOrderingComposer
    extends Composer<_$AppDatabase, $TaskTagsTable> {
  $$TaskTagsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));
}

class $$TaskTagsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TaskTagsTable> {
  $$TaskTagsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> taskTemplateTagJunctionRefs<T extends Object>(
      Expression<T> Function($$TaskTemplateTagJunctionTableAnnotationComposer a)
          f) {
    final $$TaskTemplateTagJunctionTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.taskTemplateTagJunction,
            getReferencedColumn: (t) => t.taskTag,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$TaskTemplateTagJunctionTableAnnotationComposer(
                  $db: $db,
                  $table: $db.taskTemplateTagJunction,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$TaskTagsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TaskTagsTable,
    TaskTag,
    $$TaskTagsTableFilterComposer,
    $$TaskTagsTableOrderingComposer,
    $$TaskTagsTableAnnotationComposer,
    $$TaskTagsTableCreateCompanionBuilder,
    $$TaskTagsTableUpdateCompanionBuilder,
    (TaskTag, $$TaskTagsTableReferences),
    TaskTag,
    PrefetchHooks Function({bool taskTemplateTagJunctionRefs})> {
  $$TaskTagsTableTableManager(_$AppDatabase db, $TaskTagsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TaskTagsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TaskTagsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TaskTagsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) =>
              TaskTagsCompanion(
            id: id,
            name: name,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
          }) =>
              TaskTagsCompanion.insert(
            id: id,
            name: name,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$TaskTagsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({taskTemplateTagJunctionRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (taskTemplateTagJunctionRefs) db.taskTemplateTagJunction
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (taskTemplateTagJunctionRefs)
                    await $_getPrefetchedData<TaskTag, $TaskTagsTable,
                            TaskTemplateTagJunctionData>(
                        currentTable: table,
                        referencedTable: $$TaskTagsTableReferences
                            ._taskTemplateTagJunctionRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TaskTagsTableReferences(db, table, p0)
                                .taskTemplateTagJunctionRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.taskTag == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$TaskTagsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TaskTagsTable,
    TaskTag,
    $$TaskTagsTableFilterComposer,
    $$TaskTagsTableOrderingComposer,
    $$TaskTagsTableAnnotationComposer,
    $$TaskTagsTableCreateCompanionBuilder,
    $$TaskTagsTableUpdateCompanionBuilder,
    (TaskTag, $$TaskTagsTableReferences),
    TaskTag,
    PrefetchHooks Function({bool taskTemplateTagJunctionRefs})>;
typedef $$TaskTemplateTagJunctionTableCreateCompanionBuilder
    = TaskTemplateTagJunctionCompanion Function({
  required int taskTemplate,
  required int taskTag,
  Value<int> rowid,
});
typedef $$TaskTemplateTagJunctionTableUpdateCompanionBuilder
    = TaskTemplateTagJunctionCompanion Function({
  Value<int> taskTemplate,
  Value<int> taskTag,
  Value<int> rowid,
});

final class $$TaskTemplateTagJunctionTableReferences extends BaseReferences<
    _$AppDatabase, $TaskTemplateTagJunctionTable, TaskTemplateTagJunctionData> {
  $$TaskTemplateTagJunctionTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $TaskTemplatesTable _taskTemplateTable(_$AppDatabase db) =>
      db.taskTemplates.createAlias($_aliasNameGenerator(
          db.taskTemplateTagJunction.taskTemplate, db.taskTemplates.id));

  $$TaskTemplatesTableProcessedTableManager get taskTemplate {
    final $_column = $_itemColumn<int>('task_template')!;

    final manager = $$TaskTemplatesTableTableManager($_db, $_db.taskTemplates)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_taskTemplateTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $TaskTagsTable _taskTagTable(_$AppDatabase db) =>
      db.taskTags.createAlias($_aliasNameGenerator(
          db.taskTemplateTagJunction.taskTag, db.taskTags.id));

  $$TaskTagsTableProcessedTableManager get taskTag {
    final $_column = $_itemColumn<int>('task_tag')!;

    final manager = $$TaskTagsTableTableManager($_db, $_db.taskTags)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_taskTagTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$TaskTemplateTagJunctionTableFilterComposer
    extends Composer<_$AppDatabase, $TaskTemplateTagJunctionTable> {
  $$TaskTemplateTagJunctionTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$TaskTemplatesTableFilterComposer get taskTemplate {
    final $$TaskTemplatesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.taskTemplate,
        referencedTable: $db.taskTemplates,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TaskTemplatesTableFilterComposer(
              $db: $db,
              $table: $db.taskTemplates,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TaskTagsTableFilterComposer get taskTag {
    final $$TaskTagsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.taskTag,
        referencedTable: $db.taskTags,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TaskTagsTableFilterComposer(
              $db: $db,
              $table: $db.taskTags,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TaskTemplateTagJunctionTableOrderingComposer
    extends Composer<_$AppDatabase, $TaskTemplateTagJunctionTable> {
  $$TaskTemplateTagJunctionTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$TaskTemplatesTableOrderingComposer get taskTemplate {
    final $$TaskTemplatesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.taskTemplate,
        referencedTable: $db.taskTemplates,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TaskTemplatesTableOrderingComposer(
              $db: $db,
              $table: $db.taskTemplates,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TaskTagsTableOrderingComposer get taskTag {
    final $$TaskTagsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.taskTag,
        referencedTable: $db.taskTags,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TaskTagsTableOrderingComposer(
              $db: $db,
              $table: $db.taskTags,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TaskTemplateTagJunctionTableAnnotationComposer
    extends Composer<_$AppDatabase, $TaskTemplateTagJunctionTable> {
  $$TaskTemplateTagJunctionTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$TaskTemplatesTableAnnotationComposer get taskTemplate {
    final $$TaskTemplatesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.taskTemplate,
        referencedTable: $db.taskTemplates,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TaskTemplatesTableAnnotationComposer(
              $db: $db,
              $table: $db.taskTemplates,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TaskTagsTableAnnotationComposer get taskTag {
    final $$TaskTagsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.taskTag,
        referencedTable: $db.taskTags,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TaskTagsTableAnnotationComposer(
              $db: $db,
              $table: $db.taskTags,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TaskTemplateTagJunctionTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TaskTemplateTagJunctionTable,
    TaskTemplateTagJunctionData,
    $$TaskTemplateTagJunctionTableFilterComposer,
    $$TaskTemplateTagJunctionTableOrderingComposer,
    $$TaskTemplateTagJunctionTableAnnotationComposer,
    $$TaskTemplateTagJunctionTableCreateCompanionBuilder,
    $$TaskTemplateTagJunctionTableUpdateCompanionBuilder,
    (TaskTemplateTagJunctionData, $$TaskTemplateTagJunctionTableReferences),
    TaskTemplateTagJunctionData,
    PrefetchHooks Function({bool taskTemplate, bool taskTag})> {
  $$TaskTemplateTagJunctionTableTableManager(
      _$AppDatabase db, $TaskTemplateTagJunctionTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TaskTemplateTagJunctionTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$TaskTemplateTagJunctionTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TaskTemplateTagJunctionTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> taskTemplate = const Value.absent(),
            Value<int> taskTag = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TaskTemplateTagJunctionCompanion(
            taskTemplate: taskTemplate,
            taskTag: taskTag,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int taskTemplate,
            required int taskTag,
            Value<int> rowid = const Value.absent(),
          }) =>
              TaskTemplateTagJunctionCompanion.insert(
            taskTemplate: taskTemplate,
            taskTag: taskTag,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TaskTemplateTagJunctionTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({taskTemplate = false, taskTag = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (taskTemplate) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.taskTemplate,
                    referencedTable: $$TaskTemplateTagJunctionTableReferences
                        ._taskTemplateTable(db),
                    referencedColumn: $$TaskTemplateTagJunctionTableReferences
                        ._taskTemplateTable(db)
                        .id,
                  ) as T;
                }
                if (taskTag) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.taskTag,
                    referencedTable: $$TaskTemplateTagJunctionTableReferences
                        ._taskTagTable(db),
                    referencedColumn: $$TaskTemplateTagJunctionTableReferences
                        ._taskTagTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$TaskTemplateTagJunctionTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $TaskTemplateTagJunctionTable,
        TaskTemplateTagJunctionData,
        $$TaskTemplateTagJunctionTableFilterComposer,
        $$TaskTemplateTagJunctionTableOrderingComposer,
        $$TaskTemplateTagJunctionTableAnnotationComposer,
        $$TaskTemplateTagJunctionTableCreateCompanionBuilder,
        $$TaskTemplateTagJunctionTableUpdateCompanionBuilder,
        (TaskTemplateTagJunctionData, $$TaskTemplateTagJunctionTableReferences),
        TaskTemplateTagJunctionData,
        PrefetchHooks Function({bool taskTemplate, bool taskTag})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TaskCategoriesTableTableManager get taskCategories =>
      $$TaskCategoriesTableTableManager(_db, _db.taskCategories);
  $$TaskTemplatesTableTableManager get taskTemplates =>
      $$TaskTemplatesTableTableManager(_db, _db.taskTemplates);
  $$TaskInstancesTableTableManager get taskInstances =>
      $$TaskInstancesTableTableManager(_db, _db.taskInstances);
  $$TaskTagsTableTableManager get taskTags =>
      $$TaskTagsTableTableManager(_db, _db.taskTags);
  $$TaskTemplateTagJunctionTableTableManager get taskTemplateTagJunction =>
      $$TaskTemplateTagJunctionTableTableManager(
          _db, _db.taskTemplateTagJunction);
}
