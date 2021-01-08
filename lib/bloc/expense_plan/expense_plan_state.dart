part of 'expense_plan_bloc.dart';

@immutable
abstract class ExpensePlanState extends Equatable {}

class ExpensePlanInitial extends ExpensePlanState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ExpensePlanLoadInProgress extends ExpensePlanState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ExpensePlanLoadSuccess extends ExpensePlanState {
  final List<ExpensePlan> expensePlans;

  ExpensePlanLoadSuccess({@required this.expensePlans})
    : assert(expensePlans != null);

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ExpensePlanLoadFailure extends ExpensePlanState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}