import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LogInPage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double width = 200;
  double height = 200;
  Color color = Colors.red;
  String name = "Hello";
  bool isSelected = false;

  bool isSelected2 = false;
  double price = 200;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CheckboxListTile(
              secondary: CircleAvatar(),
              controlAffinity: ListTileControlAffinity.platform,
              selected: isSelected2,
              selectedTileColor: Colors.red,
              title: Text("Hello WOlrd"),
              subtitle: Text("Hello From  anouther world"),
              value: isSelected2,
              onChanged: (value) {
                isSelected2 = value!;
                setState(() {});
              },
            ),
            Checkbox(
              value: isSelected,
              onChanged: (value) {
                isSelected = value!;
                setState(() {});
              },
            ),
            Container(
              child: Center(child: Text(name)),
              color: color,
              width: width,
              height: height,
            ),
            Slider(
              min: 0,
              max: 1000,
              divisions: 10,
              label: price.toString(),
              allowedInteraction: SliderInteraction.tapAndSlide,

              value: price,
              onChanged: (value) {
                price = value;
                setState(() {});
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          width = width + 40;
          height = height + 40;
          color = Colors.grey;
          print(width);
          name = "Hello Again";
          setState(() {});
        },
      ),
    );
  }
}

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  TextEditingController username = TextEditingController();

  TextEditingController password = TextEditingController();
  bool isHiddenPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 500,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  "Login With Your Account",
                  style: TextStyle(fontSize: 28),
                ),
              ),
              SizedBox(
                width: 200,
                child: TextField(
                  obscureText: false,
                  controller: username,
                  onChanged: (value) {
                    // print(value);
                  },
                  decoration: InputDecoration(
                    labelText: "Username",
                    // hintText: "Username",
                    // helperText: "Username",
                    // labelText: "username",
                    // prefix: FlutterLogo(),
                    // suffix: FlutterLogo(),
                    // prefixIcon: FlutterLogo(),
                    // suffixIcon: FlutterLogo(),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 200,
                  child: TextField(
                    maxLength: 11,
                    obscureText: isHiddenPassword,
                    controller: password,
                    onChanged: (value) {
                      // print(value);
                      if (value.length > 10) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Too Much Letter")),
                        );
                      }
                    },
                    decoration: InputDecoration(
                      labelText: "password",
                      suffixIcon: InkWell(
                        onTap: () {
                          isHiddenPassword = !isHiddenPassword;
                          setState(() {});
                        },
                        child: Icon(Icons.visibility),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  if (username.text == "Ahmad" && password.text == "123123") {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Please Enter Correct Username / Passwor",
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.red,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(child: Text("Login")),
                  margin: EdgeInsets.all(20),
                  width: 140,
                  height: 60,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
