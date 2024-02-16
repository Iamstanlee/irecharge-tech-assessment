import 'package:flutter/material.dart';
import 'package:mobile_assessment/app/employee_productivity/employee_info_page.dart';
import 'package:mobile_assessment/app/employee_productivity/widgets/avatar.dart';
import 'package:mobile_assessment/core/design_system/color.dart';
import 'package:mobile_assessment/core/design_system/typography.dart';
import 'package:mobile_assessment/core/extensions/context.extension.dart';
import 'package:mobile_assessment/core/models/employee.model.dart';

class EmployeeListItem extends StatelessWidget {
  final Employee employee;

  const EmployeeListItem(this.employee, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => context.push(EmployeeInfoPage(employee)),
      title: Text(employee.fullName),
      subtitle: Text(
        "${employee.designation} \u2022 Level #${employee.level}",
        style: AppTypography.body1.copyWith(
          color: AppColor.gray300,
          fontSize: 14,
        ),
      ),
      trailing: Text(
        "${employee.productivityScore}%",
        style: AppTypography.body1,
      ),
      leading: Hero(
        tag: ValueKey(employee.id),
        child: EmployeeAvatar.medium(employee.avatarUrl),
      ),
    );
  }
}
