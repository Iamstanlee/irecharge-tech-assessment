// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Employee _$EmployeeFromJson(Map<String, dynamic> json) => Employee(
      json['id'] as int,
      json['first_name'] as String,
      json['last_name'] as String,
      json['designation'] as String,
      (json['productivity_score'] as num).toDouble(),
      json['current_salary'] as String,
      json['level'] as int,
    );

Map<String, dynamic> _$EmployeeToJson(Employee instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'designation': instance.designation,
      'productivity_score': instance.productivityScore,
      'current_salary': instance.currentSalary,
      'level': instance.level,
    };
