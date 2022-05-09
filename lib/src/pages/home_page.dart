import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:huellitas/src/pages/adoption_page.dart';
import 'package:huellitas/src/pages/posts_page.dart';
import 'package:huellitas/src/pages/profile_page.dart';
import 'package:huellitas/src/pages/search_page.dart';
import 'package:huellitas/src/routes/routes.dart';
import 'package:huellitas/src/utils/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  int selectedPage = 0;
  final pages = [
    PostPage(),
    AdoptionPage(),
    SearchPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Mis Huellitas"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              _auth.signOut();
              Navigator.pushReplacementNamed(context, RoutePaths.loginPage);
              mostrarMensaje(context, "Se cerro sesion", 2);
            },
          )
        ],
      ),
      body: pages[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedPage,
          fixedColor: Colors.blueAccent,
          unselectedItemColor: Color(0xFF757575),
          onTap: (position) {
            setState(() {
              selectedPage = position;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Post",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              label: "Adopta",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              label: "Busqueda",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: "Mi Perfil",
            ),
          ]),
    );
  }
}
