import 'package:flutter/material.dart';

class EmployeeAvatar extends StatelessWidget {
  final String imageUrl;
  final double size;

  const EmployeeAvatar._(this.imageUrl, this.size);

  factory EmployeeAvatar.medium(String imageUrl) {
    return EmployeeAvatar._(imageUrl, 27);
  }

  factory EmployeeAvatar.large(String imageUrl) {
    return EmployeeAvatar._(imageUrl, 64);
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size,
      backgroundImage: NetworkImage(imageUrl),
    );
  }
}
