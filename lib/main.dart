import 'package:kratos_iq/ui/common/app_themes.dart';
import 'package:kratos_iq/ui/widgets/mouse_scroll.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:kratos_iq/app/app.bottomsheets.dart';
import 'package:kratos_iq/app/app.dialogs.dart';
import 'package:kratos_iq/app/app.locator.dart';
import 'package:kratos_iq/app/app.router.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:flutter_animate/flutter_animate.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  await setupLocator(stackedRouter: stackedRouter);
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(
      builder: (_) => ShadcnApp.router(
        scrollBehavior: MouseFriendlyScrollBehavior(),
        theme: AppThemes.getTheme(),
        routerDelegate: stackedRouter.delegate(),
        routeInformationParser: stackedRouter.defaultRouteParser(),
      ),
    ).animate().fadeIn(
          delay: const Duration(milliseconds: 50),
          duration: const Duration(milliseconds: 400),
        );
  }
}
