import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

String url = "https://jsonplaceholder.typicode.com/todos/3";

Dio dio = Dio();

dynamic getHttp() async {
  var response = await dio.get(url);
  print(response); //! The Type is Response and with Json Format
  print(response.data); // ! The Type is Map and With Simple Map Format
  return response.data;
}

void main() {
  getHttp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  dynamic result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: result == null
            ? CircularProgressIndicator()
            : ListTile(
                title: Text(result['title']),
                subtitle: Text(result['completed'].toString()),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          result = await getHttp();
          setState(() {});
        },
      ),
    );
  }
}
