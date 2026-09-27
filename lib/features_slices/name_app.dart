import 'package:flutter/material.dart';
import 'package:lgm/features_slices/Home/ludo_home_screen.dart';
import 'package:zi_core/zi_core_io.dart';
import '../app_shell/app_shell_io.dart';

class NameAppView extends StatefulWidget {
  const NameAppView({super.key});

  @override
  State<NameAppView> createState() => _NameAppViewState();
}

class _NameAppViewState extends State<NameAppView> {
  int pageIndex = 0;
  List mainPavesView = [
    // home bottom screens
    // GlobalWidgets(),
    LudoHomeScreen(),
    MenuView(), 
    ];
  List<TabItem> mainPages = [
    // TabItem(icon: Icons.dashboard_rounded, title: 'Menu'),
    TabItem(icon: Icons.home, title: 'Home'),
    TabItem(icon: Icons.menu, title: 'Menu'),
  ];

  @override
  Widget build(BuildContext context) {
    return ZiScaffoldB(
      showPagePadding: false,
      body: mainPavesView[pageIndex],
      bottomNavigationBar: ZiBottomBar(
        items: mainPages,
        currentIndex: pageIndex,
        onTap: (i) => setState(() => pageIndex = i),
        type: ZiBottomBarType.fancy,
        style: ZiBottomBarStyle(
          backgroundColor: ZiColors.white,
          color: ZiColors.textMuted,
          colorSelected: ZiColors.primary,
        ),
      ),
    );
  }
}
