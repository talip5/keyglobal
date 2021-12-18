import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  GlobalKey<ScaffoldState> _scaffoldKey=GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formkey1=GlobalKey<FormState>();
  int _counter = 0;
  var formSizeHeigth;
  var formSizeWidth;

  void _incrementCounter() {
    setState(() {
       _counter++;
    });
    // print(_scaffoldKey.currentContext);
    // print(_scaffoldKey.currentState);
    // print(_scaffoldKey.currentWidget);
    //print(ValueKey(5).hashCode);
    //print(ObjectKey(5).hashCode);
    print(formkey1.currentContext!.size);
    print(formkey1.currentState);
    print(formkey1.currentWidget);
  }

  size(){
  formSizeHeigth=MediaQuery.of(context).size.height;
  formSizeWidth=MediaQuery.of(context).size.width;
  }

@override
void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
         title: Text(widget.title),
      ),
      body: Center(
        key: ValueKey('ali'),
          child: Column(
            key: ValueKey(1),
             mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Form(
              key: formkey1,
              child: ElevatedButton(
                  onPressed: (){
                    print('Form');
                    size();
                    print('formSizeWidth :$formSizeWidth');
                  }, child: Text('name')),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
