import 'package:kratos_iq/app/app.locator.dart';
import 'package:kratos_iq/gen/assets.gen.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class TeacherLectureViewModel extends BaseViewModel {
  final int lectureNumber;

  final _routerService = locator<RouterService>();

  TeacherLectureViewModel(this.lectureNumber);

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

  void goBack() {
    _routerService.back();
  }
}
