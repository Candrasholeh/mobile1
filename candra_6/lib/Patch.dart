import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PatchPage extends StatefulWidget {
  const PatchPage({Key? key}) : super(key: key);

  @override
  State<PatchPage> createState() => _PatchPageState();
}

class _PatchPageState extends State<PatchPage> {
  TextEditingController nameC = TextEditingController();
  TextEditingController jobC = TextEditingController();

  String hasilResponse = "Belum ada data";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HTTP PUT / PATCH"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: nameC,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Name",
            ),
          ),
          const SizedBox(height: 15),
          TextField(
            controller: jobC,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Job",
            ),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () async {
              // gunakan PUT kalau mau update seluruh data
              var response = await http.patch(
                Uri.parse("https://reqres.in/api/users/3"),
                body: {
                  "name": nameC.text,
                  "job": jobC.text,
                },
              );

              if (response.statusCode == 200) {
                var data = json.decode(response.body);
                setState(() {
                  hasilResponse =
                  "Name: ${data['name']}\nJob: ${data['job']}\nUpdated At: ${data['updatedAt']}";
                });
              } else {
                setState(() {
                  hasilResponse =
                  "Gagal update data. Status code: ${response.statusCode}";
                });
              }
            },
            child: const Text("UPDATE DATA"),
          ),
          const SizedBox(height: 40),
          const Divider(color: Colors.black),
          const SizedBox(height: 10),
          Text(
            hasilResponse,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
