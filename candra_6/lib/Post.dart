import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  TextEditingController nameC = TextEditingController();
  TextEditingController jobC = TextEditingController();

  String hasilResponse = "Belum ada data";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HTTP POST"),
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
              var response = await http.post(
                Uri.parse("https://reqres.in/api/users"),
                body: {
                  "name": nameC.text,
                  "job": jobC.text,
                },
              );

              if (response.statusCode == 201) {
                var data = json.decode(response.body);
                setState(() {
                  hasilResponse =
                  "Name: ${data['name']}\nJob: ${data['job']}\nCreated At: ${data['createdAt']}";
                });
              } else {
                setState(() {
                  hasilResponse =
                  "Gagal mengirim data. Status code: ${response.statusCode}";
                });
              }
            },
            child: const Text("SUBMIT"),
          ),
          const SizedBox(height: 50),
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
