import 'package:flutter/material.dart';
import 'package:tdd_and_unit_test/logic/checker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

TextEditingController allQuestion = TextEditingController();
TextEditingController solvedQuestio = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           TextField(
            key: ValueKey("all"),
            controller: allQuestion,
           ),
           TextField(
            key: ValueKey("some"),
            controller: solvedQuestio,
           )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          try {
 bool status=  checkStudentStatus(allQuestion: int.parse(allQuestion.text), correctQustion: int.parse(solvedQuestio.text), grade: Grade.GOOD);
            if (status) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Success"),backgroundColor: Colors.green,));
            } else {
              
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed"),backgroundColor: Colors.red,));
            }
          } catch (e) {
            print(e);

              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Repeat"),backgroundColor: Colors.grey,));
          }
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
