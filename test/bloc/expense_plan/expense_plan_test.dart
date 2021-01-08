import 'package:elma/bloc/expense_plan/expense_plan_bloc.dart';
import 'package:elma/data/repositories/expense_plan_repository.dart';
import 'package:elma/models/expense_plan.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';

class MockExpensePlanRepository extends Mock implements ExpensePlanRepositoryInterface {} 

void main() {
  ExpensePlanBloc expensePlanBloc;
  MockExpensePlanRepository mockExpensePlanRepository;
  DateTime mockDateTime;

  test('Given null repository while instantiating bloc, Then throws AssertionError', () {
    expect(
      () => ExpensePlanBloc(mockExpensePlanRepository),
      throwsA(isAssertionError),
    );
  });
  
  group('Fetch Expense Plan', () {
    setUp(() {
      mockDateTime = DateTime.now();
      mockExpensePlanRepository = MockExpensePlanRepository();
      expensePlanBloc = ExpensePlanBloc(mockExpensePlanRepository);
    });

    test('Given bloc instantiated, Then the initial state is ExpensePlanInitial1', () {
      expect(expensePlanBloc.state, ExpensePlanInitial());
    });

    ExpensePlanBloc buildBlocWithSuccessFetchRepository(MockExpensePlanRepository mockExpensePlanRepository) {
      when(mockExpensePlanRepository.fetchExpensePlans()).thenAnswer((_) => Future.value([
        ExpensePlan(
          name: "test plan", 
          createdAt: mockDateTime
        )
      ]));
      return ExpensePlanBloc(mockExpensePlanRepository);
    }

    blocTest(
      'Given some state, When FetchExpensePlan event added And fetch success, Then yield Load and LoadSuccessState',
      build: () => buildBlocWithSuccessFetchRepository(mockExpensePlanRepository),
      act: (bloc) => bloc..add(FetchExpensePlan()),
      expect: [
        ExpensePlanLoadInProgress(),
        ExpensePlanLoadSuccess(
          expensePlans: [
            ExpensePlan(name: "test plan", createdAt: mockDateTime),
          ]
        ),
      ]
    );

    ExpensePlanBloc buildBlocWithFailedFetchRepository(MockExpensePlanRepository mockExpensePlanRepository) {
      when(mockExpensePlanRepository.fetchExpensePlans()).thenAnswer((_) => Future.value([
        ExpensePlan(
          name: "test plan",
          createdAt: mockDateTime,
        )
      ]));
      return ExpensePlanBloc(mockExpensePlanRepository);
    }

    blocTest(
      'Given some state, When FetchExpensePlan event added And fetch failure, Then yield Load and ExpensePlanLoadFailure',
      build: () => buildBlocWithSuccessFetchRepository(mockExpensePlanRepository),
      act: (bloc) => bloc..add(FetchExpensePlan()),
      expect: [
        ExpensePlanLoadInProgress(),
        ExpensePlanLoadFailure(),
      ]
    );

  });
}