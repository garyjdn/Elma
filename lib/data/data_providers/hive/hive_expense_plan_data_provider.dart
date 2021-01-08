import 'package:elma/helpers/app_exception.dart';
import 'package:elma/models/expense_plan.dart';
import 'package:hive/hive.dart';

import '../interfaces/expense_plan_data_provider_interface.dart';

class HiveExpensePlanDataProvider implements ExpensePlanDataProviderInterface{
  static const boxName = "ExpensePlans";

  void createData(ExpensePlan expensePlan) async {
    try {
      Box<ExpensePlan> box = await Hive.openBox<ExpensePlan>(boxName);
      await box.add(expensePlan);
    } catch(e) {
      throw AppException(msg: e.toString());
    }
  }
  
  Future<List<ExpensePlan>> readData() async {
    try {
      Box<ExpensePlan> box = await Hive.openBox<ExpensePlan>(boxName);
      List<ExpensePlan> _expensePlans = box.values.toList();
      return _expensePlans;
    } catch(e) {
      throw AppException(msg: e.toString());
    }
  }

  void updateData(int id, ExpensePlan newExpensePlan) async {
    try {
      Box<ExpensePlan> box = await Hive.openBox<ExpensePlan>(boxName);
      box.put(id, newExpensePlan);
    } catch(e) {
      throw AppException(msg: e.toString());
    }
  }

  void deleteData(int id) async {
    try {
      Box<ExpensePlan> box = await Hive.openBox<ExpensePlan>(boxName);
      box.delete(id);
    } catch(e) {
      throw AppException(msg: e.toString());
    }
  }

  Future<ExpensePlan> getDataById(int id) async {
    try {
      Box<ExpensePlan> box = await Hive.openBox<ExpensePlan>(boxName);
      ExpensePlan _expensePlan = box.get(id);
      return _expensePlan;
    } catch(e) {
      throw AppException(msg: e.toString());
    }
  }
}