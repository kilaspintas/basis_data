import 'package:basis_data/Firebase/auth.dart';
import 'package:basis_data/Firebase/googleSetup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class PageLogin extends StatefulWidget {
  const PageLogin({Key? key}) : super(key: key);

  @override
  State<PageLogin> createState() => _PageLogin();
}

class _PageLogin extends State<PageLogin> {

  AuthService otentikasi = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        title: Text(
          'Buat Akun',
          style: TextStyle(
            //fontFamily: 'Gilroy',
            fontSize: 20,
            color: Colors.white70,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height+225,
          width: MediaQuery.of(context).size.width,
          color: Colors.redAccent,
          child: Column(
            children: [
              SizedBox(height: 20,),
              Row(
                children: [
                  SizedBox(width: 20,),
                  Text(
                    'Masuk',
                    style: TextStyle(
                      //fontFamily: 'Gilroy',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  SizedBox(width: 20),
                  Text(
                    'Login ke aplikasi lapor kamu yuk',
                    style: TextStyle(
                      //fontFamily: 'Gilroy',
                      fontSize: 18,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 0.0),
                child: Container(
                  height: 250,
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage('assets/HEADERLOGIN.png'),
                        width: MediaQuery.of(context).size.width -10,
                        height: MediaQuery.of(context).size.height -40,
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Login dengan',
                    style: TextStyle(
                      //fontFamily: 'Gilroy',
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  GestureDetector(
                    onTap: () async {
                      final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                      provider.googleLogin();
                    },
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/google.png'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 100,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Tidak punya akun ?',
                    style: TextStyle(
                      //fontFamily: 'Gilroy',
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Daftar',
                    style: TextStyle(
                      //fontFamily: 'Gilroy',
                      fontSize: 16,
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

