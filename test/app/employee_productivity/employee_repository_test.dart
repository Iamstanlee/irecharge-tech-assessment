import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_assessment/app/employee_productivity/repository/employee_repository.dart';
import 'package:mobile_assessment/app/employee_productivity/repository/employee_repository_impl.dart';
import 'package:mobile_assessment/core/http/http_client.dart';
import 'package:mocktail/mocktail.dart';

class MockHttpClient extends Mock implements HttpClient {}

void main() {
  late HttpClient httpClient;
  late IEmployeeRepository employeeRepository;

  setUp(() {
    httpClient = MockHttpClient();
    employeeRepository = EmployeeRepository(http: httpClient);
  });

  group('EmployeeRepository.getEmployees', () {
    test('should return list of employees', () async {
      when(() => httpClient.get(any())).thenAnswer((_) async => {'data': []});
      final response = await employeeRepository.getEmployees();
      expect(response.isRight, true);
    });

    test('should return error when request fail', () async {
      when(() => httpClient.get(any())).thenThrow('error');
      final response = await employeeRepository.getEmployees();
      expect(response.isLeft, true);
    });
  });
}
