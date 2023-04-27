import 'package:flutter/material.dart';

class UserListWidget extends StatelessWidget {
  const UserListWidget({
    super.key,
    required this.itemCount,
    required this.isMobile,
  });

  final int itemCount;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 40),
      itemCount: itemCount,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: isMobile ? 35 : 30,
                    child: const Icon(Icons.person, size: 30),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, bottom: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Lightner ${index + 1}",
                          style: TextStyle(
                            fontSize: isMobile ? 20 : 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Lorem Ipsum is simply...",
                          style: TextStyle(
                            fontSize: isMobile ? 15 : 13,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (index == 0 || index == 2 || index == 7)
                Padding(
                  padding: const EdgeInsets.only(right: 25, bottom: 20),
                  child: CircleAvatar(
                    backgroundColor: isMobile ? Colors.yellow : Colors.blueAccent,
                    radius: 12,
                    child: Text(
                      index == 0 || index == 7 ? "1" : "3",
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                )
              else
                Container()
            ],
          ),
        );
      },
    );
  }
}