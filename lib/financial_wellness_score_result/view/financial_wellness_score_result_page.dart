import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:score_repository/score_repository.dart';

import 'package:kalshi/app/routes/routes.dart';
import 'package:kalshi/constants/assets_paths.dart';
import 'package:kalshi/l10n/l10n.dart';
import 'package:kalshi/theme/colors.dart';
import 'package:kalshi/theme/spacings.dart';
import 'package:kalshi/theme/typographies.dart';
import 'package:kalshi/widgets/financial_encrypted_information.dart';
import 'package:kalshi/widgets/financial_headline.dart';
import 'package:kalshi/widgets/kalshi_button.dart';

import '../cubit/financial_wellness_score_result_cubit.dart';

class FinancialWellnessScoreResultArguments {
  final Score score;

  const FinancialWellnessScoreResultArguments({required this.score});
}

class FinancialWellnessScoreResultPage extends StatelessWidget {
  const FinancialWellnessScoreResultPage(
      {required this.financialWellnessScoreResultArguments, super.key});

  final FinancialWellnessScoreResultArguments
      financialWellnessScoreResultArguments;

  static void route(BuildContext context, {required Score score}) {
    GoRouter.of(context).pushNamed(
      RouteName.financialWellnessScoreResult,
      extra: FinancialWellnessScoreResultArguments(score: score),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FinancialWellnessScoreResultCubit(
        scoreRepository: context.read<ScoreRepository>(),
        score: financialWellnessScoreResultArguments.score,
      )..load(),
      child: const FinancialWellnessScoreResultView(),
    );
  }
}

class FinancialWellnessScoreResultView extends StatelessWidget {
  const FinancialWellnessScoreResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FinancialWellnessScoreResultCubit,
        FinancialWellnessScoreResultState>(
      builder: (context, state) {
        return switch (state) {
          FinancialWellnessScoreResultSuccess() =>
            _FinacialWellnessResult(score: state.score),
          FinancialWellnessScoreResultInitial() => const SizedBox.shrink(),
          FinancialWellnessScoreResultLoadingInProgress() =>
            const CircularProgressIndicator(),
          FinancialWellnessScoreResultFailure() => const SizedBox.shrink(),
        };
      },
    );
  }
}

class _FinacialWellnessResult extends StatelessWidget {
  const _FinacialWellnessResult({required this.score});

  final Score score;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      backgroundColor: AppColors.backgroundSecondary,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          centerTitle: true,
          title: SvgPicture.asset(AssetPaths.kalshiLogoBlack),
          elevation: 0,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: Spacings.componentL,
          left: Spacings.componentM,
          right: Spacings.componentM,
        ),
        child: ListView(
          children: [
            FinancialHeadline(
              firstTitle: l10n.financialWellnessScoreResultTitleFirst,
              lastTitle: l10n.financialWellnessScoreResultTitleLast,
            ),
            const SizedBox(height: Spacings.componentL),
            Container(
              padding: const EdgeInsets.all(Spacings.componentM),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.secondary.withOpacity(0.08),
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Hero(
                    tag: AssetPaths.kalshiLogoRound,
                    child: SvgPicture.asset(AssetPaths.kalshiLogoRound),
                  ),
                  const SizedBox(height: Spacings.componentM),
                  Text(
                    _getFinancialHealthText(
                      financialHealth: score.financialHealth,
                      l10n: l10n,
                    ).title,
                    style: Typographies.xsHeadingSmall,
                  ),
                  const SizedBox(height: Spacings.componentL),
                  switch (score.financialHealth) {
                    FinancialHealth.healthy =>
                      SvgPicture.asset(AssetPaths.healthlyScore),
                    FinancialHealth.average =>
                      SvgPicture.asset(AssetPaths.averageScore),
                    FinancialHealth.caution =>
                      SvgPicture.asset(AssetPaths.cautionScore),
                    FinancialHealth.notCalculated => const SizedBox.shrink(),
                  },
                  const SizedBox(height: Spacings.componentL),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: Typographies.xsParagraph.copyWith(
                        color: AppColors.accent,
                      ),
                      children: [
                        TextSpan(
                            text: l10n
                                .financialWellnessScoreResultDescriptionFirst),
                        TextSpan(
                          text: _getFinancialHealthText(
                            financialHealth: score.financialHealth,
                            l10n: l10n,
                          ).description,
                          style: Typographies.xsParagraphSemiBold.copyWith(
                            color: AppColors.accent,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: Spacings.componentXl),
                  KalshiButton(
                    buttonLabel: l10n.financialWellnessScoreResultReturn,
                    buttonType: KalshiButtonType.secondary,
                    onPressed: context.pop,
                  ),
                ],
              ),
            ),
            const SizedBox(height: Spacings.componentXl + Spacings.componentXs),
            FinancialEncryptedInformation(
              informationText: l10n.financialEncryptedInformation,
            )
          ],
        ),
      ),
    );
  }

  ({String title, String description}) _getFinancialHealthText({
    required FinancialHealth financialHealth,
    required AppLocalizations l10n,
  }) {
    switch (financialHealth) {
      case FinancialHealth.healthy:
        return (
          title: l10n.financialWellnessScoreResultCongratulations,
          description: l10n.financialWellnessScoreResultDescriptionLastHealthy
        );
      case FinancialHealth.average:
        return (
          title: l10n.financialWellnessScoreResultImprovements,
          description: l10n.financialWellnessScoreResultDescriptionLastAverage
        );
      case FinancialHealth.caution:
        return (
          title: l10n.financialWellnessScoreResultCaution,
          description: l10n.financialWellnessScoreResultDescriptionLastCaution
        );
      case FinancialHealth.notCalculated:
        return (title: '', description: '');
    }
  }
}
