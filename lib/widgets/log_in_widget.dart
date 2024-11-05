import 'package:flutter/material.dart';

class LogInWidget extends StatelessWidget {
  const LogInWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            hintText: "E-mail giriniz",
            hintStyle: TextStyle(
                color: Colors.white
            ),
          ),
          style: TextStyle(
              color: Colors.white
            ),
        ),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            hintText: "Şifre Giriniz",
            hintStyle: TextStyle(
                color: Colors.white
            ),
          ),
          style: TextStyle(
              color: Colors.white
          ),
        )
      ],
    );
  }
}
