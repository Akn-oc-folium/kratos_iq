import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:kratos_iq/app/app.locator.dart';
import 'package:kratos_iq/app/app.router.dart';
import 'package:kratos_iq/gen/assets.gen.dart';
import 'package:kratos_iq/services/api_service.dart';
import 'package:kratos_iq/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class TeacherHomeViewModel extends BaseViewModel {
  final RouterService _routerService = locator<RouterService>();
  final ApiService _apiService = locator<ApiService>();

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
      'color': kcGreen700,
    },
    {
      'lectureNumber': 2,
      'lecture': 'Lecture 2',
      'date': 'Apr 8',
      'color': kcEmerald700,
    },
    {
      'lectureNumber': 3,
      'lecture': 'Lecture 3',
      'date': 'Apr 2',
      'color': kcTeal700,
    },
    {
      'lectureNumber': 4,
      'lecture': 'Lecture 4',
      'date': 'Apr 10',
      'color': kcGreen700,
    },
    {
      'lectureNumber': 5,
      'lecture': 'Lecture 5',
      'date': 'Apr 8',
      'color': kcEmerald700,
    },
    {
      'lectureNumber': 6,
      'lecture': 'Lecture 6',
      'date': 'Apr 2',
      'color': kcTeal700,
    },
  ];

  String _formatDate(DateTime date) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return '${months[date.month - 1]} ${date.day}';
  }

  final List<Color> _lectureColors = [
    kcGreen700,
    kcEmerald700,
    kcTeal700,
  ];

  final List<String> assetImages = [
    Assets.images.designFundamentals.path,
    Assets.images.aiEthics.path,
    Assets.images.setTheory.path,
    Assets.images.vectorSpaces.path,
  ];
  Future<void> init() async {
    setBusy(true);
    await fetchLectureOverview();
    setBusy(false);
  }

  Future<void> fetchLectureOverview() async {
    try {
      final response = await _apiService.getLectureOverview();
      final lectureOverview = response;

      lectures = lectureOverview.data.asMap().entries.map((entry) {
        int index = entry.key;
        final lecture = entry.value;

        return {
          'lectureId': lecture.lectureId,
          'lectureNumber': lecture.lectureNumber,
          'lecture': 'Lecture ${lecture.lectureNumber}',
          'date': _formatDate(lecture.date),
          'color': _lectureColors[index % _lectureColors.length],
        };
      }).toList();
    } catch (e) {
      debugPrint('Error fetching lecture overview: $e');
    }
  }

  navigateToLecturePage(int lectureNumber, String lectureId) {
    _routerService.navigateToTeacherDashboardView(
        lectureNumber: lectureNumber, lectureId: lectureId);
  }
}
