part of 'employee_productivity_bloc.dart';

enum PageStateType {
  loading,
  error,
  success,
}

class EmployeeProductivityState extends Equatable {
  final PageStateType type;
  final String? error;
  final List<Employee> employees;

  const EmployeeProductivityState({
    this.type = PageStateType.loading,
    this.employees = const [],
    this.error,
  });

  EmployeeProductivityState copyWith({
    PageStateType? type,
    String? error,
    List<Employee>? employees,
  }) {
    return EmployeeProductivityState(
      type: type ?? this.type,
      error: error ?? this.error,
      employees: employees ?? this.employees,
    );
  }

  @override
  List<Object?> get props => [
        type,
        error,
        employees,
      ];
}

extension EmployeeProductivityStateExtension on EmployeeProductivityState {
  bool get isLoading => type == PageStateType.loading;

  bool get hasError => type == PageStateType.error;

  bool get isSuccess => type == PageStateType.success;
}

extension EmployeeFilterExtension on List<Employee> {
  List<Employee> filterByNameLevelOrDesignation(String value) {
    if (value.isEmpty) {
      return this;
    }
    return where((employee) {
      return employee.fullName.toLowerCase().contains(value.toLowerCase()) ||
          employee.level.toString() == value.toLowerCase() ||
          employee.designation.toLowerCase().contains(value.toLowerCase());
    }).toList();
  }
}
