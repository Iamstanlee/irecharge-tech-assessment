import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_assessment/app/employee_productivity/bloc/employee_productivity_bloc.dart';
import 'package:mobile_assessment/app/employee_productivity/repository/employee_repository_impl.dart';
import 'package:mobile_assessment/core/http/error.dart';
import 'package:mobile_assessment/core/utils/either.dart';
import 'package:mocktail/mocktail.dart';

class MockEmployeeRepository extends Mock implements EmployeeRepository {}

void main() {
  late EmployeeRepository recipeRepository;
  late EmployeeProductivityBloc employeeProductivityBloc;
  setUp(() {
    recipeRepository = MockEmployeeRepository();
    employeeProductivityBloc =
        EmployeeProductivityBloc(employeeRepository: recipeRepository);
  });

  group('EmployeeProductivityBloc.getEmployeeList', () {
    test('initial state should be loading', () {
      expect(employeeProductivityBloc.state.isLoading, isTrue);
    });

    blocTest<EmployeeProductivityBloc, EmployeeProductivityState>(
      'should emit [loading, success] when success',
      setUp: () {
        when(() => recipeRepository.getEmployees()).thenAnswer(
          (_) async => const Right([]),
        );
      },
      build: () => employeeProductivityBloc,
      act: (bloc) =>
          bloc.add(const EmployeeProductivityEvent.getEmployeeList()),
      expect: () => const <EmployeeProductivityState>[
        EmployeeProductivityState(type: PageStateType.success),
      ],
      verify: (bloc) {
        expect(bloc.state.isSuccess, isTrue);
      },
    );

    blocTest<EmployeeProductivityBloc, EmployeeProductivityState>(
      'should emit [loading, error] when failed',
      setUp: () {
        when(() => recipeRepository.getEmployees()).thenAnswer(
          (_) async => Left(
            Failure.fromStr("error"),
          ),
        );
      },
      build: () => employeeProductivityBloc,
      act: (bloc) =>
          bloc.add(const EmployeeProductivityEvent.getEmployeeList()),
      expect: () => const <EmployeeProductivityState>[
        EmployeeProductivityState(
          type: PageStateType.error,
          error: "error",
        ),
      ],
      verify: (bloc) {
        expect(bloc.state.hasError, isTrue);
      },
    );
  });
}
