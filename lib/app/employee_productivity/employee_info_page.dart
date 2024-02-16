import 'package:flutter/material.dart';
import 'package:mobile_assessment/app/employee_productivity/widgets/avatar.dart';
import 'package:mobile_assessment/core/design_system/color.dart';
import 'package:mobile_assessment/core/design_system/dimension.dart';
import 'package:mobile_assessment/core/design_system/typography.dart';
import 'package:mobile_assessment/core/enums/employment_status.dart';
import 'package:mobile_assessment/core/models/employee.model.dart';

class EmployeeInfoPage extends StatelessWidget {
  final Employee employee;

  const EmployeeInfoPage(this.employee, {super.key});

  @override
  Widget build(BuildContext context) {
    final employmentStatus = EmploymentStatus.fromProductivityScore(
      employee.productivityScore,
      employee.level,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(employee.fullName),
      ),
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            const SizedBox(height: AppDimension.md),
            Hero(
              tag: ValueKey(employee.id),
              child: EmployeeAvatar.large(employee.avatarUrl),
            ),
            const SizedBox(height: AppDimension.md),
            Text(
              employee.fullName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppDimension.sm),
            Text(
              "${employee.designation} \u2022 Level #${employee.level}",
              style: AppTypography.body1.copyWith(
                color: AppColor.gray300,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: AppDimension.lg),
            Text(
              "${employee.productivityScore}%",
              style: AppTypography.h1.copyWith(color: employmentStatus.color),
            ),
            Text("Productivity Score", style: AppTypography.body2),
            const SizedBox(height: AppDimension.lg),
            Text(
              "Employment Status: ${employmentStatus.text}\n"
              "New Salary: ${employmentStatus.getNewSalaryBasedOnLevel(employee.level)}",
              style: AppTypography.body1,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
