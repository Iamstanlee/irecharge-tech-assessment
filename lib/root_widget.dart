import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_assessment/app/employee_productivity/bloc/employee_productivity_bloc.dart';
import 'package:mobile_assessment/app/employee_productivity/employee_list_page.dart';
import 'package:mobile_assessment/app/employee_productivity/repository/employee_repository.dart';
import 'package:mobile_assessment/app/employee_productivity/repository/employee_repository_impl.dart';
import 'package:mobile_assessment/core/constants.dart';
import 'package:mobile_assessment/core/design_system/theme.dart';
import 'package:mobile_assessment/core/http/http_client.dart';

final employeeRepository = EmployeeRepository(
  http: HttpClient(
    dio: Dio(
      BaseOptions(
        baseUrl: 'https://run.mocky.io/v3',
      ),
    ),
  ),
);

class MobileAssessmentApp extends StatefulWidget {
  final bool isDebug;

  const MobileAssessmentApp({Key? key, this.isDebug = false}) : super(key: key);

  @override
  State<MobileAssessmentApp> createState() => _MobileAssessmentAppState();
}

class _MobileAssessmentAppState extends State<MobileAssessmentApp> {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<IEmployeeRepository>(
      create: (_) => employeeRepository,
      child: MaterialApp(
        debugShowCheckedModeBanner: widget.isDebug,
        theme: AppTheme.light,
        home: const EmployeeListPage(),
        builder: (context, child) {
          return BlocProvider(
            create: (context) => EmployeeProductivityBloc(
              employeeRepository: context.read<IEmployeeRepository>(),
            ),
            child: MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: TextScaler.linear(AppConstants.appTextScaleFactor),
              ),
              child: child ?? const SizedBox(),
            ),
          );
        },
      ),
    );
  }
}
