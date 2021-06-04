import 'dart:async';

import 'package:flutter_stream/counter/counter_event.dart';
import 'package:flutter_stream/counter/counter_state.dart';

class CounterBloc {
  var state = CounterState(5);

  final eventController = StreamController<CounterEvent>();
  final stateController = StreamController<CounterState>();

  CounterBloc() {
    eventController.stream.listen((event) {
      if (event == CounterEvent.increment) {
        state = CounterState(state.num + 1);
        print(state.num.toString());
      } else if (event == CounterEvent.decrement) {
        state = CounterState(state.num - 1);
      }
      stateController.sink.add(state);
    });
  }

  void dispose() {
    eventController.close();
    stateController.close();
  }
}
