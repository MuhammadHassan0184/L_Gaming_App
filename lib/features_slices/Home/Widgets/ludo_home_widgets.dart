import 'package:flutter/material.dart';
import 'package:lgm/Config/app_colors.dart';
import 'package:lgm/Utils/mediaquery_extension.dart';
import 'package:zi_core/zi_core_io.dart';

class LudoHomeWidgets {
  LudoHomeWidgets._();

  // ============================================================
  // TOP HEADER
  // ============================================================

  static Widget topHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: context.responsivePadding(horizontal: 0.045, vertical: 0.012),
      decoration: const BoxDecoration(gradient: AppColors.headerGradient),
      child: Column(
        children: [
          Row(
            children: [
              // Profile
              Container(
                width: context.widthPct(0.095),
                height: context.widthPct(0.095),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ZiColors.white,
                    width: context.widthPct(0.007),
                  ),
                ),
                child: Icon(
                  Icons.person,
                  color: ZiColors.surface,
                  size: context.scaledFont(20),
                ),
              ),

              SizedBox(width: context.widthPct(0.025)),

              // Coins
              Expanded(
                child: _currencyContainer(
                  context,
                  icon: Icons.monetization_on,
                  value: '3,600',
                  iconColor: AppColors.coinYellow,
                ),
              ),

              SizedBox(width: context.widthPct(0.025)),

              // Gems
              Expanded(
                child: _currencyContainer(
                  context,
                  icon: Icons.diamond,
                  value: '5',
                  iconColor: ZiColors.info,
                ),
              ),

              SizedBox(width: context.widthPct(0.025)),

              // Settings
              Container(
                width: context.widthPct(0.095),
                height: context.widthPct(0.095),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ZiColors.white.withValues(alpha: 0.75),
                  border: Border.all(
                    color: AppColors.borderLight,
                    width: context.widthPct(0.003),
                  ),
                ),
                child: Icon(
                  Icons.settings_outlined,
                  size: context.scaledFont(20),
                  color: AppColors.darkText,
                ),
              ),
            ],
          ),

          SizedBox(height: context.heightPct(0.018)),

          Row(
            children: [
              Expanded(
                child: _statusCard(
                  context,
                  icon: "assets/Bronze.png",
                  title: 'Bronze I',
                  subtitle: '12/30',
                  showProgress: true,
                ),
              ),

              SizedBox(width: context.widthPct(0.035)),

              Expanded(
                child: _statusCard(
                  context,
                  icon: "assets/Rank_Trophy.png",
                  title: 'Ranking',
                  subtitle: 'No. 132.254',
                  showProgress: false,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ============================================================
  // LOGO
  // ============================================================

  static Widget logo(BuildContext context) {
    return Image.asset(
      'assets/Ludo_Logo.png',
      width: context.widthPct(0.50),
      height: context.heightPct(0.105),
      fit: BoxFit.contain,
    );
  }

  // ============================================================
  // NOTIFICATION / CALENDAR
  // ============================================================

  static Widget calendarButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: context.widthPct(0.10),
            height: context.widthPct(0.10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ZiColors.white.withValues(alpha: 0.8),
              border: Border.all(
                color: AppColors.borderLight,
                width: context.widthPct(0.003),
              ),
            ),
            child: Icon(
              Icons.calendar_month_outlined,
              color: AppColors.secondaryText,
              size: context.scaledFont(19),
            ),
          ),

          Positioned(
            top: -context.widthPct(0.008),
            right: -context.widthPct(0.005),
            child: Container(
              width: context.widthPct(0.025),
              height: context.widthPct(0.025),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // GAME CARDS
  // ============================================================

  static Widget gameCards(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _gameCard(
            context,
            image: 'assets/1_on_1_game.png',
            title: '1 ON 1',
            subtitle: 'Classic Duo',
            gradient: AppColors.yellowGradient,
            arrowColor: AppColors.darkText,
          ),
        ),

        SizedBox(width: context.widthPct(0.035)),

        Expanded(
          child: _gameCard(
            context,
            image: 'assets/4Player_game.png',
            title: '4 PLAYERS',
            subtitle: 'Friends & Family',
            gradient: AppColors.greenGradient,
            arrowColor: AppColors.darkText,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // START BUTTON
  // ============================================================

  static Widget startButton(BuildContext context, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: context.responsivePadding(horizontal: 0.04, vertical: 0.012),
        decoration: BoxDecoration(
          gradient: AppColors.startGradient,
          borderRadius: BorderRadius.circular(context.widthPct(0.035)),
          boxShadow: [
            BoxShadow(
              color: AppColors.yellowShadow.withValues(alpha: 0.7),
              offset: Offset(0, context.heightPct(0.008)),
              blurRadius: context.widthPct(0.015),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Start',
              style: ZiTypoStyles.titleXl.copyWith(color: AppColors.darkText),
            ),

            SizedBox(height: context.heightPct(0.005)),

            Container(
              padding: context.responsivePadding(
                horizontal: 0.035,
                vertical: 0.004,
              ),
              decoration: BoxDecoration(
                color: ZiColors.white,
                borderRadius: BorderRadius.circular(context.widthPct(0.06)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.monetization_on,
                    color: AppColors.coinYellow,
                    size: context.scaledFont(17),
                  ),

                  SizedBox(width: context.widthPct(0.012)),

                  Text(
                    '600',
                    style: ZiTypoStyles.bodySm.copyWith(
                      color: AppColors.darkText,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // REWARD CARDS
  // ============================================================

  static Widget rewardCards(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _rewardCard(
            context,
            image: 'assets/treasure-chest.png',
            title: 'Daily Reward',
          ),
        ),

        SizedBox(width: context.widthPct(0.035)),

        Expanded(
          child: _rewardCard(
            context,
            image: 'assets/treasure-chest.png',
            title: 'Task Reward',
          ),
        ),
      ],
    );
  }

  // ============================================================
  // PRIVATE WIDGETS
  // ============================================================

  static Widget _currencyContainer(
    BuildContext context, {
    required IconData icon,
    required String value,
    required Color iconColor,
  }) {
    return Container(
      height: context.heightPct(0.037),
      padding: context.responsivePadding(horizontal: 0.018),
      decoration: BoxDecoration(
        color: ZiColors.white.withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(context.widthPct(0.05)),
        border: Border.all(
          color: AppColors.borderLight,
          width: context.widthPct(0.0025),
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: context.scaledFont(16)),

          SizedBox(width: context.widthPct(0.012)),

          Expanded(
            child: Text(
              value,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: ZiTypoStyles.bodySm.copyWith(color: AppColors.darkText),
            ),
          ),

          Container(
            width: context.widthPct(0.035),
            height: context.widthPct(0.035),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.greenDark,
            ),
            child: Icon(
              Icons.add,
              color: ZiColors.white,
              size: context.scaledFont(12),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _statusCard(
    BuildContext context, {
    required String icon,
    required String title,
    required String subtitle,
    required bool showProgress,
  }) {
    return Container(
      height: context.heightPct(0.068),
      padding: context.responsivePadding(horizontal: 0.025, vertical: 0.008),
      decoration: BoxDecoration(
        color: AppColors.purpleCard.withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(context.widthPct(0.035)),
      ),
      child: Row(
        children: [
          Image.asset(
            icon,
            // color: AppColors.gold,
            width: context.scaledFont(35),
            height: context.scaledFont(35),
          ),

          SizedBox(width: context.widthPct(0.02)),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: ZiTypoStyles.caption.copyWith(
                    color: AppColors.darkText,
                  ),
                ),

                SizedBox(height: context.heightPct(0.003)),

                if (showProgress)
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            context.widthPct(0.03),
                          ),
                          child: LinearProgressIndicator(
                            value: 0.4,
                            minHeight: context.heightPct(0.012),
                            backgroundColor: ZiColors.white,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              AppColors.progressGreen,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: context.widthPct(0.012)),

                      Text(
                        subtitle,
                        style: ZiTypoStyles.overMini.copyWith(
                          color: AppColors.secondaryText,
                        ),
                      ),
                    ],
                  )
                else
                  Text(
                    subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: ZiTypoStyles.overMini.copyWith(
                      color: AppColors.secondaryText,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _gameCard(
    BuildContext context, {
    required String image,
    required String title,
    required String subtitle,
    required LinearGradient gradient,
    required Color arrowColor,
  }) {
    return Container(
      padding: context.responsivePadding(horizontal: 0.018, vertical: 0.012),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(context.widthPct(0.035)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.16),
            offset: Offset(0, context.heightPct(0.007)),
            blurRadius: context.widthPct(0.012),
          ),
        ],
      ),
      child: Column(
        children: [
          Image.asset(
            image,
            width: double.infinity,
            height: context.heightPct(0.105),
            fit: BoxFit.contain,
          ),

          Text(
            title,
            textAlign: TextAlign.center,
            style: ZiTypoStyles.titleLg.copyWith(
              color: AppColors.darkText,
              shadows: [
                Shadow(
                  color: Colors.black.withValues(alpha: 0.25),
                  offset: Offset(0, context.heightPct(0.004)),
                  blurRadius: context.widthPct(0.004),
                ),
              ],
            ),
          ),

          SizedBox(height: context.heightPct(0.004)),

          Container(
            width: double.infinity,
            padding: context.responsivePadding(
              horizontal: 0.012,
              vertical: 0.005,
            ),
            decoration: BoxDecoration(
              color: ZiColors.white.withValues(alpha: 0.85),
              borderRadius: BorderRadius.circular(context.widthPct(0.04)),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.arrow_forward,
                  size: context.scaledFont(15),
                  color: arrowColor,
                ),

                SizedBox(width: context.widthPct(0.008)),

                Expanded(
                  child: Text(
                    subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: ZiTypoStyles.overMini.copyWith(
                      color: AppColors.secondaryText,
                    ),
                  ),
                ),

                Icon(
                  Icons.arrow_back,
                  size: context.scaledFont(15),
                  color: arrowColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _rewardCard(
    BuildContext context, {
    required String image,
    required String title,
  }) {
    return Container(
      height: context.heightPct(0.105),
      decoration: BoxDecoration(
        gradient: AppColors.greenGradient,
        borderRadius: BorderRadius.circular(context.widthPct(0.035)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: context.widthPct(0.18),
            height: context.heightPct(0.065),
            fit: BoxFit.contain,
          ),

          Text(
            title,
            style: ZiTypoStyles.caption.copyWith(color: AppColors.darkText),
          ),
        ],
      ),
    );
  }
}
