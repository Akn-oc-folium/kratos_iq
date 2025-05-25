import 'package:flutter/widgets.dart';
import 'package:kratos_iq/app/app.locator.dart';
import 'package:kratos_iq/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RoleService with ListenableServiceMixin {
  final ReactiveValue<bool> _isStudent = ReactiveValue<bool>(true);
  final RouterService _routerService = locator<RouterService>();
  RoleService() {
    listenToReactiveValues([_isStudent]);
  }

  bool get isStudent => _isStudent.value;

  void toggleRole() {
    _isStudent.value = !_isStudent.value;
    _isStudent.value = isStudent;
    _routerService.replaceWithStartupView();
    notifyListeners();
  }
}
