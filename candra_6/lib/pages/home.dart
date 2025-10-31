import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart'; // Tambahkan ini

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final faker = Faker();

  @override
  Widget build(BuildContext context) {
    // Inisialisasi locale data Indonesia
    initializeDateFormatting('id_ID', null);

    // Format tanggal lokal Indonesia
    final dateFormat = DateFormat('EEEE, dd MMMM yyyy', 'id_ID');
    final String nowFormatted = dateFormat.format(DateTime.now());

    // Buat data palsu (dummy)
    final List<Map<String, String>> data = List.generate(20, (index) {
      return {
        "name": faker.person.name(),
        "email": faker.internet.email(),
        "city": faker.address.city(),
        "date": nowFormatted,
      };
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Faker + Intl"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final item = data[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            elevation: 3,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(
                  item["name"]![0],
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              title: Text(item["name"] ?? ""),
              subtitle: Text(
                "${item["email"]}\n${item["city"]}\nDibuat pada ${item["date"]}",
              ),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}
