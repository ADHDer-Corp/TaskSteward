import 'package:drift/drift.dart';
import '../models/task.dart';
import 'package:tasksteward/data/models/converters/task_converter.dart';
import 'package:uuid/uuid.dart';
import 'package:rrule/rrule.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

import '../../core/enums/task_enums.dart';

part 'database.g.dart';

@DriftDatabase(tables: [TaskTemplates, TaskInstances, TaskTags, TaskCategories, TaskTemplateTagJunction])
class AppDatabase extends _$AppDatabase {

  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'app_database',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
      // TODO: Web 支持
    );
  }

}