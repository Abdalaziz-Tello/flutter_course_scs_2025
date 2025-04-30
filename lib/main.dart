import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
PageController controller = PageController();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PageView(
        controller: controller,
        children: [Homepage(), Homepage(),Homepage()]),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  controller.animateToPage(2, duration:Duration(seconds: 2), curve:Curves.easeInSine);
                },
                child: Text(
                  "Skip",
                  style: TextStyle(
                    fontSize: 17,
                    color: Color(0xFF8BA8B5),
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(30)),
            ],
          ),
          FlutterLogo(size: 220),
          Text(
            "Write Lists",
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(

            padding: const EdgeInsets.all(40),
            child: Text(
              "Hello World From SCS Dev \nwith Flutter Course Best Learner Ever",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w200,
                color: Colors.grey,
              ),
            ),
          ),
          Container(
            // color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                ),

                Container(
                  margin: EdgeInsets.all(8),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                ),
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              controller.nextPage(duration: Duration(seconds: 2), curve: Curves.elasticOut);
            },
            child: Container(
              width: 317,
              height: 54,
              child: Center(
                child: Text(
                  "Next",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFF8BA8B5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
