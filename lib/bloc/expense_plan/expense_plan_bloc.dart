import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:elma/data/repositories/expense_plan_repository.dart';
import 'package:elma/models/expense_plan.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'expense_plan_event.dart';
part 'expense_plan_state.dart';

class ExpensePlanBloc extends Bloc<ExpensePlanEvent, ExpensePlanState> {

  ExpensePlanRepositoryInterface _expensePlanRepository;

  ExpensePlanBloc(ExpensePlanRepositoryInterface expensePlanRepository) : super(ExpensePlanInitial()) {
     assert(expensePlanRepository != null);
    _expensePlanRepository = expensePlanRepository;
  } 

  @override
  Stream<ExpensePlanState> mapEventToState(
    ExpensePlanEvent event,
  ) async* {
    if(event is FetchExpensePlan) {
      yield* _fetchExpensePlan();
    } else if(event is AddExpensePlan) {
      yield* _addExpensePlan();
    } else if(event is RemoveExpensePlan) {
      yield* _removeExpensePlan();
    }
  }

  Stream<ExpensePlanState> _fetchExpensePlan() async* {
    yield ExpensePlanLoadInProgress();
    List<ExpensePlan> expensePlans = await _expensePlanRepository.fetchExpensePlans();
    yield ExpensePlanLoadSuccess(expensePlans: expensePlans);
  }

  Stream<ExpensePlanState> _addExpensePlan() async* {

  }

  Stream<ExpensePlanState> _removeExpensePlan() async* {

  }
}
