import 'package:flutter/foundation.dart';

class Loan {
  String name;
  int amount;
  DateTime due;

  Loan({
    @required this.name,
    @required this.amount,
    this.due,
  });
}