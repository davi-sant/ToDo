import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      alignment: Alignment.bottomRight,
      height: 100,
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: Column(
        children: [
          Row(
            children: [
              TextButton(
                onPressed: () {},
                child: const Icon(
                  Icons.arrow_back_ios,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
