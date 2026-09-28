import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lgm/Config/app_colors.dart';
import 'package:lgm/features_slices/Country_Select/Controller/country_controller.dart';
import 'package:lgm/features_slices/Country_Select/Widgets/country_widgets.dart';

class CountryScreen extends StatelessWidget {
  const CountryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CountryController(), permanent: false);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: AppColors.countryBackground,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: AppColors.countryBackground,

        body: CustomScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: [
            // ======================================================
            // BEAUTIFUL ANIMATED APP BAR
            // ======================================================
            CountryWidgets.animatedAppBar(context, controller),

            CountryWidgets.categoryBar(context, controller),

            // ======================================================
            // COUNTRIES
            // ======================================================
            CountryWidgets.countryGrid(context, controller),
          ],
        ),
      ),
    );
  }
}
