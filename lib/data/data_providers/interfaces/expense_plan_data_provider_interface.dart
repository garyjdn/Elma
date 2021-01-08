import 'package:elma/models/expense_plan.dart';

abstract class ExpensePlanDataProviderInterface {
  void createData(ExpensePlan expensePlan);
  void updateData(int id, ExpensePlan newExpensePlan);
  void deleteData(int id);
  Future<List<ExpensePlan>> readData();
  Future<ExpensePlan> getDataById(int id);
}