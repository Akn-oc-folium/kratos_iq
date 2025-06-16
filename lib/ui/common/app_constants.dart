/// The max width the content can ever take up on the screen
const double kdDesktopMaxContentWidth = 1150;

// The max height the homeview will take up
const double kdDesktopMaxContentHeight = 750;

class AppConstants {
  AppConstants._();

  // App Configs
  static const String appVersion = '0.0.1';

  // API Constants
  static const int receiveTimeout = 10000;
  static const int connectionTimeout = 30000;
  static const String baseUrl = 'https://api.isomorphiq.com/kratos';
  static const String lectureOverviewEndpoint = '/fetch-lectures-overview';
  static const String quizOverviewEndpoint = '/fetch-quizzes-overview';
  static const String quizSetEndpoint = '/fetch-quiz';
  static const String flashCardsOverviewEndpoint =
      '/fetch-flash-cards-overview';
  static const String flashCardsByLectureEndpoint = '/fetch-flash-cards';
  static const String lectureDetailEndpoint = '/fetch-lecture-info';
}
