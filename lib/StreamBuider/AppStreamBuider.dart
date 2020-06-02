
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppStreamBuider extends StatefulWidget {
  @override
  _AppStreamBuiderState createState() => _AppStreamBuiderState();
}

class _AppStreamBuiderState extends State<AppStreamBuider> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Demo StreamBuider Bloc",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  final _bloc = CounterBloC ();

  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,

        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () => _bloc._counterEventController.add(CounterEvent.IncreaseEvent),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: FloatingActionButton(
              child: const Icon(Icons.remove),
              onPressed: () => _bloc._counterEventController.add(CounterEvent.DecreaseEvent),
            ),
          )
        ],
      ),
    );
  }

  _getBody() {
    return StreamBuilder(
      stream: _bloc.streamCounter,
      initialData: 0,
      builder: (context, snapshot){
        return Center(
          child: Text(snapshot.data.toString()),
        );
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _bloc.dispose();
  }

}


enum CounterEvent{
  IncreaseEvent,
  DecreaseEvent
}

class CounterBloC {
  int _counter = 0;

  // ignore: close_sinks
  final _counterStreamController = StreamController<int>();   // Stream Controller

  //init and get string controller
  StreamSink<int> get countSink => _counterStreamController.sink;


  //expose data from stream
  Stream<int> get streamCounter => _counterStreamController.stream;

  final _counterEventController = StreamController <CounterEvent>();

  //expose sink for input events
  Sink<CounterEvent> get counterEventSink => _counterEventController.sink;

  CounterBloC() {
    _counterEventController.stream.listen(_count);
  }

  _count(CounterEvent event) {  // Business Logic
    switch(event){
      case  CounterEvent.IncreaseEvent:
        countSink.add(++_counter);
        break;

      case CounterEvent.DecreaseEvent:
        countSink.add(--_counter);
        break;
    }
  }

  dispose() {
    _counterStreamController.close();
    _counterEventController.close();
  }

}

