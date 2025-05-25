import 'package:kratos_iq/app/app.locator.dart';
import 'package:kratos_iq/app/app.router.dart';
import 'package:kratos_iq/gen/assets.gen.dart';
import 'package:kratos_iq/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class TeacherHomeViewModel extends BaseViewModel {
  final RouterService _routerService = locator<RouterService>();

  List<Map<String, dynamic>> teacherMetric = [
    {
      'title': '4.6 / 5',
      'subTitle': 'Lecture Clarity Score',
      'assetImage': Assets.images.designFundamentals.path,
    },
    {
      'title': '92%',
      'subTitle': 'Subject Coverage',
      'assetImage': Assets.images.aiEthics.path,
    },
    {
      'title': '78%',
      'subTitle': 'Student Retention',
      'assetImage': Assets.images.setTheory.path,
    },
    {
      'title': 'High',
      'subTitle': 'Engagement Index',
      'assetImage': Assets.images.vectorSpaces.path,
    },
  ];

  List<Map<String, dynamic>> lectures = [
    {
      'lectureNumber': 1,
      'lecture': 'Lecture 1',
      'date': 'Apr 10',
      'color': kcDarkGreenColor,
    },
    {
      'lectureNumber': 2,
      'lecture': 'Lecture 2',
      'date': 'Apr 8',
      'color': kcGreenColor,
    },
    {
      'lectureNumber': 3,
      'lecture': 'Lecture 3',
      'date': 'Apr 2',
      'color': kcLime264,
    },
    {
      'lectureNumber': 1,
      'lecture': 'Lecture 1',
      'date': 'Apr 10',
      'color': kcDarkGreenColor,
    },
    {
      'lectureNumber': 2,
      'lecture': 'Lecture 2',
      'date': 'Apr 8',
      'color': kcGreenColor,
    },
    {
      'lectureNumber': 3,
      'lecture': 'Lecture 3',
      'date': 'Apr 2',
      'color': kcLime264,
    },
  ];

  navigateToLecturePage(int lectureNumber) {
    _routerService.navigateToTeacherLectureView(lectureNumber: lectureNumber);
  }
}
