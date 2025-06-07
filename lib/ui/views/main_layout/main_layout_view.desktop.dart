import 'package:flutter/material.dart' as material;
import 'package:kratos_iq/gen/assets.gen.dart';
import 'package:kratos_iq/ui/common/app_colors.dart';
import 'package:kratos_iq/ui/widgets/role_toggle.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:stacked/stacked.dart';

import 'main_layout_viewmodel.dart';

class MainLayoutViewDesktop extends ViewModelWidget<MainLayoutViewModel> {
  final Widget body;
  const MainLayoutViewDesktop({super.key, required this.body});

  @override
  Widget build(BuildContext context, MainLayoutViewModel viewModel) {
    return material.Scaffold(
      appBar: material.AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 166,
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(64, 16, 0, 16),
          child: Image.asset(
            Assets.images.logo.path,
            width: 102,
            height: 24,
          ),
        ),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            material.MenuItemButton(
              style: material.ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  viewModel.isDevice ? Colors.lime[300] : Colors.gray[100],
                ),
                foregroundColor: WidgetStateProperty.all(Colors.zinc[900]),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
                padding: WidgetStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                ),
              ),
              onPressed: viewModel.isDevice ? null : viewModel.toggleDevice,
              child: const Text('Home').small.medium(height: 1.428),
            ),
            const SizedBox(width: 16),
            material.MenuItemButton(
              style: material.ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  viewModel.isDevice ? Colors.gray[100] : Colors.lime[300],
                ),
                foregroundColor: WidgetStateProperty.all(Colors.zinc[900]),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
                padding: WidgetStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                ),
              ),
              onPressed: viewModel.isDevice ? viewModel.toggleDevice : null,
              child: const Text('IQ Sense').small.medium(height: 1.428),
            ),
          ],
        ),
        actionsPadding: const EdgeInsets.only(right: 64.0),
        actions: const [
          RoleToggle(),
        ],
      ),
      backgroundColor: kcWhite,
      body: body,
    );
  }
}
