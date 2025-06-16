import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:kratos_iq/app/app.locator.dart';
import 'package:kratos_iq/gen/assets.gen.dart';
import 'package:kratos_iq/models/lecture_detail.model.dart';
import 'package:kratos_iq/services/api_service.dart';
import 'package:kratos_iq/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_launcher_web/url_launcher_web.dart';

class StudentDashboardViewModel extends BaseViewModel {
  final _routerService = locator<RouterService>();
  final _apiService = locator<ApiService>();

  StudentDashboardViewModel(this.lectureId);

  final String lectureId;

  LectureInfo? _lectureDetails;
  LectureInfo? get lectureDetails => _lectureDetails;

  String _audioUrl = '';
  String get audioUrl => _audioUrl;

  String _transcript = '';
  String get transcript => _transcript;

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
      'lecture': 'Lecture 3',
      'date': 'Mar 31',
      'color': kcGreen700,
    },
    {
      'lectureNumber': 5,
      'lecture': 'Lecture 3',
      'date': 'Mar 28',
      'color': kcEmerald700,
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

  final List<Color> lectureColors = [
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
    await getLectureDetails();
    setBusy(false);
  }

  Future<void> getLectureDetails() async {
    try {
      _lectureDetails = await _apiService.getLectureInfo(lectureId);
      _audioUrl = _lectureDetails?.data?.presignedDownloadUrl ?? '';
      _transcript = _lectureDetails?.data?.transcript ?? '';
      notifyListeners();
    } catch (e) {
      debugPrint("$e");
    }
  }

  Future<void> openSupplementaryLink(String? url) async {
    if (!await UrlLauncherPlugin().launch(
      url!,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  void goBack() {
    _routerService.back();
  }
}
