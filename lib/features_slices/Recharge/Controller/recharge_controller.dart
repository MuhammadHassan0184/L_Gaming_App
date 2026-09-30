import 'package:get/get.dart';

import '../Models/recharge_models.dart';

class RechargeController extends GetxController {
  // ================================================================
  // TOP TABS
  // ================================================================

  final List<String> topTabs = const ['Golds', 'Game Coins', 'Crystals'];

  final RxInt selectedTopTab = 0.obs;

  // ================================================================
  // BALANCE
  // ================================================================

  final RxInt balance = 5230.obs;

  // ================================================================
  // RECHARGE PACKAGES
  // ================================================================

  final List<RechargePackage> packages = const [
    RechargePackage(coins: 30, bdt: 40, popular: true),
    RechargePackage(coins: 100, bdt: 150),
    RechargePackage(coins: 1000, bdt: 1300),
    RechargePackage(coins: 5000, bdt: 6200),
    RechargePackage(coins: 12000, bdt: 14000),
    RechargePackage(coins: 36500, bdt: 42000),
  ];

  final RxInt selectedPackage = 0.obs;

  // ================================================================
  // FIRST RECHARGE BENEFITS
  // ================================================================

  final List<RechargeBenefit> benefits = const [
    RechargeBenefit(image: 'assets/treasure-chest.png', quantity: 'X8'),
    RechargeBenefit(image: 'assets/treasure-chest.png', quantity: 'X10'),
    RechargeBenefit(image: 'assets/treasure-chest.png', quantity: 'X1'),
    RechargeBenefit(image: 'assets/treasure-chest.png', quantity: 'X1'),
  ];

  // ================================================================
  // ACTIONS
  // ================================================================

  void changeTopTab(int index) {
    if (selectedTopTab.value == index) {
      return;
    }

    selectedTopTab.value = index;
  }

  void selectPackage(int index) {
    selectedPackage.value = index;
  }

  RechargePackage get selectedRechargePackage {
    return packages[selectedPackage.value];
  }

  // ================================================================
  // RESET
  // ================================================================

  void resetSelection() {
    selectedPackage.value = 0;
  }
}
