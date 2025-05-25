import 'package:flutter/material.dart';
import 'package:kratos_iq/gen/assets.gen.dart';
import 'package:kratos_iq/ui/common/app_colors.dart';
import 'package:kratos_iq/ui/widgets/menu_bar.dart';
import 'package:stacked/stacked.dart';

import 'main_layout_viewmodel.dart';

class MainLayoutViewDesktop extends ViewModelWidget<MainLayoutViewModel> {
  final Widget body;
  const MainLayoutViewDesktop({super.key, required this.body});

  @override
  Widget build(BuildContext context, MainLayoutViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 200,
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(64, 16, 0, 16),
          child: Image.asset(
            Assets.images.logo.path,
            width: 102,
            height: 24,
            fit: BoxFit.contain,
          ),
        ),
        title: const Row(
          children: [
            SizedBox(
              width: 427,
            ),
            ElevatedButton(onPressed: null, child: Text('Home')),
            SizedBox(width: 16),
            ElevatedButton(onPressed: null, child: Text('IQ Sense')),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 64.0),
            child: RoleToggle(),
          ),
        ],
      ),
      backgroundColor: kcWhite,
      body: body,
    );
  }
}
