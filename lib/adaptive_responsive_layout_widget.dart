import 'package:flutter/material.dart';
import 'package:test_file/responsive_adaptive/pages/desktop_page.dart';
import 'package:test_file/responsive_adaptive/pages/mobile_page.dart';
import 'package:test_file/responsive_adaptive/responsive_layout.dart';


class ResponsiveLayoutWidget extends StatelessWidget {
  const ResponsiveLayoutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        mobileLayout: MobilePage(),
        desktopLayout: DesktopPage(),
      ),
    );
  }
}
