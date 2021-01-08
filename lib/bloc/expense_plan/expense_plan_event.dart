part of 'expense_plan_bloc.dart';

@immutable
abstract class ExpensePlanEvent {}

class FetchExpensePlan extends ExpensePlanEvent {}

class AddExpensePlan extends ExpensePlanEvent {
  final String name;

  AddExpensePlan({
    @required this.name
  });
}

class RemoveExpensePlan extends ExpensePlanEvent {
  final String id;

  RemoveExpensePlan({
    @required this.id
  });
}