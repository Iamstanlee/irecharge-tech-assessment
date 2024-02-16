import 'package:mobile_assessment/app/employee_productivity/repository/employee_repository.dart';
import 'package:mobile_assessment/core/http/error.dart';
import 'package:mobile_assessment/core/http/http_client.dart';
import 'package:mobile_assessment/core/models/employee.model.dart';
import 'package:mobile_assessment/core/utils/either.dart';

class EmployeeRepository implements IEmployeeRepository {
  final HttpClient _http;

  EmployeeRepository({
    required HttpClient http,
  }) : _http = http;

  @override
  Future<Either<Failure, List<Employee>>> getEmployees() async {
    // check network connection and cache availability
    final result = await runAsyncBlock(
      () => _http.get(
        '/1ac71c7a-50db-4ad2-b5d9-1d2723d9c0a8',
      ),
    );

    return result.fold(
      (failure) => Left(failure),
      (res) {
        return Right(
          List<Employee>.from(
            res['data'].map(
              (json) => Employee.fromJson(json),
            ),
          ),
        );
      },
    );
  }
}
