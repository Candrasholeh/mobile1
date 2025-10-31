import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilderPage(),
    );
  }
}

class FutureBuilderPage extends StatelessWidget {
  const FutureBuilderPage({Key? key}) : super(key: key);

  // Fungsi ambil data user dari API
  Future<Map<String, dynamic>> getDataUser() async {
    var response = await http.get(Uri.parse("https://reqres.in/api/users/2"));

    if (response.statusCode == 200) {
      // ubah JSON jadi Map
      return json.decode(response.body)["data"];
    } else {
      throw Exception("Gagal memuat data user");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HTTP GET - FutureBuilder"),
        centerTitle: true,
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: getDataUser(), // memanggil fungsi Future di atas
        builder: (context, snapshot) {
          // snapshot berisi hasil Future
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // loading
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData) {
            return Center(child: Text("Tidak ada data"));
          } else {
            var data = snapshot.data!;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(data["avatar"]),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "${data['first_name']} ${data['last_name']}",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(data["email"]),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
