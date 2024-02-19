import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gunluk/widgets/LogInWidget.dart';
import 'package:gunluk/widgets/SignInWidget.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
User? user = auth.currentUser;

class AccountPage extends StatelessWidget {
  AccountPage({Key? key}) : super(key: key);

  bool login = false;

  @override
  Widget build(BuildContext context) {
    if(user != null){
      return const Center(
        child: Text("AccountPage"),
      );
    }

    else{
      return SignInWidget();
    }
  }
}
