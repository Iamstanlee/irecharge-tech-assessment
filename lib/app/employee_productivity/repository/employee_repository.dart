import 'package:mobile_assessment/core/http/error.dart';
import 'package:mobile_assessment/core/models/employee.model.dart';
import 'package:mobile_assessment/core/utils/either.dart';

abstract class IEmployeeRepository {
  Future<Either<Failure, List<Employee>>> getEmployees();
}
