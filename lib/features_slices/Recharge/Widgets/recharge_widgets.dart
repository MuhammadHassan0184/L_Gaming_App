import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lgm/Config/app_colors.dart';
import 'package:lgm/Utils/mediaquery_extension.dart';
import 'package:zi_core/zi_core_io.dart';

import '../Controller/recharge_controller.dart';
import '../Models/recharge_models.dart';

class RechargeWidgets {
  RechargeWidgets._();

  // ============================================================
  // COMPLETE BODY
  // ============================================================

  static Widget body(BuildContext context, RechargeController controller) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: context.responsivePadding(horizontal: 0.035, vertical: 0.012),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            balanceSection(context, controller),

            SizedBox(height: context.heightPct(0.012)),

            benefitsBanner(context),

            SizedBox(height: context.heightPct(0.014)),

            spendingInfo(context),

            SizedBox(height: context.heightPct(0.018)),

            rechargeTitle(context),

            SizedBox(height: context.heightPct(0.012)),

            firstRechargeSection(context, controller),

            SizedBox(height: context.heightPct(0.014)),

            packagesGrid(context, controller),

            SizedBox(height: context.heightPct(0.018)),

            totalSection(context, controller),

            SizedBox(height: context.heightPct(0.010)),

            rechargeButton(context, controller),

            SizedBox(height: context.heightPct(0.015)),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // HEADER
  // ============================================================

