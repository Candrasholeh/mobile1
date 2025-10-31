import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import '../Get.dart';
import '../Post.dart';
import '../Patch.dart';
import '../Delete.dart';
import 'home.dart'; // Faker Page

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    const GetPage(),
    const PostPage(),
    const PatchPage(),
    const DeletePage(),
    HomePage(), // Faker Page
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.blue,
        activeColor: Colors.white,
        color: Colors.white70,
        items: const [
          TabItem(icon: Icons.cloud_download, title: 'GET'),
          TabItem(icon: Icons.cloud_upload, title: 'POST'),
          TabItem(icon: Icons.edit, title: 'PATCH'),
          TabItem(icon: Icons.delete, title: 'DELETE'),
          TabItem(icon: Icons.data_object, title: 'FAKER'),
        ],
        initialActiveIndex: selectedIndex,
        onTap: (int i) {
          setState(() {
            selectedIndex = i;
          });
        },
      ),
    );
  }
}
