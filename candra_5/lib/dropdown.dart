import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<Map<String, dynamic>> data = [
    {
      "judul": "Pilihan ke - 1",
      "data": 1,
    },
    {
      "judul": "Pilihan ke - 2",
      "data": 2,
    },
    {
      "judul": "Pilihan ke - 3",
      "data": 3,
    },
  ];

  late int dataAwal;

  @override
  void initState() {
    dataAwal = data[0]["data"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dropdown"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: DropdownButton(

            value: dataAwal,
            items: data
                .map(
                  (e) => DropdownMenuItem(
                child: Text(e['judul']),
                value: e['data'] as int,
              ),
            )
                .toList(),
            onChanged: (value) {
              setState(() {
                dataAwal = value as int;
              });
            },
          ),
        ),
      ),
    );
  }
}