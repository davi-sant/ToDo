import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    required this.hinText,
    required this.controller,
    required this.press,
  }) : super(key: key);

  final VoidCallback press;

  final String hinText;
  final dynamic controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 59, 59, 59)),
          borderRadius: const BorderRadius.all(
            Radius.circular(12.0),
          ),
          color: const Color.fromARGB(201, 30, 30, 30),
        ),
        height: 55,
        child: Row(
          children: [
            Expanded(
              child: TextField(
                style: const TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.none,
                  decorationStyle: TextDecorationStyle.solid,
                ),
                autocorrect: true,
                autofocus: true,
                controller: controller,
                decoration: InputDecoration(
                  labelStyle: const TextStyle(color: Colors.blue),
                  hintText: hinText,
                  hintStyle:
                      const TextStyle(color: Colors.blue, fontSize: 12.0),
                  enabledBorder: InputBorder.none,
                  suffixIcon: Container(
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Colors.grey),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: IconButton(
                      onPressed: press,
                      icon: const Icon(
                        Icons.bookmark_add,
                        color: Colors.blue,
                        size: 20.0,
                      ),
                    ),
                  ),
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
