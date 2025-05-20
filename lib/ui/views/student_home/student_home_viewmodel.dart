import 'package:kratos_iq/app/app.locator.dart';
import 'package:kratos_iq/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:kratos_iq/ui/common/app_colors.dart';
import 'package:kratos_iq/gen/assets.gen.dart';
import 'package:stacked_services/stacked_services.dart';

class StudentHomeViewModel extends BaseViewModel {
  final _routerService = locator<RouterService>();

  List<Map<String, dynamic>> lectures = [
    {
      'lectureNumber': 'Lecture 1',
      'date': 'Apr 10',
      'color': kcDarkGreenColor,
    },
    {
      'lectureNumber': 'Lecture 2',
      'date': 'Apr 8',
      'color': kcGreenColor,
    },
    {
      'lectureNumber': 'Lecture 3',
      'date': 'Apr 2',
      'color': kcLime264,
    },
  ];

  List<Map<String, dynamic>> quizzes = [
    {
      'lectureNumber': 1,
      'title': 'Linear Equations',
      'subTitle': '10 Qs',
    },
    {
      'lectureNumber': 2,
      'title': 'Design Patterns',
      'subTitle': '8 Qs',
    },
    {
      'lectureNumber': 3,
      'title': 'Set Theory Basics',
      'subTitle': '12 Qs',
    },
  ];

  List<Map<String, dynamic>> flashcards = [
    {
      'lectureNumber': 1,
      'assetImage': Assets.images.designFundamentals.path,
      'label': 'Design Fundamentals',
      'content': 'User Personas, MVP, Affinity Mapping',
    },
    {
      'lectureNumber': 2,
      'assetImage': Assets.images.aiEthics.path,
      'label': 'AI Ethics',
      'content': 'Ethical Frameworks, Bias, Transparency',
    },
    {
      'lectureNumber': 3,
      'assetImage': Assets.images.setTheory.path,
      'label': 'Set Theory',
      'content': 'Union, Intersection, Subset, Cardinality',
    },
    {
      'lectureNumber': 4,
      'assetImage': Assets.images.vectorSpaces.path,
      'label': 'Set Theory',
      'content': 'Dot Product, Basis Vectors, Subspace',
    },
  ];

  navigateToQuiz(int lectureNumber) {
    _routerService.navigateToQuizView(lectureNumber: lectureNumber);
  }

  navigateToFlashCard(int lectureNumber) {
    _routerService.navigateToFlashcardView(lectureNumber: lectureNumber);
  }
}
