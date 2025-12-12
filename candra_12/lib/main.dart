import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Device Log Explorer",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String lokasi = "Belum ada lokasi";
  final ImagePicker picker = ImagePicker();

  Future<void> ambilLokasi() async {
    bool serviceEnabled;
    LocationPermission permission;


    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        lokasi = "GPS tidak aktif!";
      });
      return;
    }


    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied) {
      setState(() {
        lokasi = "Izin lokasi masih ditolak!";
      });
      return;
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        lokasi = "Izin lokasi ditolak permanen! Buka Pengaturan!";
      });
      return;
    }


    Position pos = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      lokasi = "Lat: ${pos.latitude}, Long: ${pos.longitude}";
    });
  }

  Future<void> bukaKamera() async {
    final foto = await picker.pickImage(source: ImageSource.camera);

    if (foto == null) {
      print("User batal ambil foto");
      return;
    }

    print("Foto tersimpan di: ${foto.path}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Device Log Explorer"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {

          await ambilLokasi();

          if (!lokasi.contains("Izin") && !lokasi.contains("GPS")) {
            await bukaKamera();
          }
        },
        child: Icon(Icons.camera_alt),
      ),
      body: Center(
        child: Text(
          lokasi,
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
