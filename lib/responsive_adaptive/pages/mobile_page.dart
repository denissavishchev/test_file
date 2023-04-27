import 'package:flutter/material.dart';
import '../widgets/bottom_navigation_bar_widget.dart';
import '../widgets/mobile_chats_page_body_widget.dart';

class MobilePage extends StatelessWidget {
  const MobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigationBarWidget(),
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 1,
        title: const Text(
          'Chats',
          style: TextStyle(
            fontSize: 27,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: IconButton(
              icon: const Icon(
                Icons.search,
                size: 40,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: const MobileChatsPageBody(),
    );
  }
}