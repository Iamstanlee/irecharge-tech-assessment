// coverage:ignore-file
part of 'employee_productivity_bloc.dart';

sealed class EmployeeProductivityEvent {
  const EmployeeProductivityEvent();

  const factory EmployeeProductivityEvent.getEmployeeList() =
      _GetEmployeeListEvent;
}

class _GetEmployeeListEvent extends EmployeeProductivityEvent {
  const _GetEmployeeListEvent();
}
