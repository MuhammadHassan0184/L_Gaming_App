import 'package:flutter/material.dart';
import 'package:lgm/Config/app_colors.dart';
import 'package:lgm/Utils/mediaquery_extension.dart';
import 'package:lgm/features_slices/Home/Widgets/ludo_home_widgets.dart';

class LudoHomeScreen extends StatelessWidget {
  const LudoHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ludoBackground,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(gradient: AppColors.headerGradient),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                // ==================================================
                // HEADER
                // ==================================================
                LudoHomeWidgets.topHeader(context),

                // ==================================================
                // MAIN CONTENT
                // ==================================================
                Container(
                  width: double.infinity,
                  padding: context.responsivePadding(
                    horizontal: 0.045,
                    vertical: 0.012,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.ludoBackground,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(context.widthPct(0.08)),
                      topRight: Radius.circular(context.widthPct(0.08)),
                    ),
                  ),
                  child: Column(
                    children: [
                      // Calendar
                      LudoHomeWidgets.calendarButton(context),

                      SizedBox(height: context.heightPct(0.002)),

                      // Logo
                      LudoHomeWidgets.logo(context),

                      SizedBox(height: context.heightPct(0.008)),

                      // Game cards
                      LudoHomeWidgets.gameCards(context),

                      SizedBox(height: context.heightPct(0.018)),

                      // Start button
                      LudoHomeWidgets.startButton(
                        context,
                        onTap: () {
                          // Start game
                        },
                      ),

                      SizedBox(height: context.heightPct(0.024)),

                      // Reward cards
                      LudoHomeWidgets.rewardCards(context),

                      SizedBox(height: context.heightPct(0.018)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
