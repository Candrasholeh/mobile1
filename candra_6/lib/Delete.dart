import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DeletePage extends StatefulWidget {
  const DeletePage({Key? key}) : super(key: key);

  @override
  State<DeletePage> createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {
  TextEditingController idC = TextEditingController();

  String hasilResponse = "Belum ada data";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HTTP DELETE"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: idC,
            autocorrect: false,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "User ID yang akan dihapus",
            ),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () async {
              if (idC.text.isEmpty) {
                setState(() {
                  hasilResponse = "Masukkan ID terlebih dahulu!";
                });
                return;
              }

              var response = await http.delete(
                Uri.parse("https://reqres.in/api/users/${idC.text}"),
              );

              if (response.statusCode == 204) {
                setState(() {
                  hasilResponse =
                  "Data dengan ID ${idC.text} berhasil dihapus (Status: 204 No Content)";
                });
              } else {
                setState(() {
                  hasilResponse =
                  "Gagal menghapus data. Status code: ${response.statusCode}";
                });
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text("DELETE DATA"),
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
