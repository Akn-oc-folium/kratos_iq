import 'package:flutter/foundation.dart';
import 'package:kratos_iq/app/app.locator.dart';
import 'package:kratos_iq/gen/assets.gen.dart';
import 'package:kratos_iq/models/lecture_detail.model.dart';
import 'package:kratos_iq/services/api_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class TeacherDashboardViewModel extends BaseViewModel {
  final _routerService = locator<RouterService>();
  final _apiService = locator<ApiService>();

  TeacherDashboardViewModel(this.lectureNumber, this.lectureId);

  final int lectureNumber;
  final String lectureId;

  LectureInfo? _lectureDetails;
  LectureInfo? get lectureDetails => _lectureDetails;

  String _audioUrl = '';
  String get audioUrl => _audioUrl;

  String _transcript = '';
  String get transcript => _transcript;

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

  String overViewContext =
      'Lorem ipsum dolor sit amet consectetur. Vitae aliquam platea mi cras felis ultrices in volutpat blandit. Cras mauris eget aliquet integer quis. Tempor sapien convallis maecenas scelerisque. Ipsum faucibus quis mattis malesuada suspendisse amet nibh tortor. Sed quisque sit lorem fermentum leo eget magnis. Nec enim vitae non ac in enim aliquam egestas enim. Augue volutpat ornare eu auctor adipiscing. Elit nisl est duis arcu tellus arcu. Tristique laoreet tristique aliquet senectus cum ac tincidunt. Eget venenatis orci aliquet nunc amet integer id viverra. Lobortis hac sed condimentum faucibus mus ullamcorper mauris sit ullamcorper. Ipsum aliquam vestibulum a neque vel. Fermentum aliquam eleifend non parturient quisque leo. Quis ac dictum et ultrices cursus nibh sit nunc viverra. Quis ac magna ornare condimentum adipiscing cursus dictum. Montes neque vel dis fermentum mauris enim ultrices. Arcu sem eu amet in cursus in. Et ante dictum nisi dolor. Molestie neque hendrerit sit vestibulum pretium nisi tellus enim. Et tempor eu quis ac. Tortor egestas dis sit leo mauris sit adipiscing dignissim. Nibh vitae vitae sed magna magna vitae sem. Orci habitasse in faucibus quam quis.';

  List<String> notesContext = [
    "Lorem ipsum dolor sit amet consectetur. Vitae aliquam platea mi cras felis ultrices in volutpat blandit. Cras mauris eget aliquet integer quis. Tempor sapien convallis maecenas scelerisque. Ipsum faucibus quis mattis malesuada suspendisse amet nibh tortor.",
    "Sed quisque sit lorem fermentum leo eget magnis. Nec enim vitae non ac in enim aliquam egestas enim. Augue volutpat ornare eu auctor adipiscing. Elit nisl est duis arcu tellus arcu. Tristique laoreet tristique aliquet senectus cum ac tincidunt. Eget venenatis orci aliquet nunc amet integer id viverra.",
    "Lobortis hac sed condimentum faucibus mus ullamcorper mauris sit ullamcorper. Ipsum aliquam vestibulum a neque vel. Fermentum aliquam eleifend non parturient quisque leo. Quis ac dictum et ultrices cursus nibh sit nunc viverra. Quis ac magna ornare condimentum adipiscing cursus dictum.",
    "Montes neque vel dis fermentum mauris enim ultrices. Arcu sem eu amet in cursus in. Et ante dictum nisi dolor. Molestie neque hendrerit sit vestibulum pretium nisi tellus enim. Et tempor eu quis ac. Tortor egestas dis sit leo mauris sit adipiscing dignissim. Nibh vitae vitae sed magna magna vitae sem. Orci habitasse in faucibus quam quis.",
    "Montes neque vel dis fermentum mauris enim ultrices. Arcu sem eu amet in cursus in. Et ante dictum nisi dolor. Molestie neque hendrerit sit vestibulum pretium nisi tellus enim. Et tempor eu quis ac. Tortor egestas dis sit leo mauris sit adipiscing dignissim. Nibh vitae vitae sed magna magna vitae sem. Orci habitasse in faucibus quam quis."
  ];

  Future<void> init() async {
    setBusy(true);
    await getLectureDetails();
    setBusy(false);
  }

  Future<void> getLectureDetails() async {
    try {
      _lectureDetails = await _apiService.getLectureInfo(lectureId);
      _audioUrl = _lectureDetails?.data?.presignedDownloadUrl ?? '';
      _transcript = _lectureDetails?.data?.transcript ?? '';
    } catch (e) {
      debugPrint("$e");
    }
  }

  void goBack() {
    _routerService.back();
  }
}
