// @stacked-import
import 'package:kratos_iq/services/api_service.dart';
import 'package:kratos_iq/services/device_service.dart';
import 'package:kratos_iq/services/role_service.dart';
import 'package:kratos_iq/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:kratos_iq/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:kratos_iq/ui/views/asset_player/asset_player_view.dart';
import 'package:kratos_iq/ui/views/flashcard/flashcard_view.dart';
import 'package:kratos_iq/ui/views/home/home_view.dart';
import 'package:kratos_iq/ui/views/main_layout/main_layout_view.dart';
import 'package:kratos_iq/ui/views/quiz/quiz_view.dart';
import 'package:kratos_iq/ui/views/startup/startup_view.dart';
import 'package:kratos_iq/ui/views/student_dashboard/student_dashboard_view.dart';
import 'package:kratos_iq/ui/views/student_home/student_home_view.dart';
import 'package:kratos_iq/ui/views/teacher_home/teacher_home_view.dart';
import 'package:kratos_iq/ui/views/teacher_lecture/teacher_lecture_view.dart';
import 'package:kratos_iq/ui/views/unknown/unknown_view.dart';
import 'package:kratos_iq/ui/views/video_feed/video_feed_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

// @stacked-route
@StackedApp(
  routes: [
    CustomRoute(page: StartupView, initial: true),
    CustomRoute(page: HomeView, path: '/home'),
    CustomRoute(page: QuizView, path: '/quiz'),
    CustomRoute(page: FlashcardView, path: '/flashcard'),
    CustomRoute(page: StudentHomeView, path: '/home/student'),
    CustomRoute(page: MainLayoutView),
    CustomRoute(page: StudentDashboardView, path: '/student/dashboard'),
    CustomRoute(page: TeacherHomeView, path: '/home/teacher'),
    CustomRoute(page: TeacherDashboardView, path: '/teacher/dashboard'),
    CustomRoute(page: VideoFeedView),
    CustomRoute(page: AssetPlayerView),
    CustomRoute(page: UnknownView, path: '/404'),

    /// When none of the above routes match, redirect to UnknownView
    RedirectRoute(path: '*', redirectTo: '/404'),
  ],
  // @stacked-service
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: RouterService),
    LazySingleton(classType: RoleService),
    LazySingleton(classType: DeviceService),
    LazySingleton(classType: ApiService),
  ],
  // @stacked-bottom-sheet
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
  ],
  // @stacked-dialog
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
  ],
)
class App {}
