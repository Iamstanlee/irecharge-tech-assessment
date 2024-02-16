import 'package:json_annotation/json_annotation.dart';

part 'employee.model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Employee {
  final int id;
  final String firstName;
  final String lastName;
  final String designation;
  final double productivityScore;
  final String currentSalary;
  final int level;

  Employee(
    this.id,
    this.firstName,
    this.lastName,
    this.designation,
    this.productivityScore,
    this.currentSalary,
    this.level,
  );

  String get fullName => '$firstName $lastName';

  String get avatarUrl => 'https://api.dicebear.com/7.x/miniavs/png?seed=$id';

  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);
}
