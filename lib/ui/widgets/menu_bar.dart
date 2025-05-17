import 'package:shadcn_flutter/shadcn_flutter.dart';

class MenuToggle extends StatelessWidget {
  const MenuToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Menubar(
      children: [
        MenuButton(child: Text('Student')),
        MenuButton(child: Text('Teacher'))
      ],
    );
  }
}
