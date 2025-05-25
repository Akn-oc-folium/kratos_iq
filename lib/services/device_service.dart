import 'package:stacked/stacked.dart';

class DeviceService with ListenableServiceMixin {
  final ReactiveValue<bool> _isDevice = ReactiveValue<bool>(false);

  DeviceService() {
    listenToReactiveValues([_isDevice]);
  }

  bool get isDevice => _isDevice.value;

  void toggleDevice() {
    _isDevice.value = !_isDevice.value;
    _isDevice.value = isDevice;
    notifyListeners();
  }
}
