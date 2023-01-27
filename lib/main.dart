import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pay Calculator',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Pay Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double hourCounter = 0;
  double rateCounter = 0;
  double regularPay = 0;
  double overtimePay = 0;
  double totalPay = 0;
  double tax = 0;

  final TextEditingController numberHoursController =
      TextEditingController(text: '0');
  final TextEditingController rateCounterController =
      TextEditingController(text: "0");
  void _increment() {
    setState(() {
      hourCounter = double.parse(numberHoursController.text);
      rateCounter = double.parse(rateCounterController.text);

      if (hourCounter <= 40) {
        regularPay = hourCounter * rateCounter;
        overtimePay = 0;
        totalPay = hourCounter * rateCounter;
        tax = totalPay * 0.18;
      } else {
        regularPay = hourCounter * 40;
        overtimePay = (hourCounter - 40) * rateCounter * 1.5;
        totalPay = (hourCounter - 40) * rateCounter * 1.5 + hourCounter * 40;
        tax = totalPay * 0.18;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 40, 0, 30),
          height: 800,
          color: Colors.black26,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              ),
              TextField(
                controller: numberHoursController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Number of hours',
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              ),
              TextField(
                controller: rateCounterController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Hourly rate',
                ),
              ),
              ElevatedButton(
                onPressed: _increment,
                child: const Text(
                  'Calculate',
                  style: TextStyle(color: Colors.black),
                  textScaleFactor: 2,
                ),
              ),
              const SizedBox(width: 56),
              const Text('Report:'),
              Text('regular pay: $regularPay'),
              Text('overtime pay: $overtimePay'),
              Text('Total pay: $totalPay'),
              Text('Tax $regularPay'),
              
                child: Column(
                  Text(
                  "Yingda Zhang 301275707",
                  style: TextStyle(fontSize: 35, backgroundColor: Color.fromARGB(255, 73, 65, 65)),
                ),
                ),

            ],
          ),
        ),
      ),
    );
  }
}
