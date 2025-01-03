import 'package:flutter/material.dart';
import 'package:telios_2/model/model.dart';
import 'package:dartz/dartz.dart';
import 'package:telios_2/view_model/levels/db/assigned_level_db.dart';
import 'package:telios_2/view_model/levels/db/map_level_db.dart';
import 'package:telios_2/view_model/levels/db/survey_level_db.dart';
import 'package:telios_2/view_model/survey/db/survey_db.dart';

class DashboardRepository {
  DashboardRepository._();
  static final instance = DashboardRepository._();

  // Use DB instances instead of direct Hive boxes
  final _surveyDB = SurveyDB.instance;
  final _assignedLevelDB = AssignedLevelDB.instance;
  final _mapLevelDB = MapLevelDB.instance;
  final _surveyLevelDB = SurveyLevelDB.instance;

  // Fetch assigned levels basic info from Hive DB
  Future<Either<String, List<LevelInfo>>> fetchAssignedLevels() async {
    try {
      final levels = await _assignedLevelDB.fetchAllAssignedLevels();
      return Right(levels);
    } catch (e) {
      debugPrint('Error fetching assigned levels: $e');
      return const Left('Failed to fetch assigned levels');
    }
  }

  // Fetch map levels basic info from Hive DB
  Future<Either<String, List<LevelInfo>>> fetchMapLevels() async {
    try {
      final levels = await _mapLevelDB.fetchAllMapLevels();
      return Right(levels);
    } catch (e) {
      debugPrint('Error fetching map levels: $e');
      return const Left('Failed to fetch map levels');
    }
  }

  // Fetch survey levels basic info from Hive DB
  Future<Either<String, List<LevelInfo>>> fetchSurveyLevels() async {
    try {
      final levels = await _surveyLevelDB.fetchAllSurveyLevels();
      return Right(levels);
    } catch (e) {
      debugPrint('Error fetching survey levels: $e');
      return const Left('Failed to fetch survey levels');
    }
  }

  // Fetch survey answers from Hive DB
  Future<Either<String, List<SurveyAnswerModel>>> fetchSurveyAnswers() async {
    try {
      final answers = await _surveyDB.fetchAllSurveyAnswerDB();
      return Right(answers ?? []);
    } catch (e) {
      debugPrint('Error fetching survey answers: $e');
      return const Left('Failed to fetch survey answers');
    }
  }

  // Fetch survey categories from Hive DB
  
}
