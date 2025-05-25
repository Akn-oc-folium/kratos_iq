import 'package:flutter/material.dart';
import 'package:kratos_iq/app/app.locator.dart';
import 'package:kratos_iq/services/role_service.dart';

class RoleToggle extends StatefulWidget {
  const RoleToggle({super.key});

  @override
  State<RoleToggle> createState() => _RoleToggleState();
}

class _RoleToggleState extends State<RoleToggle> {
  final RoleService _roleService = locator<RoleService>();

  @override
  Widget build(BuildContext context) {
    bool isStudent = _roleService.isStudent;

    return ToggleButtons(
      borderRadius: BorderRadius.circular(8),
      isSelected: [isStudent, !isStudent],
      onPressed: (index) {
        setState(() {
          _roleService.toggleRole();
          print("current role: ${_roleService.isStudent}");
        });
      },
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text('Student'),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text('Teacher'),
        ),
      ],
    );
  }
}
