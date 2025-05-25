import 'package:flutter_test/flutter_test.dart';
import 'package:kratos_iq/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('RoleServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
