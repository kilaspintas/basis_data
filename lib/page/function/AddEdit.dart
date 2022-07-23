import 'dart:convert';
import 'package:basis_data/page/function/addEditInfo.dart';
import 'package:basis_data/page/function/listModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';


class AddEditWidget extends StatelessWidget {
  final String title;
  final String? id;
  final UpdateModel? username;
  final String? apiUrl;
  final UpdateModel? keluhan;
  const AddEditWidget({
    Key? key,
    required this.title,
    this.apiUrl,
    this.id,
    this.username,
    this.keluhan

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    TextEditingController _keluhan = TextEditingController();
    if(keluhan !=null){
      _keluhan.text = keluhan!.keluhan;
    }

    return AlertDialog(
      title: Text(title),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _keluhan,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  labelText: "Keluhan",
                  hintText: "Masukkan Keluhan"
              ),
            )
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: const Text("Batal"),
        ),
        TextButton(
          onPressed: () {
            if(_keluhan.text.isEmpty){
              showDialog(
                context: context,
                builder: (context){
                  return const InfoWarning(
                    title: "Error!",
                    content: "Masukkan keluhan",
                  );
                },
              );
            }else {
              //edit
              if(id != null && apiUrl != null){
                String? inputUsername = user.email;
                String inputEmail = _keluhan.text;
                String? idnya = id;
                String? api = apiUrl;
                String url = '$api$idnya?username=$inputUsername&keluhan=$inputEmail';
                print(url);
                Future _fetchDataUsers() async{
                  var hasil = await http.post(Uri.parse(url));
                  return json.decode(hasil.body)['message'];
                }
                _fetchDataUsers();

              }else {
                //add data
                String? inputUsername = user.email;
                String inputEmail = _keluhan.text;
                String url = '$apiUrl?username=$inputUsername&keluhan=$inputEmail';
                Future _fetchDataUsers() async{
                  var hasil = await http.post(Uri.parse(url));
                  return json.decode(hasil.body)['message'];
                }
                _fetchDataUsers();

              }
              Navigator.pop(context);
            }
          },
          child: const Text("Simpan"),
        ),
      ],
    );
  }
}

