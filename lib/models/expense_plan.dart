import 'package:hive/hive.dart';

import 'expense.dart';
import 'package:flutter/foundation.dart';

part 'expense_plan.g.dart';

@HiveType(typeId: 1)
class ExpensePlan {
  @HiveField(0)
  String name;
  @HiveField(1)
  String description;
  @HiveField(2)
  DateTime createdAt;
  @HiveField(3)
  List<Expense> expenses = [];

  ExpensePlan({
    @required this.name,
    this.description,
    @required this.createdAt,
    this.expenses,
  });
}