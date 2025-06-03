import 'package:kratos_iq/app/app.router.dart';
import 'package:kratos_iq/services/device_service.dart';
import 'package:kratos_iq/services/role_service.dart';
import 'package:stacked/stacked.dart';
import 'package:kratos_iq/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _routerService = locator<RouterService>();
  final RoleService _roleService = locator<RoleService>();
  final DeviceService _deviceService = locator<DeviceService>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic

    _deviceService.isDevice
        ? _roleService.isStudent
            ? await _routerService.replaceWithStudentHomeView()
            : await _routerService.replaceWithTeacherHomeView()
        : await _routerService.replaceWithVideoFeedView();
  }
}
