import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:huellitas/src/models/pet.dart';
import 'package:huellitas/src/routes/routes.dart';
import 'package:huellitas/src/utils/constantes.dart';
import 'package:huellitas/src/utils/data.dart';
import 'package:huellitas/src/utils/utils.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var itemList = data;
  var listScrollController = new ScrollController();
  var scrollDirection = ScrollDirection.idle;

  @override
  void initState() {
    listScrollController.addListener(() {
      setState(() {
        scrollDirection = listScrollController.position.userScrollDirection;
      });
    });
    super.initState();
  }

  bool _scrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification) {
      setState(() {
        scrollDirection = ScrollDirection.idle;
      });
    }
    return true;
  }

  int selectedPage = 0;
  List<Pet> pets = [
    Pet(
      name: "Boby",
      tipo: "Perro",
      edad: 1,
      raza: "Pastor Aleman",
      description: "Boby es un perro bien introvertido, huyo de casa ",
      img: "images/pet1.png",
      inSearch: false,
    ),
    Pet(
      name: "Mishi",
      tipo: "Gato",
      edad: 1,
      raza: "Mestizo",
      description: "Mishi, es una gatita que se extravio ...... ",
      img: "images/pet2.png",
      inSearch: false,
    ),
    Pet(
      name: "firulais",
      tipo: "Perro",
      edad: 1,
      raza: "Pastor Aleman",
      description: "Boby es un perro bien introvertido, huyo de casa ",
      img: "images/pet1.png",
      inSearch: false,
    ),
    Pet(
      name: "Rocky",
      tipo: "Gato",
      edad: 1,
      raza: "Mestizo",
      description: "Mishi, es una gatita que se extravio ...... ",
      img: "images/pet2.png",
      inSearch: false,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            _textsHeader(context),
            Container(
              child: Center(
                child: Container(
                  height: 400,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: NotificationListener<ScrollNotification>(
                    onNotification: _scrollNotification,
                    child: ListView(
                      controller: listScrollController,
                      scrollDirection: Axis.horizontal,
                      children: pets.map((item) {
                        return AnimatedContainer(
                          duration: Duration(milliseconds: 100),
                          transform: Matrix4.rotationZ(
                              scrollDirection == ScrollDirection.forward
                                  ? 0.07
                                  : scrollDirection == ScrollDirection.reverse
                                      ? -0.07
                                      : 0),
                          width: 250,
                          margin: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                              color: Colors.amber, //Color(item["color"]),
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xFF757575).withOpacity(
                                        0.6), //(item["color"]).withOpacity(0.6),
                                    offset: Offset(-6, 4),
                                    blurRadius: 10)
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                title: Text(
                                  item.name,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(item.raza),
                                trailing: Icon(Icons.favorite_border_outlined),
                              ),
                              Image.asset(
                                item.img, //"images/pet1.png",
                                height: 120,
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(vertical: 16)),
                              Text(
                                item.description,
                                style: TextStyle(
                                  color: Colors.black54,
                                  //fontSize: 24,
                                  //fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _textsHeader(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Mascotas Encontradas',
            style: Theme.of(context).textTheme.headline3,
          ),
        ],
      ),
    );
  }
}
