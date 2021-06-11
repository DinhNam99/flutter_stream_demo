import 'package:flutter/material.dart';
import 'package:flutter_stream/Stream/stream_demo.dart';
import 'package:flutter_stream/counter/counter_page.dart';
import 'package:flutter_stream/redux/redux_demo.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DEMO"),
      ),

      body: Container(

        child: Column(
        
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildBtn(
              context,
              "Counter",
              CounterPage(),
            ),
            _buildBtn(
              context,
              "Stream",
              StreamDemo(
                title: "Stream Demo",
              ),
            ),
            _buildBtn(
              context,
              "Redux",
              ReduxDemo(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBtn(BuildContext context, String label, Widget page) {
    return MaterialButton(
      color: Colors.blue,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (c) => page,
          ),
        );
      },
      child: Center(
        child: Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
