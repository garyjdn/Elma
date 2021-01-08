import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'expense_list_event.dart';
part 'expense_list_state.dart';

class ExpenseListBloc extends Bloc<ExpenseListEvent, ExpenseListState> {
  ExpenseListBloc() : super(ExpenseListInitial());

  @override
  Stream<ExpenseListState> mapEventToState(
    ExpenseListEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
