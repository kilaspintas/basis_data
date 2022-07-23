import 'package:basis_data/page/login.dart';
import 'package:basis_data/page/menu_utama.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Navigasi extends StatelessWidget {
  const Navigasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          } else if(snapshot.hasData) {
            return PageUtama();
          } else if(snapshot.hasError){
            return Center(child: Text("Jang jang error"));
          }else {
            return PageLogin();
          }

        },
      ),
    );
  }
}
