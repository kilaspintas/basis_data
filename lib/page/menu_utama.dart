import 'package:basis_data/Firebase/googleSetup.dart';
import 'package:basis_data/page/function/session.dart';
import 'package:basis_data/page/menu_kehilangan.dart';
import 'package:basis_data/page/menu_ketertiban.dart';
import 'package:basis_data/page/menu_menemukan.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'menu_kebersihan.dart';

class PageUtama extends StatefulWidget {
  const PageUtama({Key? key}) : super(key: key);

  @override
  State<PageUtama> createState() => _PageUtamaState();
}

class _PageUtamaState extends State<PageUtama> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        title: Text(
            'Lapor!'
        ),
        leading: GestureDetector(
          onTap: (){
            final provider =
            Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.logout();
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const Navigasi()));
          },
          child: Icon(Icons.logout),
        ),
      ),

      body: Container(
        color: Colors.redAccent,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              top: -200,
                child: Image(
                  image: AssetImage("assets/HEADER.png"),
                  height: MediaQuery.of(context).size.height - 50,
                  width: MediaQuery.of(context).size.width - 10,

                ),
            ),
            Positioned(
              top: 20,
                child: Text(
                  "Hai ${user.displayName!}",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                    fontWeight: FontWeight.bold
                  ),
                ),
            ),

            Positioned  (
              top: 200,
                child: Column(
                  children: [
                    Row(
                      children: [
                         GestureDetector(
                           onTap:(){
                             Navigator.push(
                               context,
                               MaterialPageRoute(builder: (context) => const HomeMenemukan()),
                             );
                           },
                          child: Container(
                            height: 170,
                            width: 170,
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(40),
                                ),
                                border: Border.all(
                                  width: 3,
                                  color: Colors.red,
                                  style: BorderStyle.solid,
                                )
                            ),
                            child: Center(
                              child: Text("Menemukan",
                                style: TextStyle(
                                  fontFamily: "Comic",
                                  color: Colors.brown,
                                  fontSize: 24
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const HomeKehilangan()),
                            );
                          },
                          child: Container(
                            height: 170,
                            width: 170,
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(40),
                                  bottomRight: Radius.circular(20),
                                ),
                                border: Border.all(
                                  width: 3,
                                  color: Colors.red,
                                  style: BorderStyle.solid,
                                )
                            ),
                            child: Center(
                              child: Text("Kehilangan",
                                style: TextStyle(
                                    fontFamily: "Comic",
                                    color: Colors.brown,
                                    fontSize: 24
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const HomeKetertiban()),
                            );
                          },
                          child: Container(
                            height: 170,
                            width: 170,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40),
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              border: Border.all(
                                width: 3,
                                color: Colors.red,
                                style: BorderStyle.solid,
                              )
                            ),
                            child: Center(
                              child: Text("Ketertiban",
                                style: TextStyle(
                                    fontFamily: "Comic",
                                    color: Colors.brown,
                                    fontSize: 24
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const HomeKebersihan()),
                            );
                          },
                          child: Container(
                            height: 170,
                            width: 170,
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(40),
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                                border: Border.all(
                                  width: 3,
                                  color: Colors.red,
                                  style: BorderStyle.solid,
                                )
                            ),
                            child: Center(
                              child: Text("Kebersihan",
                                style: TextStyle(
                                    fontFamily: "Comic",
                                    color: Colors.brown,
                                    fontSize: 24
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                ),
          ],

        ),
      ),
    );
  }
}
