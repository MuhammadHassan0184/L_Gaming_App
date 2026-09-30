class RechargePackage {
  final int coins;
  final double bdt;
  final bool popular;

  const RechargePackage({
    required this.coins,
    required this.bdt,
    this.popular = false,
  });
}

class RechargeBenefit {
  final String image;
  final String quantity;

  const RechargeBenefit({required this.image, required this.quantity});
}
