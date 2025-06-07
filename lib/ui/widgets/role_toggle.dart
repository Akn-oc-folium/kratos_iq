import 'package:kratos_iq/app/app.locator.dart';
import 'package:kratos_iq/services/role_service.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class RoleToggle extends StatefulWidget {
  const RoleToggle({super.key});

  @override
  State<RoleToggle> createState() => _RoleToggleState();
}

class _RoleToggleState extends State<RoleToggle> {
  final RoleService _roleService = locator<RoleService>();

  @override
  void initState() {
    super.initState();
    _roleService.addListener(_onRoleChanged);
  }

  void _onRoleChanged() => setState(() {});

  @override
  void dispose() {
    _roleService.removeListener(_onRoleChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isStudent = _roleService.isStudent;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Toggle(
          value: isStudent,
          style: const ButtonStyle.outline(density: ButtonDensity.compact),
          onChanged: (v) {
            if (!isStudent) _roleService.toggleRole();
          },
          child: const Text('Student').small.medium(height: 1.428).center(),
        ).sized(width: 80, height: 32),
        Toggle(
          value: !isStudent,
          style: const ButtonStyle.outline(density: ButtonDensity.compact),
          onChanged: (v) {
            if (isStudent) _roleService.toggleRole();
          },
          child: const Text('Teacher').small.medium(height: 1.428).center(),
        ).sized(width: 80, height: 32),
      ],
    ).gap(4);
  }
}
