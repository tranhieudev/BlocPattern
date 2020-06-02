//import 'package:demobloc2/main.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
//
//class AppDemo extends StatefulWidget {
//  @override
//  _AppDemoState createState() => _AppDemoState();
//}
//
//class _AppDemoState extends State<AppDemo> {
//  @override
//  Widget build(BuildContext context) {
//    return BlocProvider(
//        create: (_) => ThemeBloc(),
//        child: BlocBuilder<ThemeBloc, ThemeData>(
//          builder: (_, theme) {
//            return MaterialApp(
//              title: "Flutter demo",
//              home: BlocProvider(
//                create: (_) => CounterBloc(),
//                child: CounterPage(),
//              ),
//                theme: theme
//            );
//
//          },
//
//        )
//    );
//  }
//
//}
//
//class CounterPage extends StatefulWidget {
//  @override
//  _CounterPageState createState() => _CounterPageState();
//}
//
//class _CounterPageState extends State<CounterPage> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(title: const Text('Counter'),),
//      body: BlocBuilder<CounterBloc, int>(
//        builder: (_, count) {
//          return Center(
//            child: Text(
//                '$count',
//                style: const TextStyle(fontSize: 24.0)
//            ),
//          );
//        },
//      ),
//      floatingActionButton: Column(
//        crossAxisAlignment: CrossAxisAlignment.end,
//        mainAxisAlignment: MainAxisAlignment.end,
//        children: <Widget>[
//
//          Padding(
//            padding: const EdgeInsets.symmetric(vertical: 5.0),
//            child: FloatingActionButton(
//              child: const Icon(Icons.add),
//              onPressed: ()=> context.bloc<CounterBloc>().add(CounterEvent.increment),
//            ),
//          ),
//
//          Padding(
//            padding: const EdgeInsets.symmetric(vertical: 5.0),
//            child: FloatingActionButton(
//              child: const Icon(Icons.remove),
//              onPressed: ()=>
//              context.bloc<CounterBloc>().add(CounterEvent.decrement),
//            ),
//          ),
//
//          Padding(
//            padding: const EdgeInsets.symmetric(vertical: 5.0),
//            child: FloatingActionButton(
//              child: const Icon(Icons.brightness_6),
//              onPressed: ()=> context.bloc<ThemeBloc>().add(ThemEvent.toggle),
//            ),
//          ),
//
//          Padding(
//            padding: const EdgeInsets.symmetric(vertical: 5.0),
//            child: FloatingActionButton(
//              backgroundColor: Colors.red,
//              child: const Icon(Icons.error),
//              onPressed: () =>context.bloc<CounterBloc>().add(null),
//            ),
//          ),
//
//        ],
//      ),
//    );
//  }
//}
//
//
//enum CounterEvent {
//  increment,
//  decrement,
//}
//
//class CounterBloc extends Bloc<CounterEvent, int> {
//  @override
//  // TODO: implement initialState
//  int get initialState => 0;
//
//  @override
//  Stream<int> mapEventToState(CounterEvent event) async* {
//    switch (event) {
//      case CounterEvent.decrement:
//        yield state - 1;
//        break;
//
//      case CounterEvent.increment:
//        yield state + 1;
//        break;
//
//      default :
//        throw Exception('oop');
//    }
//  }
//
//}
//enum ThemEvent {
//  toggle
//}
//
//class ThemeBloc extends Bloc <ThemEvent, ThemeData> {
//  // event : su kien tu dinh nghia, Data : du lieu get from lib
//  @override
//  // TODO: implement initialState
//  ThemeData get initialState => ThemeData.light();
//
//  @override
//  Stream<ThemeData> mapEventToState(ThemEvent event) async* {
//    switch (event) {
//      case ThemEvent.toggle:
//        yield (state == ThemeData.dark()) ? ThemeData.light() : ThemeData.dark(); //  tra ve ket qua : trong khi stream van chay
//        break;
//    }
//  }
//
//}