part of 'package:kalshi/find_financial_wellness_score/view/find_financial_wellness_score_page.dart';

class _FinancialCard extends StatelessWidget {
  const _FinancialCard();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Container(
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
            l10n.findFinancialWellnessTest,
            style: Typographies.xsHeadingSmall,
          ),
          Text(
            l10n.findFinancialWellnessYourInformation,
            style: Typographies.xsParagraph,
          ),
          const SizedBox(height: Spacings.componentM),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Annual Income
              Text(
                l10n.findFinancialWellnessAnnualIncome,
                style: Typographies.xsDescription,
              ),
              const SizedBox(height: Spacings.componentS),
              BlocBuilder<FindFinancialWellnessScoreCubit,
                  FindFinancialWellnessScoreState>(
                buildWhen: (previous, current) =>
                    previous.annualIncome != current.annualIncome,
                builder: (context, state) {
                  return TextFormField(
                    onChanged: (value) => context
                        .read<FindFinancialWellnessScoreCubit>()
                        .annualIncomeChanged(value),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFFE9EEF2), width: 21.0),
                      ),
                      errorText: state.annualIncome.displayError != null
                          ? l10n
                              .findFinancialWellnessFinancialInvalidAnnualIncome
                          : null,
                      prefixIcon: Padding(
                        padding: const EdgeInsetsDirectional.only(
                          start: Spacings.componentM,
                        ),
                        child: SvgPicture.asset(
                          AssetPaths.dollarSign,
                        ),
                      ),
                    ),
                    textInputAction: TextInputAction.next,
                    style: Typographies.lgHeadingSmall,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  );
                },
              ),
              const SizedBox(height: Spacings.componentM),
              // Monthly Costs
              Text(
                l10n.findFinancialWellnessMontlyCosts,
                style: Typographies.xsDescription,
              ),
              const SizedBox(height: Spacings.componentS),
              BlocBuilder<FindFinancialWellnessScoreCubit,
                  FindFinancialWellnessScoreState>(
                buildWhen: (previous, current) =>
                    previous.monthlyCosts != current.monthlyCosts,
                builder: (context, state) {
                  return TextFormField(
                    onChanged: (value) => context
                        .read<FindFinancialWellnessScoreCubit>()
                        .monthlyCostsChanged(value),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFFE9EEF2), width: 21.0),
                      ),
                      errorText: state.monthlyCosts.displayError != null
                          ? l10n
                              .findFinancialWellnessFinancialInvalidMonthlyCosts
                          : null,
                      prefixIcon: Padding(
                        padding: const EdgeInsetsDirectional.only(
                          start: Spacings.componentM,
                        ),
                        child: SvgPicture.asset(
                          AssetPaths.dollarSign,
                        ),
                      ),
                    ),
                    textInputAction: TextInputAction.next,
                    style: Typographies.lgHeadingSmall,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: Spacings.componentM),
          BlocBuilder<FindFinancialWellnessScoreCubit,
              FindFinancialWellnessScoreState>(
            builder: (context, state) {
              return state.status.isInProgress
                  ? const CircularProgressIndicator()
                  : KalshiButton(
                      buttonLabel: l10n.findFinancialWellnessContinue,
                      onPressed: state.isValid
                          ? () {
                              context
                                  .read<FindFinancialWellnessScoreCubit>()
                                  .submitForm();
                            }
                          : null,
                    );
            },
          )
        ],
      ),
    );
  }
}
