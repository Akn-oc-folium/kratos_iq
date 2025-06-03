import 'package:kratos_iq/app/app.locator.dart';
import 'package:kratos_iq/app/app.router.dart';
import 'package:kratos_iq/services/device_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MainLayoutViewModel extends BaseViewModel {
  final _deviceService = locator<DeviceService>();
  final _routerService = locator<RouterService>();

  bool get isDevice => _deviceService.isDevice;

  void toggleDevice() {
    _deviceService.toggleDevice();
    _routerService.replaceWithStartupView();
  }
}
