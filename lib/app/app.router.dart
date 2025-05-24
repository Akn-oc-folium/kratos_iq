// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i12;
import 'package:stacked/stacked.dart' as _i11;
import 'package:stacked_services/stacked_services.dart' as _i10;

import '../ui/views/flashcard/flashcard_view.dart' as _i4;
import '../ui/views/home/home_view.dart' as _i2;
import '../ui/views/main_layout/main_layout_view.dart' as _i6;
import '../ui/views/quiz/quiz_view.dart' as _i3;
import '../ui/views/startup/startup_view.dart' as _i1;
import '../ui/views/student_dashboard/student_dashboard_view.dart' as _i7;
import '../ui/views/student_home/student_home_view.dart' as _i5;
import '../ui/views/teacher_home/teacher_home_view.dart' as _i8;
import '../ui/views/unknown/unknown_view.dart' as _i9;

final stackedRouter =
    StackedRouterWeb(navigatorKey: _i10.StackedService.navigatorKey);

class StackedRouterWeb extends _i11.RootStackRouter {
  StackedRouterWeb({_i12.GlobalKey<_i12.NavigatorState>? navigatorKey})
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    StartupViewRoute.name: (routeData) {
      return _i11.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.StartupView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeViewRoute.name: (routeData) {
      return _i11.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    QuizViewRoute.name: (routeData) {
      final args = routeData.argsAs<QuizViewArgs>();
      return _i11.CustomPage<dynamic>(
        routeData: routeData,
        child: _i3.QuizView(
          key: args.key,
          lectureNumber: args.lectureNumber,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
    FlashcardViewRoute.name: (routeData) {
      final args = routeData.argsAs<FlashcardViewArgs>();
      return _i11.CustomPage<dynamic>(
        routeData: routeData,
        child: _i4.FlashcardView(
          key: args.key,
          lectureNumber: args.lectureNumber,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
    StudentHomeViewRoute.name: (routeData) {
      return _i11.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i5.StudentHomeView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    MainLayoutViewRoute.name: (routeData) {
      final args = routeData.argsAs<MainLayoutViewArgs>();
      return _i11.CustomPage<dynamic>(
        routeData: routeData,
        child: _i6.MainLayoutView(
          key: args.key,
          body: args.body,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
    StudentDashboardViewRoute.name: (routeData) {
      final args = routeData.argsAs<StudentDashboardViewArgs>();
      return _i11.CustomPage<dynamic>(
        routeData: routeData,
        child: _i7.StudentDashboardView(
          key: args.key,
          lectureNumber: args.lectureNumber,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
    TeacherHomeViewRoute.name: (routeData) {
      return _i11.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i8.TeacherHomeView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    UnknownViewRoute.name: (routeData) {
      return _i11.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i9.UnknownView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(
          StartupViewRoute.name,
          path: '/',
        ),
        _i11.RouteConfig(
          HomeViewRoute.name,
          path: '/home-view',
        ),
        _i11.RouteConfig(
          QuizViewRoute.name,
          path: '/quiz-view',
        ),
        _i11.RouteConfig(
          FlashcardViewRoute.name,
          path: '/flashcard-view',
        ),
        _i11.RouteConfig(
          StudentHomeViewRoute.name,
          path: '/student-home-view',
        ),
        _i11.RouteConfig(
          MainLayoutViewRoute.name,
          path: '/main-layout-view',
        ),
        _i11.RouteConfig(
          StudentDashboardViewRoute.name,
          path: '/student-dashboard-view',
        ),
        _i11.RouteConfig(
          TeacherHomeViewRoute.name,
          path: '/teacher-home-view',
        ),
        _i11.RouteConfig(
          UnknownViewRoute.name,
          path: '/404',
        ),
        _i11.RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '/404',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [_i1.StartupView]
class StartupViewRoute extends _i11.PageRouteInfo<void> {
  const StartupViewRoute()
      : super(
          StartupViewRoute.name,
          path: '/',
        );

  static const String name = 'StartupView';
}

/// generated route for
/// [_i2.HomeView]
class HomeViewRoute extends _i11.PageRouteInfo<void> {
  const HomeViewRoute()
      : super(
          HomeViewRoute.name,
          path: '/home-view',
        );

  static const String name = 'HomeView';
}

/// generated route for
/// [_i3.QuizView]
class QuizViewRoute extends _i11.PageRouteInfo<QuizViewArgs> {
  QuizViewRoute({
    _i12.Key? key,
    required int lectureNumber,
  }) : super(
          QuizViewRoute.name,
          path: '/quiz-view',
          args: QuizViewArgs(
            key: key,
            lectureNumber: lectureNumber,
          ),
        );

  static const String name = 'QuizView';
}

class QuizViewArgs {
  const QuizViewArgs({
    this.key,
    required this.lectureNumber,
  });

  final _i12.Key? key;

  final int lectureNumber;

  @override
  String toString() {
    return 'QuizViewArgs{key: $key, lectureNumber: $lectureNumber}';
  }
}

/// generated route for
/// [_i4.FlashcardView]
class FlashcardViewRoute extends _i11.PageRouteInfo<FlashcardViewArgs> {
  FlashcardViewRoute({
    _i12.Key? key,
    required int lectureNumber,
  }) : super(
          FlashcardViewRoute.name,
          path: '/flashcard-view',
          args: FlashcardViewArgs(
            key: key,
            lectureNumber: lectureNumber,
          ),
        );

  static const String name = 'FlashcardView';
}

class FlashcardViewArgs {
  const FlashcardViewArgs({
    this.key,
    required this.lectureNumber,
  });

  final _i12.Key? key;

  final int lectureNumber;

  @override
  String toString() {
    return 'FlashcardViewArgs{key: $key, lectureNumber: $lectureNumber}';
  }
}

/// generated route for
/// [_i5.StudentHomeView]
class StudentHomeViewRoute extends _i11.PageRouteInfo<void> {
  const StudentHomeViewRoute()
      : super(
          StudentHomeViewRoute.name,
          path: '/student-home-view',
        );

  static const String name = 'StudentHomeView';
}

/// generated route for
/// [_i6.MainLayoutView]
class MainLayoutViewRoute extends _i11.PageRouteInfo<MainLayoutViewArgs> {
  MainLayoutViewRoute({
    _i12.Key? key,
    required _i12.Widget body,
  }) : super(
          MainLayoutViewRoute.name,
          path: '/main-layout-view',
          args: MainLayoutViewArgs(
            key: key,
            body: body,
          ),
        );

  static const String name = 'MainLayoutView';
}

class MainLayoutViewArgs {
  const MainLayoutViewArgs({
    this.key,
    required this.body,
  });

  final _i12.Key? key;

  final _i12.Widget body;

  @override
  String toString() {
    return 'MainLayoutViewArgs{key: $key, body: $body}';
  }
}

/// generated route for
/// [_i7.StudentDashboardView]
class StudentDashboardViewRoute
    extends _i11.PageRouteInfo<StudentDashboardViewArgs> {
  StudentDashboardViewRoute({
    _i12.Key? key,
    required int lectureNumber,
  }) : super(
          StudentDashboardViewRoute.name,
          path: '/student-dashboard-view',
          args: StudentDashboardViewArgs(
            key: key,
            lectureNumber: lectureNumber,
          ),
        );

  static const String name = 'StudentDashboardView';
}

class StudentDashboardViewArgs {
  const StudentDashboardViewArgs({
    this.key,
    required this.lectureNumber,
  });

  final _i12.Key? key;

  final int lectureNumber;

  @override
  String toString() {
    return 'StudentDashboardViewArgs{key: $key, lectureNumber: $lectureNumber}';
  }
}

/// generated route for
/// [_i8.TeacherHomeView]
class TeacherHomeViewRoute extends _i11.PageRouteInfo<void> {
  const TeacherHomeViewRoute()
      : super(
          TeacherHomeViewRoute.name,
          path: '/teacher-home-view',
        );

  static const String name = 'TeacherHomeView';
}

/// generated route for
/// [_i9.UnknownView]
class UnknownViewRoute extends _i11.PageRouteInfo<void> {
  const UnknownViewRoute()
      : super(
          UnknownViewRoute.name,
          path: '/404',
        );

  static const String name = 'UnknownView';
}

extension RouterStateExtension on _i10.RouterService {
  Future<dynamic> navigateToStartupView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const StartupViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToHomeView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToQuizView({
    _i12.Key? key,
    required int lectureNumber,
    void Function(_i11.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      QuizViewRoute(
        key: key,
        lectureNumber: lectureNumber,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToFlashcardView({
    _i12.Key? key,
    required int lectureNumber,
    void Function(_i11.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      FlashcardViewRoute(
        key: key,
        lectureNumber: lectureNumber,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToStudentHomeView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const StudentHomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToMainLayoutView({
    _i12.Key? key,
    required _i12.Widget body,
    void Function(_i11.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      MainLayoutViewRoute(
        key: key,
        body: body,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToStudentDashboardView({
    _i12.Key? key,
    required int lectureNumber,
    void Function(_i11.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      StudentDashboardViewRoute(
        key: key,
        lectureNumber: lectureNumber,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToTeacherHomeView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const TeacherHomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToUnknownView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const UnknownViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithStartupView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const StartupViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithHomeView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithQuizView({
    _i12.Key? key,
    required int lectureNumber,
    void Function(_i11.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      QuizViewRoute(
        key: key,
        lectureNumber: lectureNumber,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithFlashcardView({
    _i12.Key? key,
    required int lectureNumber,
    void Function(_i11.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      FlashcardViewRoute(
        key: key,
        lectureNumber: lectureNumber,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithStudentHomeView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const StudentHomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithMainLayoutView({
    _i12.Key? key,
    required _i12.Widget body,
    void Function(_i11.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      MainLayoutViewRoute(
        key: key,
        body: body,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithStudentDashboardView({
    _i12.Key? key,
    required int lectureNumber,
    void Function(_i11.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      StudentDashboardViewRoute(
        key: key,
        lectureNumber: lectureNumber,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithTeacherHomeView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const TeacherHomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithUnknownView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const UnknownViewRoute(),
      onFailure: onFailure,
    );
  }
}
