import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StreamDemo extends StatefulWidget {
  StreamDemo({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _StreamDemoState createState() => _StreamDemoState();
}

class _StreamDemoState extends State<StreamDemo> {
  List<Map<String, String>> _mess = [];

  Stream<List<Map<String, String>>> _chatStream() async* {
    await Future<void>.delayed(
      Duration(seconds: 3),
    );
    _mess.add({"user_name": "A", "message": "Hello"});
    yield _mess;

    await Future<void>.delayed(
      Duration(seconds: 3),
    );
    _mess.add({"user_name": "B", "message": "Hi"});
    yield _mess;

    await Future<void>.delayed(
      Duration(seconds: 3),
    );
    _mess.add({"user_name": "A", "message": "how are you!"});
    yield _mess;

    await Future<void>.delayed(
      Duration(seconds: 3),
    );
    _mess.add({"user_name": "B", "message": "i'm fine"});
    yield _mess;
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder(
        stream: _chatStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(
                    snapshot.data[index]['user_name'],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  title: Text(
                    snapshot.data[index]['message'],
                    style: TextStyle(
                      fontSize: 18,
                      color: snapshot.data[index]['user_name'] == 'A'
                          ? Colors.blue
                          : Colors.red,
                    ),
                  ),
                );
              },
              itemCount: snapshot.data.length,
            );
          }
          return LinearProgressIndicator();
        },
      ),
    );
  }
}
