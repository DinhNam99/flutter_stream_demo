import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class ReduxDemo extends StatefulWidget {
  const ReduxDemo({Key key}) : super(key: key);

  @override
  _ReduxDemoState createState() => _ReduxDemoState();
}

class _ReduxDemoState extends State<ReduxDemo> {
  Store<int> store;

  @override
  void initState() {
    super.initState();
    store = Store<int>(counterReducer, initialState: 0);
  }

  int counterReducer(int state, dynamic action) {
    if (action == Actions.Increment) {
      return state + 1;
    } else if (action == Actions.Decrement) {
      return state - 1;
    }
    return state;
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider<int>(
      store: store,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Redux"),
        ),
        body: Center(
          child: StoreConnector<int, String>(
            converter: (store) => store.state.toString(),
            builder: (context, count) {
              return Text(
                '$count',
                style: TextStyle(fontSize: 20),
              );
            },
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            StoreConnector<int, VoidCallback>(
              converter: (store) {
                return () => store.dispatch(Actions.Increment);
              },
              builder: (context, callBack) {
                return FloatingActionButton(
                  onPressed: callBack,
                  child: Icon(Icons.add),
                );
              },
            ),
            StoreConnector<int, VoidCallback>(
              converter: (store) {
                return () => store.dispatch(Actions.Decrement);
              },
              builder: (context, callBack) {
                return FloatingActionButton(
                  onPressed: callBack,
                  child: Icon(Icons.remove),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

enum Actions { Increment, Decrement }
