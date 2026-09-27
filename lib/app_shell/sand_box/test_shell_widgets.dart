import 'package:flutter/material.dart';
import 'package:zi_core/zi_core_io.dart';

class TestShellWidgetsView extends StatelessWidget {
  const TestShellWidgetsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ZiScaffoldB(
      safeArea: true,
      appBar: ZiAppBarB(title: "Test Shell Widgets"),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text("Test Shell Widgets"), ziGap(16), Divider()],
        ),
      ),
    );
  }
}
