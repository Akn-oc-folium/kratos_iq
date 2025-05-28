import 'package:dio/dio.dart';
import 'package:kratos_iq/models/flashcard_overview_model.dart';
import 'package:kratos_iq/models/lecture_overview_model.dart';
import 'package:kratos_iq/models/quiz_overview_model.dart';
import 'package:kratos_iq/services/api_client.dart';
import 'package:kratos_iq/services/api_exceptions.dart';
import 'package:kratos_iq/ui/common/app_constants.dart';

class ApiService {
  ApiClient apiClient = ApiClient();

  Future<LectureOverview> getLectureOverview() async {
    try {
      final Response<dynamic> response = await apiClient.get(
        AppConstants.lectureOverviewEndpoint,
      );
      if (response.statusCode == 200) {
        return LectureOverview.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to fetch the lectures!');
      }
    } catch (e) {
      String errorMessage;
      if (e is DioException) {
        errorMessage = DioExceptions.fromDioError(e).toString();
      } else {
        errorMessage = 'An unexpected error occurred: ${e.toString()}';
      }
      throw errorMessage;
    }
  }

  Future<QuizOverview> getQuizOverview() async {
    try {
      final Response<dynamic> response = await apiClient.get(
        AppConstants.quizOverviewEndpoint,
      );
      if (response.statusCode == 200) {
        return QuizOverview.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to fetch the quizzes!');
      }
    } catch (e) {
      String errorMessage;
      if (e is DioException) {
        errorMessage = DioExceptions.fromDioError(e).toString();
      } else {
        errorMessage = 'An unexpected error occurred: ${e.toString()}';
      }
      throw errorMessage;
    }
  }

  Future<FlashCardOverview> getFlashCardOverview() async {
    try {
      final Response<dynamic> response = await apiClient.get(
        AppConstants.flashCardOverviewEndpoint,
      );
      if (response.statusCode == 200) {
        return FlashCardOverview.fromJson(
            response.data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to fetch the quizzes!');
      }
    } catch (e) {
      String errorMessage;
      if (e is DioException) {
        errorMessage = DioExceptions.fromDioError(e).toString();
      } else {
        errorMessage = 'An unexpected error occurred: ${e.toString()}';
      }
      throw errorMessage;
    }
  }

  Future<FlashCardOverview> getFlashCards(String lectureId) async {
    try {
      final Response<dynamic> response = await apiClient.get(
        AppConstants.flashCardOverviewEndpoint,
        queryParameters: {
          'lecture_id': lectureId,
        },
      );
      if (response.statusCode == 200) {
        return FlashCardOverview.fromJson(
            response.data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to fetch the quizzes!');
      }
    } catch (e) {
      String errorMessage;
      if (e is DioException) {
        errorMessage = DioExceptions.fromDioError(e).toString();
      } else {
        errorMessage = 'An unexpected error occurred: ${e.toString()}';
      }
      throw errorMessage;
    }
  }
}
