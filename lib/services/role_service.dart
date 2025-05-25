import 'package:stacked/stacked.dart';

class RoleService with ListenableServiceMixin {
  final ReactiveValue<bool> _isStudent = ReactiveValue<bool>(true);

  RoleService() {
    listenToReactiveValues([_isStudent]);
  }

  bool get isStudent => _isStudent.value;

  void toggleRole() {
    _isStudent.value = !_isStudent.value;
    _isStudent.value = isStudent;
    notifyListeners();
  }
}
