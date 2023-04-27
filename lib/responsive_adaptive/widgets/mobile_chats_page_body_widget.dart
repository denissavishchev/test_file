import 'package:flutter/material.dart';
import 'package:test_file/responsive_adaptive/widgets/search_field.dart';
import 'package:test_file/responsive_adaptive/widgets/user_list_widget.dart';

class MobileChatsPageBody extends StatelessWidget {
  const MobileChatsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Patients",
              style: TextStyle(
                fontSize: 33,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10),
            SearchField(),
            SizedBox(height: 10),
            UserListWidget(
              itemCount: 5,
              isMobile: true,
            ),
            Text(
              "Colleagues",
              style: TextStyle(
                fontSize: 33,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10),
            UserListWidget(
              itemCount: 5,
              isMobile: true,
            )
          ],
        ),
      ),
    );
  }
}