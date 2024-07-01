import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:kalshi/financial_wellness_score_result/view/view.dart';
import 'package:kalshi/find_financial_wellness_score/find_financial_wellness_score.dart';
import 'package:kalshi/l10n/l10n.dart';
import 'package:kalshi/constants/assets_paths.dart';
import 'package:kalshi/theme/colors.dart';
import 'package:kalshi/theme/spacings.dart';
import 'package:kalshi/theme/typographies.dart';
import 'package:kalshi/widgets/kalshi_button.dart';
import 'package:kalshi/widgets/financial_encrypted_information.dart';
import 'package:kalshi/widgets/financial_headline.dart';
import 'package:score_repository/score_repository.dart';

part 'package:kalshi/find_financial_wellness_score/widgets/financial_card.dart';

class FindFinancialWellnessScorePage extends StatelessWidget {
  const FindFinancialWellnessScorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FindFinancialWellnessScoreCubit(),
      child: const FindFinancialWellnessScoreView(),
    );
  }
}

class FindFinancialWellnessScoreView extends StatelessWidget {
  const FindFinancialWellnessScoreView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocListener<FindFinancialWellnessScoreCubit,
        FindFinancialWellnessScoreState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status.isSuccess) {
          FinancialWellnessScoreResultPage.route(
            context,
            score: Score(
              annualIncome: state.annualIncome.value,
              monthlyCosts: state.monthlyCosts.value,
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
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
                firstTitle: l10n.findFinancialWellnessScoreTitleFirst,
                lastTitle: l10n.findFinancialWellnessScoreTitleLast,
              ),
              const SizedBox(height: Spacings.componentL),
              const _FinancialCard(),
              const SizedBox(
                  height: Spacings.componentXl + Spacings.componentXs),
              FinancialEncryptedInformation(
                informationText: l10n.financialEncryptedInformation,
              )
            ],
          ),
        ),
      ),
    );
  }
}
