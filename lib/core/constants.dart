class AppConstants {
  const AppConstants._();

  static String get primaryTypeface => 'Rubik';

  static double get appTextScaleFactor => 0.85;
}

enum AppStorageKeys {
  employeeList('employee_list');

  final String value;

  const AppStorageKeys(this.value);
}
