

import 'package:elma/data/data_providers/interfaces/expense_plan_data_provider_interface.dart';

import '../../models/expense_plan.dart';

abstract class ExpensePlanRepositoryInterface {
  Future<List<ExpensePlan>> fetchExpensePlans();
}

class ExpensePlanRepository implements ExpensePlanRepositoryInterface {
  final ExpensePlanDataProviderInterface expensePlanDataProviderInterface;

  ExpensePlanRepository(this.expensePlanDataProviderInterface);


  Future<List<ExpensePlan>> fetchExpensePlans() async {
    List<ExpensePlan> expensePlans = await expensePlanDataProviderInterface.readData();
  }
}