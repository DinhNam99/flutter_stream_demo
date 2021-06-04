import 'package:flutter/material.dart';
import 'package:flutter_stream/counter/counter_bloc.dart';
import 'package:flutter_stream/counter/counter_event.dart';
import 'package:flutter_stream/counter/counter_state.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key key}) : super(key: key);

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final _bloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
      ),
      body: Center(
        child: StreamBuilder<CounterState>(
          stream: _bloc.stateController.stream,
          initialData: _bloc.state,
          builder: (context, snapshot) {
            return Text('${snapshot.data.num}');
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'btn1',
            onPressed: () {
              _bloc.eventController.sink.add(CounterEvent.increment);
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: 'btn2',
            onPressed: () {
              _bloc.eventController.sink.add(CounterEvent.decrement);
            },
            child: Icon(Icons.remove),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }
}
