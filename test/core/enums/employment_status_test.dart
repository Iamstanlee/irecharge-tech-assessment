import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_assessment/core/enums/employment_status.dart';

void main() {
  group('EmploymentStatus', () {
    group('.fromProductivityScore', () {
      test('should correct status based on productivity score', () {
        expect(
          EmploymentStatus.fromProductivityScore(39, 0),
          EmploymentStatus.terminated,
        );
        expect(
          EmploymentStatus.fromProductivityScore(49, 0),
          EmploymentStatus.terminated,
        );
        expect(
          EmploymentStatus.fromProductivityScore(79, 0),
          EmploymentStatus.nil,
        );
        expect(
          EmploymentStatus.fromProductivityScore(80, 0),
          EmploymentStatus.promoted,
        );
        expect(
          EmploymentStatus.fromProductivityScore(49, 1),
          EmploymentStatus.demoted,
        );
      });
    });

    group('.getNewSalaryBasedOnLevel', () {
      test('should return correct salary based on level', () {
        expect(
          EmploymentStatus.promoted.getNewSalaryBasedOnLevel(0),
          "70,000",
        );
        expect(
          EmploymentStatus.promoted.getNewSalaryBasedOnLevel(1),
          "100,000",
        );
        expect(
          EmploymentStatus.promoted.getNewSalaryBasedOnLevel(2),
          "120,000",
        );
        expect(
          EmploymentStatus.promoted.getNewSalaryBasedOnLevel(3),
          "180,000",
        );
        expect(
          EmploymentStatus.promoted.getNewSalaryBasedOnLevel(4),
          "200,000",
        );
        expect(
          EmploymentStatus.promoted.getNewSalaryBasedOnLevel(5),
          "250,000",
        );
        expect(
          EmploymentStatus.promoted.getNewSalaryBasedOnLevel(6),
          "n/a",
        );
        expect(
          EmploymentStatus.demoted.getNewSalaryBasedOnLevel(6),
          "n/a",
        );
      });
    });

    group('.text', () {
      test('should return correct text', () {
        expect(
          EmploymentStatus.promoted.text,
          "Promoted",
        );
        expect(
          EmploymentStatus.demoted.text,
          "Demoted",
        );
        expect(
          EmploymentStatus.terminated.text,
          "Terminated",
        );
        expect(
          EmploymentStatus.nil.text,
          "Employed",
        );
      });
    });

    group('.color', () {
      test('should return correct color', () {
        expect(
          EmploymentStatus.promoted.color,
          Colors.green,
        );
        expect(
          EmploymentStatus.demoted.color,
          Colors.orange,
        );
        expect(
          EmploymentStatus.terminated.color,
          Colors.red,
        );
        expect(
          EmploymentStatus.nil.color,
          Colors.black,
        );
      });
    });
  });
}
