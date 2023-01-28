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
      debugShowCheckedModeBanner: false,
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
  TextEditingController(text: 'Number of hours');
  final TextEditingController rateCounterController =
  TextEditingController(text: "Hourly rate");
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
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              color: Colors.black26,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    color: Colors.white,
                    child: Column(
                      children: [
                        TextField(
                          controller: numberHoursController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: 'Number of hours',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    color: Colors.white,
                    child: Column(
                      children: [
                        TextField(
                          controller: rateCounterController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            //border: OutlineInputBorder(),
                            fillColor: Colors.white,

                            hintText: 'Hourly rate',
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _increment,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(250, 50),
                    ),
                    child: const Text(
                      'Calculate',
                      style: TextStyle(color: Colors.black),
                      textScaleFactor: 1.5,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  ),
                  Container(
                    padding: const EdgeInsets.all(32),
                    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                          /*1*/
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Report:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                              Text(
                                'regular pay: $regularPay',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                'overtime pay: $overtimePay',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                'Total pay: $totalPay',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                'Tax $regularPay',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(32),
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              color: Colors.black45,
              child: Row(
                children: [
                  Expanded(
                    /*1*/
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        /*2*/
                        Container(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: const Text(
                            'Yingda Zhang',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.white),
                          ),
                        ),
                        const Text(
                          '301275707',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}