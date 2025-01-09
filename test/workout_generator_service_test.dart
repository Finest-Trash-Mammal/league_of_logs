import 'package:flutter_test/flutter_test.dart';
import 'package:league_of_logs/src/core/constants.dart';
import 'package:league_of_logs/src/features/workout_generator/player_stats_DTO.dart';
import 'package:league_of_logs/src/features/workout_generator/domain/workout_generator_service.dart';

void main() {
  group('WorkoutGeneratorService', () {
    final service = WorkoutGeneratorService();

    test('generates workout correctly for decent ADC stats on Advanced fitness', () {
      // Arrange
      final PlayerStatsDTO stats = PlayerStatsDTO(
        name: 'Demo1Ace',
        role: 'ADC',
        isMVP: true,
        kills: 15,
        deaths: 5,
        assists: 8,
        teamKills: 46,
        creepScore: 194,
        visionScore: 15,
        gameDuration: 37,
      );
      final String fitnessLevel = 'Advanced';

      // Act
      final result = service.generateWorkout(playerStats: stats, fitnessLevel: fitnessLevel);

      // Assert
      expect(result, testAdvancedFitnessADC);
    });
  });
}
