import 'package:flutter/material.dart';
import 'package:zi_core/zi_core_io.dart';

class TestShellView extends StatelessWidget {
  const TestShellView({super.key});

  @override
  Widget build(BuildContext context) {
    return ZiScaffoldB(
      safeArea: true,
      appBar: ZiAppBarB(title: "Test Shell"),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text("Test Shell"), ziGap(16), Divider()],
        ),
      ),
    );
  }
}
