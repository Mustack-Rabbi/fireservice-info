import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> posts = [];

  Future fetchData() async {
    final uri = Uri.parse('https://jsonplaceholder.typicode.com/users');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      print("success");

      final jsonData = jsonDecode(response.body);

      print(jsonData.runtimeType);

      posts = jsonData;
    } else {
      print("faild");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Fire Service info App"),
          backgroundColor: Colors.amber,
        ),
        body: ListView.builder(itemBuilder: (_, index) {

          
          return Card(
              child: ListTile(
            leading: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiF-sXRSssOuevImVUVcp8fQMEox6Rd_yzlD6c7E7g3Rw1aZz_2CAh9pr0b1Qm1pybarM&usqp=CAU'),
            title: Text(posts[index]["name"].toString()),
            subtitle: Text(posts[index]["email"].toString()),
          ));
        }));
  }
}
