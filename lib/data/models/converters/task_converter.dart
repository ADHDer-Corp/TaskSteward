import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:rrule/rrule.dart';

import '../../../core/enums/task_enums.dart';

class RRuleConverter extends TypeConverter<RecurrenceRule?, String?> {
  const RRuleConverter();

  @override
  RecurrenceRule? fromSql(String? fromDb) {
    if (fromDb == null) {
      return null;
    }
    return RecurrenceRule.fromString(fromDb);
  }

  @override
  String? toSql(RecurrenceRule? value) {
    if (value == null) {
      return null;
    }
    return value.toString();
  }

}
