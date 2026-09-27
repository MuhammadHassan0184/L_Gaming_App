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
        child: Column(
          children: [
            // ==================================================
            // TOP HEADER
            // ==================================================
            LudoHomeWidgets.topHeader(context),

            // ==================================================
            // MAIN CONTENT
            // ==================================================
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.ludoBackground,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(context.widthPct(0.08)),
                    topRight: Radius.circular(context.widthPct(0.08)),
                  ),
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: context.responsivePadding(
                      horizontal: 0.045,
                      vertical: 0.012,
                    ),
                    child: Column(
                      children: [
                        // ==================================================
                        // CALENDAR
                        // ==================================================
                        LudoHomeWidgets.calendarButton(context),

                        SizedBox(height: context.heightPct(0.002)),

                        // ==================================================
                        // LUDO LOGO
                        // ==================================================
                        LudoHomeWidgets.logo(context),

                        SizedBox(height: context.heightPct(0.008)),

                        // ==================================================
                        // GAME CARDS
                        // ==================================================
                        LudoHomeWidgets.gameCards(context),

                        SizedBox(height: context.heightPct(0.018)),

                        // ==================================================
                        // START BUTTON
                        // ==================================================
                        LudoHomeWidgets.startButton(
                          context,
                          onTap: () {
                            // Start game
                          },
                        ),

                        SizedBox(height: context.heightPct(0.024)),

                        // ==================================================
                        // REWARD CARDS
                        // ==================================================
                        LudoHomeWidgets.rewardCards(context),

                        SizedBox(height: context.heightPct(0.015)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
