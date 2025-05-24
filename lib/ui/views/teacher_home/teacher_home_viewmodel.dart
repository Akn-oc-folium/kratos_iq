import 'package:kratos_iq/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';

class TeacherHomeViewModel extends BaseViewModel {
  List<Map<String, dynamic>> teacherMetric = [
    {
      'title': '4.6 / 5',
      'subTitle': 'Lecture Clarity Score',
      'color': kcDarkGreenColor,
    },
    {
      'title': '92%',
      'subTitle': 'Subject Coverage',
      'color': kcDarkGreenColor,
    },
    {
      'title': '78%',
      'subTitle': 'Student Retention',
      'color': kcDarkGreenColor,
    },
    {
      'title': 'High',
      'subTitle': 'Engagement Index',
      'color': kcDarkGreenColor,
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
}
