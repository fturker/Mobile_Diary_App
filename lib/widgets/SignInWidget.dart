// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gunluk/constants/UIDesign.dart';
import 'package:gunluk/pages/AccountPage.dart';

class SignInWidget extends StatelessWidget {
  SignInWidget({super.key});

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _password2 = TextEditingController();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 25.w,right: 25.w,bottom: 10.h),
          child: TextField(
            controller: _email,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              hintText: "E-mail giriniz",
              hintStyle: TextStyle(
                color: Colors.white
              ),
            ),
            style: const TextStyle(
              color: Colors.white
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 25.w,right: 25.w,bottom: 10.h),
          child: TextField(
            controller: _password,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              hintText: "Şifre giriniz",
              hintStyle: TextStyle(
                  color: Colors.white
              ),
            ),
            style: const TextStyle(
                color: Colors.white
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 25.w,right: 25.w),
          child: TextField(
            controller: _password2,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              hintText: "Şifrenizi tekrar giriniz",
              hintStyle: TextStyle(
                  color: Colors.white
              ),
            ),
            style: const TextStyle(
                color: Colors.white
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 15.h),
          child: ElevatedButton(
              onPressed: () async {
                if(_password.text == _password2.text){
                  try{
                    await _auth.createUserWithEmailAndPassword(
                        email: _email.text,
                        password: _password.text);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) => AccountPage()));

                  }
                  on FirebaseAuthException catch(e){
                    debugPrint(e.message);
                    showDialog(context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Text(e.message!),
                            actions: [
                              TextButton(onPressed: () {
                                Navigator.of(context).pop();
                              }, child: Text("Tamam"))
                            ],
                          );
                        }
                    );
                  }
                }
                else{
                  debugPrint("parolalar farklı");
                }
              },
              child: const Text("Kayıt Ol"),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(150.w, 30.h),
                backgroundColor: UIDesign.getBottomNavigationBarColor("darkTheme"),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16))
                )
              )
          )
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: TextButton(
            onPressed: () {
              MaterialPageRoute(builder: (BuildContext context) => AccountPage());
            },
            child: const Text("Hesabınız var mı? Giriş yapın."),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white
            )
          ),
        )
      ],
    );
  }
}
