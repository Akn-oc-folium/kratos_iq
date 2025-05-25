import 'package:kratos_iq/app/app.locator.dart';
import 'package:kratos_iq/services/role_service.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final _roleService = locator<RoleService>();

  HomeViewModel() {
    _roleService.addListener(notifyListeners);
  }

  bool get isStudent => _roleService.isStudent;

  void toggleRole() {
    _roleService.toggleRole();
    notifyListeners();
  }

  @override
  void dispose() {
    _roleService.removeListener(notifyListeners);
    super.dispose();
  }
}
