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

Future fetchData () async {

  final uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');

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
      body: Column(children: [
     Text("Hello"),
  
      ],),
    );
  }
}
