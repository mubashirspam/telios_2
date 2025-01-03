import 'package:flutter/material.dart';
import 'package:telios_2/model/model.dart';
import 'package:telios_2/view_model/dashboard/dashboard_repository.dart';
import 'package:dartz/dartz.dart';

class DashboardService {
  DashboardService._();
  static final instance = DashboardService._();

  final _repository = DashboardRepository.instance;

  // Get all assigned levels
  Future<Either<String, List<LevelInfo>>> getAssignedLevels() async {
    try {
      return await _repository.fetchAssignedLevels();
    } catch (e) {
      debugPrint('Error getting assigned levels: $e');
      return const Left('Failed to get assigned levels');
    }
  }

  // Get all map levels
  Future<Either<String, List<LevelInfo>>> getMapLevels() async {
    try {
      return await _repository.fetchMapLevels();
    } catch (e) {
      debugPrint('Error getting map levels: $e');
      return const Left('Failed to get map levels');
    }
  }

  // Get all survey levels
  Future<Either<String, List<LevelInfo>>> getSurveyLevels() async {
    try {
      return await _repository.fetchSurveyLevels();
    } catch (e) {
      debugPrint('Error getting survey levels: $e');
      return const Left('Failed to get survey levels');
    }
  }

  // Get all survey answers
  Future<Either<String, List<SurveyAnswerModel>>> getSurveyAnswers() async {
    try {
      return await _repository.fetchSurveyAnswers();
    } catch (e) {
      debugPrint('Error getting survey answers: $e');
      return const Left('Failed to get survey answers');
    }
  }


  
}
