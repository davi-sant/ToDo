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
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 43, 43, 43)
                  .withOpacity(0.5), //color of shadow
              spreadRadius: 2, //spread radius
              blurRadius: 20, // blur radius
              offset: Offset(0, 2), // changes position of shadow
            ),
            //you can set more BoxShadow() here
          ],
          border: Border.all(color: const Color.fromARGB(255, 38, 38, 38)),
          borderRadius: const BorderRadius.all(
            Radius.circular(12.0),
          ),
          color: Color.fromARGB(200, 21, 21, 21),
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
                  hintStyle: const TextStyle(
                    color: Colors.blue,
                    fontSize: 12.0,
                  ),
                  enabledBorder: InputBorder.none,
                  suffixIcon: Container(
                    width: 70,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(
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
