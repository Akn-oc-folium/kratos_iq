// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i15;
import 'package:stacked/stacked.dart' as _i14;
import 'package:stacked_services/stacked_services.dart' as _i13;

import '../ui/views/asset_player/asset_player_view.dart' as _i11;
import '../ui/views/flashcard/flashcard_view.dart' as _i4;
import '../ui/views/home/home_view.dart' as _i2;
import '../ui/views/main_layout/main_layout_view.dart' as _i6;
import '../ui/views/quiz/quiz_view.dart' as _i3;
import '../ui/views/startup/startup_view.dart' as _i1;
import '../ui/views/student_dashboard/student_dashboard_view.dart' as _i7;
import '../ui/views/student_home/student_home_view.dart' as _i5;
import '../ui/views/teacher_home/teacher_home_view.dart' as _i8;
import '../ui/views/teacher_lecture/teacher_lecture_view.dart' as _i9;
import '../ui/views/unknown/unknown_view.dart' as _i12;
import '../ui/views/video_feed/video_feed_view.dart' as _i10;

final stackedRouter =
    StackedRouterWeb(navigatorKey: _i13.StackedService.navigatorKey);

class StackedRouterWeb extends _i14.RootStackRouter {
  StackedRouterWeb({_i15.GlobalKey<_i15.NavigatorState>? navigatorKey})
      : super(navigatorKey);

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    StartupViewRoute.name: (routeData) {
      return _i14.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.StartupView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeViewRoute.name: (routeData) {
      return _i14.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    QuizViewRoute.name: (routeData) {
      final args = routeData.argsAs<QuizViewArgs>();
      return _i14.CustomPage<dynamic>(
        routeData: routeData,
        child: _i3.QuizView(
          key: args.key,
          lectureId: args.lectureId,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
    FlashcardViewRoute.name: (routeData) {
      final args = routeData.argsAs<FlashcardViewArgs>();
      return _i14.CustomPage<dynamic>(
        routeData: routeData,
        child: _i4.FlashcardView(
          key: args.key,
          lectureId: args.lectureId,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
    StudentHomeViewRoute.name: (routeData) {
      return _i14.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i5.StudentHomeView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    MainLayoutViewRoute.name: (routeData) {
      final args = routeData.argsAs<MainLayoutViewArgs>();
      return _i14.CustomPage<dynamic>(
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
      return _i14.CustomPage<dynamic>(
        routeData: routeData,
        child: _i7.StudentDashboardView(
          key: args.key,
          lectureId: args.lectureId,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
    TeacherHomeViewRoute.name: (routeData) {
      return _i14.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i8.TeacherHomeView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    TeacherDashboardViewRoute.name: (routeData) {
      final args = routeData.argsAs<TeacherDashboardViewArgs>();
      return _i14.CustomPage<dynamic>(
        routeData: routeData,
        child: _i9.TeacherDashboardView(
          key: args.key,
          lectureNumber: args.lectureNumber,
          lectureId: args.lectureId,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
    VideoFeedViewRoute.name: (routeData) {
      return _i14.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i10.VideoFeedView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    AssetPlayerViewRoute.name: (routeData) {
      return _i14.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i11.AssetPlayerView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    UnknownViewRoute.name: (routeData) {
      return _i14.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i12.UnknownView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i14.RouteConfig> get routes => [
        _i14.RouteConfig(
          StartupViewRoute.name,
          path: '/',
        ),
        _i14.RouteConfig(
          HomeViewRoute.name,
          path: '/home',
        ),
        _i14.RouteConfig(
          QuizViewRoute.name,
          path: '/quiz',
        ),
        _i14.RouteConfig(
          FlashcardViewRoute.name,
          path: '/flashcard',
        ),
        _i14.RouteConfig(
          StudentHomeViewRoute.name,
          path: '/home/student',
        ),
        _i14.RouteConfig(
          MainLayoutViewRoute.name,
          path: '/main-layout-view',
        ),
        _i14.RouteConfig(
          StudentDashboardViewRoute.name,
          path: '/student/dashboard',
        ),
        _i14.RouteConfig(
          TeacherHomeViewRoute.name,
          path: '/home/teacher',
        ),
        _i14.RouteConfig(
          TeacherDashboardViewRoute.name,
          path: '/teacher/dashboard',
        ),
        _i14.RouteConfig(
          VideoFeedViewRoute.name,
          path: '/video-feed-view',
        ),
        _i14.RouteConfig(
          AssetPlayerViewRoute.name,
          path: '/asset-player-view',
        ),
        _i14.RouteConfig(
          UnknownViewRoute.name,
          path: '/404',
        ),
        _i14.RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '/404',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [_i1.StartupView]
class StartupViewRoute extends _i14.PageRouteInfo<void> {
  const StartupViewRoute()
      : super(
          StartupViewRoute.name,
          path: '/',
        );

  static const String name = 'StartupView';
}

/// generated route for
/// [_i2.HomeView]
class HomeViewRoute extends _i14.PageRouteInfo<void> {
  const HomeViewRoute()
      : super(
          HomeViewRoute.name,
          path: '/home',
        );

  static const String name = 'HomeView';
}

/// generated route for
/// [_i3.QuizView]
class QuizViewRoute extends _i14.PageRouteInfo<QuizViewArgs> {
  QuizViewRoute({
    _i15.Key? key,
    required String lectureId,
  }) : super(
          QuizViewRoute.name,
          path: '/quiz',
          args: QuizViewArgs(
            key: key,
            lectureId: lectureId,
          ),
        );

  static const String name = 'QuizView';
}

class QuizViewArgs {
  const QuizViewArgs({
    this.key,
    required this.lectureId,
  });

  final _i15.Key? key;

  final String lectureId;

  @override
  String toString() {
    return 'QuizViewArgs{key: $key, lectureId: $lectureId}';
  }
}

/// generated route for
/// [_i4.FlashcardView]
class FlashcardViewRoute extends _i14.PageRouteInfo<FlashcardViewArgs> {
  FlashcardViewRoute({
    _i15.Key? key,
    required String lectureId,
  }) : super(
          FlashcardViewRoute.name,
          path: '/flashcard',
          args: FlashcardViewArgs(
            key: key,
            lectureId: lectureId,
          ),
        );

  static const String name = 'FlashcardView';
}

class FlashcardViewArgs {
  const FlashcardViewArgs({
    this.key,
    required this.lectureId,
  });

  final _i15.Key? key;

  final String lectureId;

  @override
  String toString() {
    return 'FlashcardViewArgs{key: $key, lectureId: $lectureId}';
  }
}

/// generated route for
/// [_i5.StudentHomeView]
class StudentHomeViewRoute extends _i14.PageRouteInfo<void> {
  const StudentHomeViewRoute()
      : super(
          StudentHomeViewRoute.name,
          path: '/home/student',
        );

  static const String name = 'StudentHomeView';
}

/// generated route for
/// [_i6.MainLayoutView]
class MainLayoutViewRoute extends _i14.PageRouteInfo<MainLayoutViewArgs> {
  MainLayoutViewRoute({
    _i15.Key? key,
    required _i15.Widget body,
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

  final _i15.Key? key;

  final _i15.Widget body;

  @override
  String toString() {
    return 'MainLayoutViewArgs{key: $key, body: $body}';
  }
}

/// generated route for
/// [_i7.StudentDashboardView]
class StudentDashboardViewRoute
    extends _i14.PageRouteInfo<StudentDashboardViewArgs> {
  StudentDashboardViewRoute({
    _i15.Key? key,
    required String lectureId,
  }) : super(
          StudentDashboardViewRoute.name,
          path: '/student/dashboard',
          args: StudentDashboardViewArgs(
            key: key,
            lectureId: lectureId,
          ),
        );

  static const String name = 'StudentDashboardView';
}

class StudentDashboardViewArgs {
  const StudentDashboardViewArgs({
    this.key,
    required this.lectureId,
  });

  final _i15.Key? key;

  final String lectureId;

  @override
  String toString() {
    return 'StudentDashboardViewArgs{key: $key, lectureId: $lectureId}';
  }
}

/// generated route for
/// [_i8.TeacherHomeView]
class TeacherHomeViewRoute extends _i14.PageRouteInfo<void> {
  const TeacherHomeViewRoute()
      : super(
          TeacherHomeViewRoute.name,
          path: '/home/teacher',
        );

  static const String name = 'TeacherHomeView';
}

/// generated route for
/// [_i9.TeacherDashboardView]
class TeacherDashboardViewRoute
    extends _i14.PageRouteInfo<TeacherDashboardViewArgs> {
  TeacherDashboardViewRoute({
    _i15.Key? key,
    required int lectureNumber,
    required String lectureId,
  }) : super(
          TeacherDashboardViewRoute.name,
          path: '/teacher/dashboard',
          args: TeacherDashboardViewArgs(
            key: key,
            lectureNumber: lectureNumber,
            lectureId: lectureId,
          ),
        );

  static const String name = 'TeacherDashboardView';
}

class TeacherDashboardViewArgs {
  const TeacherDashboardViewArgs({
    this.key,
    required this.lectureNumber,
    required this.lectureId,
  });

  final _i15.Key? key;

  final int lectureNumber;

  final String lectureId;

  @override
  String toString() {
    return 'TeacherDashboardViewArgs{key: $key, lectureNumber: $lectureNumber, lectureId: $lectureId}';
  }
}

/// generated route for
/// [_i10.VideoFeedView]
class VideoFeedViewRoute extends _i14.PageRouteInfo<void> {
  const VideoFeedViewRoute()
      : super(
          VideoFeedViewRoute.name,
          path: '/video-feed-view',
        );

  static const String name = 'VideoFeedView';
}

/// generated route for
/// [_i11.AssetPlayerView]
class AssetPlayerViewRoute extends _i14.PageRouteInfo<void> {
  const AssetPlayerViewRoute()
      : super(
          AssetPlayerViewRoute.name,
          path: '/asset-player-view',
        );

  static const String name = 'AssetPlayerView';
}

/// generated route for
/// [_i12.UnknownView]
class UnknownViewRoute extends _i14.PageRouteInfo<void> {
  const UnknownViewRoute()
      : super(
          UnknownViewRoute.name,
          path: '/404',
        );

  static const String name = 'UnknownView';
}

extension RouterStateExtension on _i13.RouterService {
  Future<dynamic> navigateToStartupView(
      {void Function(_i14.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const StartupViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToHomeView(
      {void Function(_i14.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToQuizView({
    _i15.Key? key,
    required String lectureId,
    void Function(_i14.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      QuizViewRoute(
        key: key,
        lectureId: lectureId,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToFlashcardView({
    _i15.Key? key,
    required String lectureId,
    void Function(_i14.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      FlashcardViewRoute(
        key: key,
        lectureId: lectureId,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToStudentHomeView(
      {void Function(_i14.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const StudentHomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToMainLayoutView({
    _i15.Key? key,
    required _i15.Widget body,
    void Function(_i14.NavigationFailure)? onFailure,
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
    _i15.Key? key,
    required String lectureId,
    void Function(_i14.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      StudentDashboardViewRoute(
        key: key,
        lectureId: lectureId,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToTeacherHomeView(
      {void Function(_i14.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const TeacherHomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToTeacherDashboardView({
    _i15.Key? key,
    required int lectureNumber,
    required String lectureId,
    void Function(_i14.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      TeacherDashboardViewRoute(
        key: key,
        lectureNumber: lectureNumber,
        lectureId: lectureId,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToVideoFeedView(
      {void Function(_i14.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const VideoFeedViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToAssetPlayerView(
      {void Function(_i14.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const AssetPlayerViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToUnknownView(
      {void Function(_i14.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const UnknownViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithStartupView(
      {void Function(_i14.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const StartupViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithHomeView(
      {void Function(_i14.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithQuizView({
    _i15.Key? key,
    required String lectureId,
    void Function(_i14.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      QuizViewRoute(
        key: key,
        lectureId: lectureId,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithFlashcardView({
    _i15.Key? key,
    required String lectureId,
    void Function(_i14.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      FlashcardViewRoute(
        key: key,
        lectureId: lectureId,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithStudentHomeView(
      {void Function(_i14.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const StudentHomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithMainLayoutView({
    _i15.Key? key,
    required _i15.Widget body,
    void Function(_i14.NavigationFailure)? onFailure,
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
    _i15.Key? key,
    required String lectureId,
    void Function(_i14.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      StudentDashboardViewRoute(
        key: key,
        lectureId: lectureId,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithTeacherHomeView(
      {void Function(_i14.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const TeacherHomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithTeacherDashboardView({
    _i15.Key? key,
    required int lectureNumber,
    required String lectureId,
    void Function(_i14.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      TeacherDashboardViewRoute(
        key: key,
        lectureNumber: lectureNumber,
        lectureId: lectureId,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithVideoFeedView(
      {void Function(_i14.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const VideoFeedViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithAssetPlayerView(
      {void Function(_i14.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const AssetPlayerViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithUnknownView(
      {void Function(_i14.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const UnknownViewRoute(),
      onFailure: onFailure,
    );
  }
}
