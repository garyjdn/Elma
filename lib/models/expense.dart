import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'expense.g.dart';

@HiveType(typeId: 2)
class Expense {
  @HiveField(0)
  String name;
  @HiveField(1)
  int amount;
  @HiveField(2)
  bool paid;

  Expense({
    @required this.name,
    @required this.amount,
    this.paid = false,
  });
}