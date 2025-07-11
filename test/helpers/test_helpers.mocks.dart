// Mocks generated by Mockito 5.4.5 from annotations
// in kratos_iq/test/helpers/test_helpers.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i11;
import 'dart:ui' as _i14;

import 'package:flutter/material.dart' as _i12;
import 'package:kratos_iq/models/flashcards_by_lecture_model.dart' as _i8;
import 'package:kratos_iq/models/flashcards_overview_model.dart' as _i7;
import 'package:kratos_iq/models/lecture_detail.model.dart' as _i9;
import 'package:kratos_iq/models/lecture_overview_model.dart' as _i4;
import 'package:kratos_iq/models/quiz_overview_model.dart' as _i5;
import 'package:kratos_iq/models/quiz_set.dart' as _i6;
import 'package:kratos_iq/services/api_client.dart' as _i3;
import 'package:kratos_iq/services/api_service.dart' as _i18;
import 'package:kratos_iq/services/device_service.dart' as _i17;
import 'package:kratos_iq/services/role_service.dart' as _i16;
import 'package:mockito/mockito.dart' as _i1;
import 'package:stacked/stacked.dart' as _i2;
import 'package:stacked_services/src/models/overlay_request.dart' as _i15;
import 'package:stacked_services/src/models/overlay_response.dart' as _i13;
import 'package:stacked_services/stacked_services.dart' as _i10;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeRootStackRouter_0 extends _i1.SmartFake
    implements _i2.RootStackRouter {
  _FakeRootStackRouter_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRouteData_1 extends _i1.SmartFake implements _i2.RouteData {
  _FakeRouteData_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRoutingController_2 extends _i1.SmartFake
    implements _i2.RoutingController {
  _FakeRoutingController_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeApiClient_3 extends _i1.SmartFake implements _i3.ApiClient {
  _FakeApiClient_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLectureOverview_4 extends _i1.SmartFake
    implements _i4.LectureOverview {
  _FakeLectureOverview_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeQuizOverview_5 extends _i1.SmartFake implements _i5.QuizOverview {
  _FakeQuizOverview_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeQuizSet_6 extends _i1.SmartFake implements _i6.QuizSet {
  _FakeQuizSet_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeFlashcardsOverviewModel_7 extends _i1.SmartFake
    implements _i7.FlashcardsOverviewModel {
  _FakeFlashcardsOverviewModel_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeFlashcardsByLectureModel_8 extends _i1.SmartFake
    implements _i8.FlashcardsByLectureModel {
  _FakeFlashcardsByLectureModel_8(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLectureInfo_9 extends _i1.SmartFake implements _i9.LectureInfo {
  _FakeLectureInfo_9(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [RouterService].
///
/// See the documentation for Mockito's code generation for more information.
class MockRouterService extends _i1.Mock implements _i10.RouterService {
  @override
  _i2.RootStackRouter get router => (super.noSuchMethod(
        Invocation.getter(#router),
        returnValue: _FakeRootStackRouter_0(
          this,
          Invocation.getter(#router),
        ),
        returnValueForMissingStub: _FakeRootStackRouter_0(
          this,
          Invocation.getter(#router),
        ),
      ) as _i2.RootStackRouter);

  @override
  set router(_i2.RootStackRouter? _router) => super.noSuchMethod(
        Invocation.setter(
          #router,
          _router,
        ),
        returnValueForMissingStub: null,
      );

  @override
  List<_i2.StackedPage<dynamic>> get stack => (super.noSuchMethod(
        Invocation.getter(#stack),
        returnValue: <_i2.StackedPage<dynamic>>[],
        returnValueForMissingStub: <_i2.StackedPage<dynamic>>[],
      ) as List<_i2.StackedPage<dynamic>>);

  @override
  _i2.RouteData get topRoute => (super.noSuchMethod(
        Invocation.getter(#topRoute),
        returnValue: _FakeRouteData_1(
          this,
          Invocation.getter(#topRoute),
        ),
        returnValueForMissingStub: _FakeRouteData_1(
          this,
          Invocation.getter(#topRoute),
        ),
      ) as _i2.RouteData);

  @override
  dynamic setRouter(_i2.RootStackRouter? router) => super.noSuchMethod(
        Invocation.method(
          #setRouter,
          [router],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i11.Future<dynamic> navigateTo(
    _i2.PageRouteInfo<dynamic>? route, {
    _i2.OnNavigationFailure? onFailure,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateTo,
          [route],
          {#onFailure: onFailure},
        ),
        returnValue: _i11.Future<dynamic>.value(),
        returnValueForMissingStub: _i11.Future<dynamic>.value(),
      ) as _i11.Future<dynamic>);

  @override
  _i11.Future<void> navigateToPath({
    required String? path,
    bool? includePrefixMatches = false,
    _i2.OnNavigationFailure? onFailure,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateToPath,
          [],
          {
            #path: path,
            #includePrefixMatches: includePrefixMatches,
            #onFailure: onFailure,
          },
        ),
        returnValue: _i11.Future<void>.value(),
        returnValueForMissingStub: _i11.Future<void>.value(),
      ) as _i11.Future<void>);

  @override
  _i11.Future<T?> navigateWithTransition<T extends Object?>(
    _i12.Widget? widget, {
    _i12.RouteTransitionsBuilder? transitionBuilder,
    bool? fullscreenDialog = false,
    Duration? transitionDuration = const Duration(milliseconds: 300),
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateWithTransition,
          [widget],
          {
            #transitionBuilder: transitionBuilder,
            #fullscreenDialog: fullscreenDialog,
            #transitionDuration: transitionDuration,
          },
        ),
        returnValue: _i11.Future<T?>.value(),
        returnValueForMissingStub: _i11.Future<T?>.value(),
      ) as _i11.Future<T?>);

  @override
  _i11.Future<T?> replaceWith<T extends Object?>(
    _i2.PageRouteInfo<dynamic>? route, {
    _i2.OnNavigationFailure? onFailure,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #replaceWith,
          [route],
          {#onFailure: onFailure},
        ),
        returnValue: _i11.Future<T?>.value(),
        returnValueForMissingStub: _i11.Future<T?>.value(),
      ) as _i11.Future<T?>);

  @override
  _i11.Future<void> clearStackAndShow(
    _i2.PageRouteInfo<dynamic>? route, {
    _i2.OnNavigationFailure? onFailure,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearStackAndShow,
          [route],
          {#onFailure: onFailure},
        ),
        returnValue: _i11.Future<void>.value(),
        returnValueForMissingStub: _i11.Future<void>.value(),
      ) as _i11.Future<void>);

  @override
  _i11.Future<void> clearStackAndShowView(
    _i12.Widget? widget, {
    _i12.RouteTransitionsBuilder? transitionBuilder,
    bool? fullscreenDialog = false,
    Duration? transitionDuration = const Duration(milliseconds: 300),
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearStackAndShowView,
          [widget],
          {
            #transitionBuilder: transitionBuilder,
            #fullscreenDialog: fullscreenDialog,
            #transitionDuration: transitionDuration,
          },
        ),
        returnValue: _i11.Future<void>.value(),
        returnValueForMissingStub: _i11.Future<void>.value(),
      ) as _i11.Future<void>);

  @override
  void popForced<T extends Object?>([T? result]) => super.noSuchMethod(
        Invocation.method(
          #popForced,
          [result],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i11.Future<bool> pop<T extends Object?>([T? result]) => (super.noSuchMethod(
        Invocation.method(
          #pop,
          [result],
        ),
        returnValue: _i11.Future<bool>.value(false),
        returnValueForMissingStub: _i11.Future<bool>.value(false),
      ) as _i11.Future<bool>);

  @override
  void back<T extends Object?>({T? result}) => super.noSuchMethod(
        Invocation.method(
          #back,
          [],
          {#result: result},
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i2.RoutingController topMostRouter({bool? ignorePagelessRoutes = false}) =>
      (super.noSuchMethod(
        Invocation.method(
          #topMostRouter,
          [],
          {#ignorePagelessRoutes: ignorePagelessRoutes},
        ),
        returnValue: _FakeRoutingController_2(
          this,
          Invocation.method(
            #topMostRouter,
            [],
            {#ignorePagelessRoutes: ignorePagelessRoutes},
          ),
        ),
        returnValueForMissingStub: _FakeRoutingController_2(
          this,
          Invocation.method(
            #topMostRouter,
            [],
            {#ignorePagelessRoutes: ignorePagelessRoutes},
          ),
        ),
      ) as _i2.RoutingController);

  @override
  _i11.Future<T?> pushNativeRoute<T extends Object?>(_i12.Route<T>? route) =>
      (super.noSuchMethod(
        Invocation.method(
          #pushNativeRoute,
          [route],
        ),
        returnValue: _i11.Future<T?>.value(),
        returnValueForMissingStub: _i11.Future<T?>.value(),
      ) as _i11.Future<T?>);
}

/// A class which mocks [BottomSheetService].
///
/// See the documentation for Mockito's code generation for more information.
class MockBottomSheetService extends _i1.Mock
    implements _i10.BottomSheetService {
  @override
  void setCustomSheetBuilders(Map<dynamic, _i10.SheetBuilder>? builders) =>
      super.noSuchMethod(
        Invocation.method(
          #setCustomSheetBuilders,
          [builders],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i11.Future<_i13.SheetResponse<dynamic>?> showBottomSheet({
    required String? title,
    String? description,
    String? confirmButtonTitle = 'Ok',
    String? cancelButtonTitle,
    bool? enableDrag = true,
    bool? barrierDismissible = true,
    bool? isScrollControlled = false,
    Duration? exitBottomSheetDuration,
    Duration? enterBottomSheetDuration,
    bool? ignoreSafeArea,
    bool? useRootNavigator = false,
    double? elevation = 1.0,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showBottomSheet,
          [],
          {
            #title: title,
            #description: description,
            #confirmButtonTitle: confirmButtonTitle,
            #cancelButtonTitle: cancelButtonTitle,
            #enableDrag: enableDrag,
            #barrierDismissible: barrierDismissible,
            #isScrollControlled: isScrollControlled,
            #exitBottomSheetDuration: exitBottomSheetDuration,
            #enterBottomSheetDuration: enterBottomSheetDuration,
            #ignoreSafeArea: ignoreSafeArea,
            #useRootNavigator: useRootNavigator,
            #elevation: elevation,
          },
        ),
        returnValue: _i11.Future<_i13.SheetResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i11.Future<_i13.SheetResponse<dynamic>?>.value(),
      ) as _i11.Future<_i13.SheetResponse<dynamic>?>);

  @override
  _i11.Future<_i13.SheetResponse<T>?> showCustomSheet<T, R>({
    dynamic variant,
    String? title,
    String? description,
    bool? hasImage = false,
    String? imageUrl,
    bool? showIconInMainButton = false,
    String? mainButtonTitle,
    bool? showIconInSecondaryButton = false,
    String? secondaryButtonTitle,
    bool? showIconInAdditionalButton = false,
    String? additionalButtonTitle,
    bool? takesInput = false,
    _i14.Color? barrierColor = const _i14.Color(2315255808),
    double? elevation = 1.0,
    bool? barrierDismissible = true,
    bool? isScrollControlled = false,
    String? barrierLabel = '',
    dynamic customData,
    R? data,
    bool? enableDrag = true,
    Duration? exitBottomSheetDuration,
    Duration? enterBottomSheetDuration,
    bool? ignoreSafeArea,
    bool? useRootNavigator = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showCustomSheet,
          [],
          {
            #variant: variant,
            #title: title,
            #description: description,
            #hasImage: hasImage,
            #imageUrl: imageUrl,
            #showIconInMainButton: showIconInMainButton,
            #mainButtonTitle: mainButtonTitle,
            #showIconInSecondaryButton: showIconInSecondaryButton,
            #secondaryButtonTitle: secondaryButtonTitle,
            #showIconInAdditionalButton: showIconInAdditionalButton,
            #additionalButtonTitle: additionalButtonTitle,
            #takesInput: takesInput,
            #barrierColor: barrierColor,
            #elevation: elevation,
            #barrierDismissible: barrierDismissible,
            #isScrollControlled: isScrollControlled,
            #barrierLabel: barrierLabel,
            #customData: customData,
            #data: data,
            #enableDrag: enableDrag,
            #exitBottomSheetDuration: exitBottomSheetDuration,
            #enterBottomSheetDuration: enterBottomSheetDuration,
            #ignoreSafeArea: ignoreSafeArea,
            #useRootNavigator: useRootNavigator,
          },
        ),
        returnValue: _i11.Future<_i13.SheetResponse<T>?>.value(),
        returnValueForMissingStub: _i11.Future<_i13.SheetResponse<T>?>.value(),
      ) as _i11.Future<_i13.SheetResponse<T>?>);

  @override
  void completeSheet(_i13.SheetResponse<dynamic>? response) =>
      super.noSuchMethod(
        Invocation.method(
          #completeSheet,
          [response],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [DialogService].
///
/// See the documentation for Mockito's code generation for more information.
class MockDialogService extends _i1.Mock implements _i10.DialogService {
  @override
  void registerCustomDialogBuilders(
          Map<dynamic, _i10.DialogBuilder>? builders) =>
      super.noSuchMethod(
        Invocation.method(
          #registerCustomDialogBuilders,
          [builders],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void registerCustomDialogBuilder({
    required dynamic variant,
    required _i12.Widget Function(
      _i12.BuildContext,
      _i15.DialogRequest<dynamic>,
      dynamic Function(_i13.DialogResponse<dynamic>),
    )? builder,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #registerCustomDialogBuilder,
          [],
          {
            #variant: variant,
            #builder: builder,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i11.Future<_i13.DialogResponse<dynamic>?> showDialog({
    String? title,
    String? description,
    String? cancelTitle,
    _i14.Color? cancelTitleColor,
    String? buttonTitle = 'Ok',
    _i14.Color? buttonTitleColor,
    bool? barrierDismissible = false,
    _i12.RouteSettings? routeSettings,
    _i12.GlobalKey<_i12.NavigatorState>? navigatorKey,
    _i10.DialogPlatform? dialogPlatform,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showDialog,
          [],
          {
            #title: title,
            #description: description,
            #cancelTitle: cancelTitle,
            #cancelTitleColor: cancelTitleColor,
            #buttonTitle: buttonTitle,
            #buttonTitleColor: buttonTitleColor,
            #barrierDismissible: barrierDismissible,
            #routeSettings: routeSettings,
            #navigatorKey: navigatorKey,
            #dialogPlatform: dialogPlatform,
          },
        ),
        returnValue: _i11.Future<_i13.DialogResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i11.Future<_i13.DialogResponse<dynamic>?>.value(),
      ) as _i11.Future<_i13.DialogResponse<dynamic>?>);

  @override
  _i11.Future<_i13.DialogResponse<T>?> showCustomDialog<T, R>({
    dynamic variant,
    String? title,
    String? description,
    bool? hasImage = false,
    String? imageUrl,
    bool? showIconInMainButton = false,
    String? mainButtonTitle,
    bool? showIconInSecondaryButton = false,
    String? secondaryButtonTitle,
    bool? showIconInAdditionalButton = false,
    String? additionalButtonTitle,
    bool? takesInput = false,
    _i14.Color? barrierColor = const _i14.Color(2315255808),
    bool? barrierDismissible = false,
    String? barrierLabel = '',
    bool? useSafeArea = true,
    _i12.RouteSettings? routeSettings,
    _i12.GlobalKey<_i12.NavigatorState>? navigatorKey,
    _i12.RouteTransitionsBuilder? transitionBuilder,
    dynamic customData,
    R? data,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showCustomDialog,
          [],
          {
            #variant: variant,
            #title: title,
            #description: description,
            #hasImage: hasImage,
            #imageUrl: imageUrl,
            #showIconInMainButton: showIconInMainButton,
            #mainButtonTitle: mainButtonTitle,
            #showIconInSecondaryButton: showIconInSecondaryButton,
            #secondaryButtonTitle: secondaryButtonTitle,
            #showIconInAdditionalButton: showIconInAdditionalButton,
            #additionalButtonTitle: additionalButtonTitle,
            #takesInput: takesInput,
            #barrierColor: barrierColor,
            #barrierDismissible: barrierDismissible,
            #barrierLabel: barrierLabel,
            #useSafeArea: useSafeArea,
            #routeSettings: routeSettings,
            #navigatorKey: navigatorKey,
            #transitionBuilder: transitionBuilder,
            #customData: customData,
            #data: data,
          },
        ),
        returnValue: _i11.Future<_i13.DialogResponse<T>?>.value(),
        returnValueForMissingStub: _i11.Future<_i13.DialogResponse<T>?>.value(),
      ) as _i11.Future<_i13.DialogResponse<T>?>);

  @override
  _i11.Future<_i13.DialogResponse<dynamic>?> showConfirmationDialog({
    String? title,
    String? description,
    String? cancelTitle = 'Cancel',
    _i14.Color? cancelTitleColor,
    String? confirmationTitle = 'Ok',
    _i14.Color? confirmationTitleColor,
    bool? barrierDismissible = false,
    _i12.RouteSettings? routeSettings,
    _i10.DialogPlatform? dialogPlatform,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showConfirmationDialog,
          [],
          {
            #title: title,
            #description: description,
            #cancelTitle: cancelTitle,
            #cancelTitleColor: cancelTitleColor,
            #confirmationTitle: confirmationTitle,
            #confirmationTitleColor: confirmationTitleColor,
            #barrierDismissible: barrierDismissible,
            #routeSettings: routeSettings,
            #dialogPlatform: dialogPlatform,
          },
        ),
        returnValue: _i11.Future<_i13.DialogResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i11.Future<_i13.DialogResponse<dynamic>?>.value(),
      ) as _i11.Future<_i13.DialogResponse<dynamic>?>);

  @override
  void completeDialog(_i13.DialogResponse<dynamic>? response) =>
      super.noSuchMethod(
        Invocation.method(
          #completeDialog,
          [response],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [RoleService].
///
/// See the documentation for Mockito's code generation for more information.
class MockRoleService extends _i1.Mock implements _i16.RoleService {
  @override
  bool get isStudent => (super.noSuchMethod(
        Invocation.getter(#isStudent),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  int get listenersCount => (super.noSuchMethod(
        Invocation.getter(#listenersCount),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);

  @override
  void toggleRole() => super.noSuchMethod(
        Invocation.method(
          #toggleRole,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void listenToReactiveValues(List<dynamic>? reactiveValues) =>
      super.noSuchMethod(
        Invocation.method(
          #listenToReactiveValues,
          [reactiveValues],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addListener(void Function()? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(void Function()? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [DeviceService].
///
/// See the documentation for Mockito's code generation for more information.
class MockDeviceService extends _i1.Mock implements _i17.DeviceService {
  @override
  bool get isDevice => (super.noSuchMethod(
        Invocation.getter(#isDevice),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  int get listenersCount => (super.noSuchMethod(
        Invocation.getter(#listenersCount),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);

  @override
  void toggleDevice() => super.noSuchMethod(
        Invocation.method(
          #toggleDevice,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void listenToReactiveValues(List<dynamic>? reactiveValues) =>
      super.noSuchMethod(
        Invocation.method(
          #listenToReactiveValues,
          [reactiveValues],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addListener(void Function()? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(void Function()? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [ApiService].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiService extends _i1.Mock implements _i18.ApiService {
  @override
  _i3.ApiClient get apiClient => (super.noSuchMethod(
        Invocation.getter(#apiClient),
        returnValue: _FakeApiClient_3(
          this,
          Invocation.getter(#apiClient),
        ),
        returnValueForMissingStub: _FakeApiClient_3(
          this,
          Invocation.getter(#apiClient),
        ),
      ) as _i3.ApiClient);

  @override
  set apiClient(_i3.ApiClient? _apiClient) => super.noSuchMethod(
        Invocation.setter(
          #apiClient,
          _apiClient,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i11.Future<_i4.LectureOverview> getLectureOverview() => (super.noSuchMethod(
        Invocation.method(
          #getLectureOverview,
          [],
        ),
        returnValue:
            _i11.Future<_i4.LectureOverview>.value(_FakeLectureOverview_4(
          this,
          Invocation.method(
            #getLectureOverview,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i11.Future<_i4.LectureOverview>.value(_FakeLectureOverview_4(
          this,
          Invocation.method(
            #getLectureOverview,
            [],
          ),
        )),
      ) as _i11.Future<_i4.LectureOverview>);

  @override
  _i11.Future<_i5.QuizOverview> getQuizOverview() => (super.noSuchMethod(
        Invocation.method(
          #getQuizOverview,
          [],
        ),
        returnValue: _i11.Future<_i5.QuizOverview>.value(_FakeQuizOverview_5(
          this,
          Invocation.method(
            #getQuizOverview,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i11.Future<_i5.QuizOverview>.value(_FakeQuizOverview_5(
          this,
          Invocation.method(
            #getQuizOverview,
            [],
          ),
        )),
      ) as _i11.Future<_i5.QuizOverview>);

  @override
  _i11.Future<_i6.QuizSet> getQuizSet(String? lectureId) => (super.noSuchMethod(
        Invocation.method(
          #getQuizSet,
          [lectureId],
        ),
        returnValue: _i11.Future<_i6.QuizSet>.value(_FakeQuizSet_6(
          this,
          Invocation.method(
            #getQuizSet,
            [lectureId],
          ),
        )),
        returnValueForMissingStub:
            _i11.Future<_i6.QuizSet>.value(_FakeQuizSet_6(
          this,
          Invocation.method(
            #getQuizSet,
            [lectureId],
          ),
        )),
      ) as _i11.Future<_i6.QuizSet>);

  @override
  _i11.Future<_i7.FlashcardsOverviewModel> getFlashcardsOverview() =>
      (super.noSuchMethod(
        Invocation.method(
          #getFlashcardsOverview,
          [],
        ),
        returnValue: _i11.Future<_i7.FlashcardsOverviewModel>.value(
            _FakeFlashcardsOverviewModel_7(
          this,
          Invocation.method(
            #getFlashcardsOverview,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i11.Future<_i7.FlashcardsOverviewModel>.value(
                _FakeFlashcardsOverviewModel_7(
          this,
          Invocation.method(
            #getFlashcardsOverview,
            [],
          ),
        )),
      ) as _i11.Future<_i7.FlashcardsOverviewModel>);

  @override
  _i11.Future<_i8.FlashcardsByLectureModel> getFlashcardsByLecture(
          String? lectureId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getFlashcardsByLecture,
          [lectureId],
        ),
        returnValue: _i11.Future<_i8.FlashcardsByLectureModel>.value(
            _FakeFlashcardsByLectureModel_8(
          this,
          Invocation.method(
            #getFlashcardsByLecture,
            [lectureId],
          ),
        )),
        returnValueForMissingStub:
            _i11.Future<_i8.FlashcardsByLectureModel>.value(
                _FakeFlashcardsByLectureModel_8(
          this,
          Invocation.method(
            #getFlashcardsByLecture,
            [lectureId],
          ),
        )),
      ) as _i11.Future<_i8.FlashcardsByLectureModel>);

  @override
  _i11.Future<_i9.LectureInfo> getLectureInfo(String? lectureId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getLectureInfo,
          [lectureId],
        ),
        returnValue: _i11.Future<_i9.LectureInfo>.value(_FakeLectureInfo_9(
          this,
          Invocation.method(
            #getLectureInfo,
            [lectureId],
          ),
        )),
        returnValueForMissingStub:
            _i11.Future<_i9.LectureInfo>.value(_FakeLectureInfo_9(
          this,
          Invocation.method(
            #getLectureInfo,
            [lectureId],
          ),
        )),
      ) as _i11.Future<_i9.LectureInfo>);
}
