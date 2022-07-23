import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'function/AddEdit.dart';


class HomeMenemukan extends StatefulWidget {
  const HomeMenemukan({Key? key}) : super(key: key);

  @override
  State<HomeMenemukan> createState() => _HomeMenemukan();

}

class _HomeMenemukan extends State<HomeMenemukan> {
  @override
  Widget build(BuildContext context) {
    const String apiUrl = 'http://10.0.2.2:8000/api/menemukan';
    const String editUrl = 'http://10.0.2.2:8000/api/menemukan/update/';
    const String createUrl = 'http://10.0.2.2:8000/api/menemukan/create';

    Future<List<dynamic>> _fetchDataUsers() async{
      var hasil = await http.get(Uri.parse(apiUrl));
      return json.decode(hasil.body)['data'];
    }


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        title: const Text(
            'Menemukan'
        ),
      ),
      body: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Positioned(
              child: Container(
                color: Colors.redAccent,
              )
          ),

          const Positioned(
              top: 50,
              left: 40,
              bottom: 0,
              right: 0,
              child: Text('Daftar Temuan',
                style: TextStyle(
                  fontFamily: 'GilroyBold',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),

              )
          ),

          Positioned(

              top: 120,
              left: 25,
              right: 25,
              bottom: 0,

              child: Scaffold(
                backgroundColor: Colors.transparent,
                body : FutureBuilder<List<dynamic>>(
                  future: _fetchDataUsers(),
                  builder: (BuildContext context, AsyncSnapshot snapshot){
                    if (snapshot.hasData){
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext contect, int index){
                          return Dismissible(
                            key: Key(snapshot.data[index]['id'].toString()),
                            background: Container(
                              color: Colors.grey,
                              child: const Center(
                                child: Text(
                                  "Hapus Data",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            child: Card(
                              child: Column(
                                children: [
                                  ListTile(
                                    title:  Text(snapshot.data[index]['keluhan'],
                                      style: const TextStyle(
                                        fontFamily: 'Gilroy',
                                        fontSize: 18,
                                      ),),
                                    onTap: (){

                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AddEditWidget(
                                              title: "Edit Data",
                                              apiUrl: editUrl,
                                              id : snapshot.data[index]['id'].toString(),
                                            );
                                          });
                                    },
                                  )
                                ],
                              ),
                            ),
                            onDismissed: (direction){
                              String idnya = snapshot.data[index]['id'].toString();
                              String url = 'http://10.0.2.2:8000/api/ketertiban/delete/$idnya';
                              Future _fetchDataUsers() async{
                                var hasil = await http.get(Uri.parse(url));
                                return json.decode(hasil.body)['message'];
                              }
                              _fetchDataUsers();

                            },
                          );
                        },
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
                floatingActionButton: FloatingActionButton(
                  backgroundColor: Colors.red,
                  onPressed: (){
                    showDialog(
                        context: context,
                        builder: (context){
                          return const AddEditWidget(title: "Tambah Keluhan", apiUrl: createUrl);
                        });
                  },
                  child: const Icon(Icons.add),
                ),
              )
          ),
        ],
      ),
    );
  }
}
