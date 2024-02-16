import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_assessment/app/employee_productivity/repository/employee_repository.dart';
import 'package:mobile_assessment/core/models/employee.model.dart';

part 'employee_productivity_event.dart';
part 'employee_productivity_state.dart';

class EmployeeProductivityBloc
    extends Bloc<EmployeeProductivityEvent, EmployeeProductivityState> {
  final IEmployeeRepository employeeRepository;

  EmployeeProductivityBloc({required this.employeeRepository})
      : super(const EmployeeProductivityState()) {
    on<_GetEmployeeListEvent>(_onGetEmployeeList);
  }

  void _onGetEmployeeList(
    _GetEmployeeListEvent event,
    Emitter<EmployeeProductivityState> emit,
  ) async {
    if (!state.isLoading) {
      emit(state.copyWith(type: PageStateType.loading));
    }
    final response = await employeeRepository.getEmployees();
    response.fold(
      (failure) => emit(
        state.copyWith(
          type: PageStateType.error,
          error: failure.message,
        ),
      ),
      (employees) {
        emit(
          state.copyWith(
            type: PageStateType.success,
            employees: employees,
          ),
        );
      },
    );
  }
}
