import 'package:flutter/material.dart';
import '../widgets/chat_page_widget.dart';
import '../widgets/side_bar.dart';

class DesktopPage extends StatelessWidget {
  const DesktopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: const [
          SideBar(),
          ChatPageWidget(),
        ],
      ),
    );
  }
}