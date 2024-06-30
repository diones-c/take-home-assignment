import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kalshi/financial_wellness_score_result/view/view.dart';
import 'package:kalshi/find_financial_wellness_score/find_financial_wellness_score.dart';

/// A class that defines the names of the routes in the application.
///
/// This class provides constants for the names of the routes used in the application.
/// The routes are used for navigation within the application.
///
/// Example usage:
/// ```dart
/// Navigator.pushNamed(context, RouteName.findFinancialWellnessScore);
/// ```
abstract class RouteName extends Equatable {
  const RouteName._();

  static const findFinancialWellnessScore = 'find_financial_wellness_score';
  static const financialWellnessScoreResult = 'financial_wellness_score_result';

  @override
  List<Object> get props => [
        findFinancialWellnessScore,
        financialWellnessScoreResult,
      ];
}

/// The route configuration.
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: RouteName.findFinancialWellnessScore,
      builder: (BuildContext context, GoRouterState state) {
        return const FindFinancialWellnessScorePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: RouteName.financialWellnessScoreResult,
          name: RouteName.financialWellnessScoreResult,
          builder: (BuildContext context, GoRouterState state) {
            return FinancialWellnessScoreResultPage(
              financialWellnessScoreResultArguments:
                  state.extra as FinancialWellnessScoreResultArguments,
            );
          },
        ),
      ],
    ),
  ],
);
