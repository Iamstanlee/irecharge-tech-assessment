import 'package:flutter/material.dart';

enum EmploymentStatus {
  promoted,
  demoted,
  terminated,
  nil;

  static EmploymentStatus fromProductivityScore(double score, int level) {
    if (score <= 39) {
      return EmploymentStatus.terminated;
    } else if (score <= 49) {
      // terminate level 0 employees instead of demotion
      if (level == 0) {
        return EmploymentStatus.terminated;
      }
      return EmploymentStatus.demoted;
    } else if (score <= 79) {
      return EmploymentStatus.nil;
    } else {
      return EmploymentStatus.promoted;
    }
  }

  String getNewSalaryBasedOnLevel(int level) => switch (this) {
        EmploymentStatus.promoted => switch (level) {
            0 => "70,000",
            1 => "100,000",
            2 => "120,000",
            3 => "180,000",
            4 => "200,000",
            5 => "250,000",
            _ => "n/a",
          },
        _ => "n/a",
      };

  String get text => switch (this) {
        EmploymentStatus.promoted => "Promoted",
        EmploymentStatus.demoted => "Demoted",
        EmploymentStatus.terminated => "Terminated",
        EmploymentStatus.nil => "Employed",
      };

  Color get color => switch (this) {
        EmploymentStatus.promoted => Colors.green,
        EmploymentStatus.demoted => Colors.orange,
        EmploymentStatus.terminated => Colors.red,
        EmploymentStatus.nil => Colors.black,
      };
}
