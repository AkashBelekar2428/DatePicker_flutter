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
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('DatePicker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('hello',style: TextStyle(fontSize: 15)),
            ElevatedButton(onPressed: () async {
              DateTime? datePicked =  await showDatePicker(
                  context: context,
                  initialDate: DateTime(2024),
                  firstDate: DateTime(2021),
                  lastDate: DateTime(2025));

              if (datePicked!= null){
                print('Selected Date: ${datePicked.year}-${datePicked.day}-${datePicked.month}');
              }

            }, child: Text('Show Date')),
            ElevatedButton(onPressed: () async {
              TimeOfDay? time = await showTimePicker(
                  context: context,
                  initialEntryMode:TimePickerEntryMode.input,
                  initialTime: TimeOfDay.now());

              if (time!=null){
                print('Selected Time: ${time.hour}h:${time.minute}m');
              }

            }, child: Text('Show Time'))
          ],
        ),
      )
    );
  }
}
