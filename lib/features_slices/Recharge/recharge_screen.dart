import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lgm/Config/app_colors.dart';
import 'package:lgm/features_slices/Recharge/Controller/recharge_controller.dart';
import 'package:lgm/features_slices/Recharge/Widgets/recharge_widgets.dart';

class RechargeScreen extends StatelessWidget {
  const RechargeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RechargeController controller = Get.put(
      RechargeController(),
      permanent: false,
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: AppColors.rechargeBackground,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: AppColors.rechargeBackground,
        body: Column(
          children: [
            // ======================================================
            // HEADER
            // ======================================================
            RechargeWidgets.header(context, controller),

            // ======================================================
            // CONTENT
            // ======================================================
            Expanded(child: RechargeWidgets.body(context, controller)),
          ],
        ),
      ),
    );
  }
}