  static Widget header(BuildContext context, RechargeController controller) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: AppColors.rechargeHeaderGradient,
      ),
      child: Padding(
        padding: context.responsivePadding(horizontal: 0.035, vertical: 0.010),
        child: Column(
          children: [
            SizedBox(height: context.topPadding),

            SizedBox(
              height: context.heightPct(0.052),
              child: Row(
                children: [
                  backButton(context),

                  SizedBox(width: context.widthPct(0.025)),

                  Expanded(child: topTabs(context, controller)),

                  SizedBox(width: context.widthPct(0.020)),

                  botButton(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // BACK BUTTON
  // ============================================================

  static Widget backButton(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: Get.back,
      child: Container(
        width: context.widthPct(0.090),
        height: context.widthPct(0.090),
        decoration: BoxDecoration(
          color: AppColors.white.withValues(alpha: 0.92),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.darkText.withValues(alpha: 0.06),
              blurRadius: context.widthPct(0.018),
              offset: Offset(0, context.heightPct(0.002)),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          size: context.scaledFont(16),
          color: AppColors.darkText,
        ),
      ),
    );
  }

  // ============================================================
  // TOP TABS
  // ============================================================

  static Widget topTabs(BuildContext context, RechargeController controller) {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(controller.topTabs.length, (index) {
          final bool selected = controller.selectedTopTab.value == index;

          return Expanded(
            child: Center(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  controller.changeTopTab(index);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 220),
                  curve: Curves.easeOutCubic,
                  padding: context.responsivePadding(
                    horizontal: 0.008,
                    vertical: 0.006,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: selected
                            ? ZiColors.textDark
                            : Colors.transparent,
                        width: context.heightPct(0.0015),
                      ),
                    ),
                  ),
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 220),
                    style: ZiTypoStyles.bodySm.copyWith(
                      color: selected
                          ? AppColors.darkText
                          : AppColors.secondaryText,
                      fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                    ),
                    child: Text(
                      controller.topTabs[index],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      );
    });
  }

  // ============================================================
  // BOT BUTTON
  // ============================================================

  static Widget botButton(BuildContext context) {
    return Container(
      width: context.widthPct(0.090),
      height: context.widthPct(0.090),
      decoration: BoxDecoration(
        color: AppColors.rechargeBotBackground,
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.white.withValues(alpha: 0.80),
          width: context.widthPct(0.002),
        ),
      ),
      alignment: Alignment.center,
      child: Icon(
        Icons.smart_toy_rounded,
        size: context.scaledFont(20),
        color: ZiColors.primary,
      ),
    );
  }

  // ============================================================
  // BALANCE
  // ============================================================

  static Widget balanceSection(
    BuildContext context,
    RechargeController controller,
  ) {
    return Row(
      children: [
        coinIcon(context, size: 0.060),

        SizedBox(width: context.widthPct(0.012)),

        Obx(() {
          return Text(
            _formatNumber(controller.balance.value),
            style: ZiTypoStyles.titleMd.copyWith(
              color: AppColors.darkText,
              fontWeight: FontWeight.w700,
            ),
          );
        }),

        const Spacer(),

        Text(
          'Details',
          style: ZiTypoStyles.caption.copyWith(color: AppColors.secondaryText),
        ),

        SizedBox(width: context.widthPct(0.008)),

        Icon(
          Icons.chevron_right_rounded,
          size: context.scaledFont(18),
          color: AppColors.secondaryText,
        ),
      ],
    );
  }

  // ============================================================
  // COIN ICON
  // ============================================================

  static Widget coinIcon(BuildContext context, {double size = 0.045}) {
    return Container(
      width: context.widthPct(size),
      height: context.widthPct(size),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.coinYellow,
      ),
      alignment: Alignment.center,
      child: Text(
        '\$',
        style: ZiTypoStyles.caption.copyWith(
          color: AppColors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  // ============================================================
  // BENEFITS BANNER
  // ============================================================

  static Widget benefitsBanner(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.heightPct(0.132),
      padding: context.responsivePadding(horizontal: 0.030, vertical: 0.014),
      decoration: BoxDecoration(
        gradient: AppColors.rechargeBenefitsGradient,
        borderRadius: BorderRadius.circular(context.widthPct(0.032)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Limited-time',
                style: ZiTypoStyles.bodyMd.copyWith(
                  color: AppColors.darkText,
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(height: context.heightPct(0.002)),

              Text(
                'Recharge Benefits',
                style: ZiTypoStyles.titleMd.copyWith(
                  color: AppColors.darkText,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const Spacer(),

              Container(
                padding: context.responsivePadding(
                  horizontal: 0.018,
                  vertical: 0.005,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white.withValues(alpha: 0.72),
                  borderRadius: BorderRadius.circular(context.widthPct(0.030)),
                ),
                child: Text(
                  '18/5/2026–31/5/2026(GMT+2)',
                  style: ZiTypoStyles.caption.copyWith(
                    color: AppColors.darkText,
                  ),
                ),
              ),
            ],
          ),

          Positioned(
            right: context.widthPct(0.005),
            top: -context.heightPct(0.012),
            bottom: -context.heightPct(0.010),
            child: Image.asset(
              'assets/Opened_Box.png',
              fit: BoxFit.contain,
              width: context.widthPct(0.235),
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  Icons.card_giftcard_rounded,
                  size: context.widthPct(0.18),
                  color: AppColors.gold,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // SPENDING INFO
  // ============================================================

  static Widget spendingInfo(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: context.responsivePadding(horizontal: 0.025, vertical: 0.011),
      decoration: BoxDecoration(
        gradient: AppColors.rechargeBenefitsGradient,
        borderRadius: BorderRadius.circular(context.widthPct(0.028)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Spend BDT 1,700.00 and get \$ 2,000',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: ZiTypoStyles.caption.copyWith(
                color: AppColors.secondaryText,
              ),
            ),
          ),

          Text(
            'View',
            style: ZiTypoStyles.caption.copyWith(
              color: AppColors.secondaryText,
            ),
          ),

          SizedBox(width: context.widthPct(0.012)),

          Icon(
            Icons.keyboard_arrow_down_rounded,
            size: context.scaledFont(18),
            color: AppColors.secondaryText,
          ),
        ],
      ),
    );
  }

  // ============================================================
  // RECHARGE TITLE
  // ============================================================

  static Widget rechargeTitle(BuildContext context) {
    return Text(
      'Recharge',
      style: ZiTypoStyles.titleMd.copyWith(
        color: AppColors.darkText,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  // ============================================================
  // FIRST RECHARGE
  // ============================================================

  static Widget firstRechargeSection(
    BuildContext context,
    RechargeController controller,
  ) {
    return Container(
      width: double.infinity,
      padding: context.responsivePadding(horizontal: 0.025, vertical: 0.010),
      decoration: BoxDecoration(
        color: AppColors.rechargeFirstBackground,
        borderRadius: BorderRadius.circular(context.widthPct(0.030)),
      ),
      child: Row(
        children: [
          // ======================================================
          // TITLE
          // ======================================================
          Expanded(
            flex: 4,
            child: Text(
              'First Recharge',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: ZiTypoStyles.caption.copyWith(color: AppColors.darkText),
            ),
          ),

          SizedBox(width: context.widthPct(0.010)),

          // ======================================================
          // REWARDS
          // ======================================================
          Expanded(
            flex: 8,
            child: Row(
              children: [
                for (final benefit in controller.benefits.take(4))
                  Expanded(child: benefitItem(context, benefit)),
              ],
            ),
          ),

          SizedBox(width: context.widthPct(0.008)),

          // ======================================================
          // ARROW
          // ======================================================
          Icon(
            Icons.chevron_right_rounded,
            size: context.scaledFont(19),
            color: AppColors.secondaryText,
          ),
        ],
      ),
    );
  }

  // ============================================================
  // BENEFIT ITEM
  // ============================================================

  static Widget benefitItem(BuildContext context, RechargeBenefit benefit) {
    return SizedBox(
      height: context.heightPct(0.075),
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          // ======================================================
          // REWARD IMAGE
          // ======================================================
          Image.asset(
            benefit.image,
            width: context.widthPct(0.062),
            height: context.widthPct(0.062),
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Icon(
                Icons.card_giftcard_rounded,
                size: context.scaledFont(26),
                color: AppColors.gold,
              );
            },
          ),

          // ======================================================
          // QUANTITY BADGE
          // ======================================================
          Positioned(
            bottom: context.heightPct(0.006),
            child: Container(
              padding: context.responsivePadding(
                horizontal: 0.009,
                vertical: 0.0015,
              ),
              decoration: BoxDecoration(
                color: AppColors.rechargeBadge,
                borderRadius: BorderRadius.circular(context.widthPct(0.012)),
              ),
              child: Text(
                benefit.quantity,
                maxLines: 1,
                style: TextStyle(
                  fontSize: context.scaledFont(7),
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // PACKAGES GRID
  // ============================================================

  static Widget packagesGrid(
    BuildContext context,
    RechargeController controller,
  ) {
    return Obx(() {
      final int selected = controller.selectedPackage.value;

      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.packages.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: context.widthPct(0.022),
          mainAxisSpacing: context.heightPct(0.012),
          childAspectRatio: 1.15,
        ),
        itemBuilder: (context, index) {
          return packageCard(
            context,
            controller.packages[index],
            selected == index,
            () {
              controller.selectPackage(index);
            },
          );
        },
      );
    });
  }

  // ============================================================
  // PACKAGE CARD
  // ============================================================

  static Widget packageCard(
    BuildContext context,
    RechargePackage package,
    bool selected,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,
        padding: context.responsivePadding(horizontal: 0.010, vertical: 0.009),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(context.widthPct(0.027)),
          border: Border.all(
            color: selected ? ZiColors.primary : Colors.transparent,
            width: context.widthPct(0.002),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.darkText.withValues(
                alpha: selected ? 0.10 : 0.06,
              ),
              blurRadius: context.widthPct(0.015),
              offset: Offset(0, context.heightPct(0.002)),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                coinIcon(context, size: 0.040),

                SizedBox(width: context.widthPct(0.008)),

                Flexible(
                  child: Text(
                    _formatNumber(package.coins),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: ZiTypoStyles.bodyMd.copyWith(
                      color: AppColors.darkText,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: context.heightPct(0.007)),

            Text(
              'BDT ${_formatMoney(package.bdt)}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: ZiTypoStyles.caption.copyWith(
                color: AppColors.secondaryText,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // TOTAL
  // ============================================================

  static Widget totalSection(
    BuildContext context,
    RechargeController controller,
  ) {
    return Row(
      children: [
        Text(
          'Total',
          style: ZiTypoStyles.bodyMd.copyWith(color: AppColors.darkText),
        ),

        SizedBox(width: context.widthPct(0.008)),

        coinIcon(context, size: 0.042),

        SizedBox(width: context.widthPct(0.008)),

        Obx(() {
          return Text(
            _formatNumber(controller.selectedRechargePackage.coins),
            style: ZiTypoStyles.bodyMd.copyWith(
              color: AppColors.darkText,
              fontWeight: FontWeight.w500,
            ),
          );
        }),

        const Spacer(),

        Text(
          'Details',
          style: ZiTypoStyles.caption.copyWith(color: AppColors.secondaryText),
        ),

        SizedBox(width: context.widthPct(0.010)),

        Icon(
          Icons.keyboard_arrow_up_rounded,
          size: context.scaledFont(18),
          color: AppColors.secondaryText,
        ),
      ],
    );
  }

  // ============================================================
  // RECHARGE BUTTON
  // ============================================================

  static Widget rechargeButton(
    BuildContext context,
    RechargeController controller,
  ) {
    return Obx(() {
      final RechargePackage package = controller.selectedRechargePackage;

      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Get.snackbar(
            'Recharge',
            'Recharge of BDT '
                '${_formatMoney(package.bdt)} selected',
            snackPosition: SnackPosition.BOTTOM,
            margin: context.responsiveAll(0.030),
          );
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          width: double.infinity,
          height: context.heightPct(0.058),
          decoration: BoxDecoration(
            gradient: AppColors.rechargeButtonGradient,
            borderRadius: BorderRadius.circular(context.widthPct(0.030)),
            boxShadow: [
              BoxShadow(
                color: AppColors.darkText.withValues(alpha: 0.06),
                blurRadius: context.widthPct(0.015),
                offset: Offset(0, context.heightPct(0.003)),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  'Recharge BDT '
                  '${_formatMoney(package.bdt)} now',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: ZiTypoStyles.bodyMd.copyWith(
                    color: AppColors.darkText,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              SizedBox(width: context.widthPct(0.018)),

              Container(
                width: context.widthPct(0.055),
                height: context.widthPct(0.055),
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.arrow_forward_rounded,
                  size: context.scaledFont(18),
                  color: AppColors.darkText,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  // ============================================================
  // NUMBER FORMATTING
  // ============================================================

  static String _formatNumber(int value) {
    final String text = value.toString();
    final StringBuffer buffer = StringBuffer();

    for (int i = 0; i < text.length; i++) {
      if (i > 0 && (text.length - i) % 3 == 0) {
        buffer.write(',');
      }

      buffer.write(text[i]);
    }

    return buffer.toString();
  }

  static String _formatMoney(double value) {
    if (value == value.roundToDouble()) {
      return value.toInt().toString();
    }

    return value.toStringAsFixed(2);
  }
}
