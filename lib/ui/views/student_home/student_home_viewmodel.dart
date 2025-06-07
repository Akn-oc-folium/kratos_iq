import 'package:kratos_iq/app/app.locator.dart';
import 'package:kratos_iq/app/app.router.dart';
import 'package:kratos_iq/gen/assets.gen.dart';
import 'package:kratos_iq/models/quiz_overview_model.dart';
import 'package:kratos_iq/services/api_service.dart';
import 'package:kratos_iq/ui/common/app_colors.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StudentHomeViewModel extends BaseViewModel {
  final _routerService = locator<RouterService>();
  final ApiService _apiService = locator<ApiService>();

  final List<CheckboxState> taskSelections =
      List<CheckboxState>.filled(3, CheckboxState.unchecked);

  bool isLoading = false;
  List<Map<String, dynamic>> lectures = [];

  List<QuizDatum> quizzes = [];

  final taskLabels = [
    'Submit case study for “Design Systems” - Due Today',
    'Flashcards review for “Data Structures” - Due Tomorrow',
    'Quiz: "Set Theory Basics" - Due April 15',
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

  Future<void> init() async {
    await fetchLectureOverview();
    await fetchQuizOverview();
    await fetchFlashCardOverview();
  }

  void toggleAt(int index, CheckboxState value) {
    if (index < 0 || index >= taskSelections.length) return;
    taskSelections[index] = value;
    notifyListeners();
  }

  navigateToLecturePage(String lectureId) {
    _routerService.navigateToStudentDashboardView(lectureId: lectureId);
  }

  navigateToQuiz(String lectureId) {
    _routerService.navigateToQuizView(lectureId: lectureId);
  }

  navigateToFlashCard(String lectureId) {
    _routerService.navigateToFlashcardView(lectureId: lectureId);
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

  Future<void> fetchLectureOverview() async {
    isLoading = true;
    notifyListeners();
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
      notifyListeners();
    } catch (e) {
      debugPrint('Error fetching lecture overview: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchQuizOverview() async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await _apiService.getQuizOverview();
      quizzes = response.data;
      notifyListeners();
    } catch (e) {
      debugPrint('Error fetching quiz overview: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchFlashCardOverview() async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await _apiService.getFlashCardOverview();

      flashcards = response.data.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;

        return {
          'lectureNumber': item.lectureNumber,
          'lectureId': item.lectureId,
          'label': item.label,
          'content': item.content,
          'assetImage': assetImages[index % assetImages.length],
        };
      }).toList();
      notifyListeners();
    } catch (e) {
      debugPrint('Error fetching flashcard overview: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
