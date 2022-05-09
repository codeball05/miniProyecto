import 'package:flutter/material.dart';
import 'package:huellitas/src/models/pet.dart';
import 'package:huellitas/src/routes/routes.dart';
import 'package:huellitas/src/utils/constantes.dart';
import 'package:huellitas/src/utils/utils.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Pet> pets = [
    Pet(
      name: "Boby",
      tipo: "Perro",
      edad: 1,
      raza: "Pastor Aleman",
      description:
          "Boby, tienen 1 año de edad es perro muy tierno, sabe trucos ",
      img: "images/pet1.png",
      inSearch: false,
    ),
    Pet(
      name: "Mishi",
      tipo: "Gato",
      edad: 1,
      raza: "Mestizo",
      description: "Mishi, es una gatita muy juguetona..... ",
      img: "images/pet2.png",
      inSearch: false,
    ),
    Pet(
      name: "firulais",
      tipo: "Perro",
      edad: 1,
      raza: "Pastor Aleman",
      description:
          "Boby, tienen 1 año de edad es perro muy tierno, sabe trucos ",
      img: "images/pet1.png",
      inSearch: false,
    ),
    Pet(
      name: "Rocky",
      tipo: "Gato",
      edad: 1,
      raza: "Mestizo",
      description: "Mishi, es una gatita muy juguetona..... ",
      img: "images/pet2.png",
      inSearch: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              'Todos',
              'Perros',
              'Gatos',
              'Aves',
            ]
                .map((e) => Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                      child: OutlineButton(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(e),
                      ),
                    ))
                .toList(),
          ),
        ),
        Column(
            children: pets
                .map(
                  (item) => Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Card(
                            elevation: 4.0,
                            margin: EdgeInsets.all(15),
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(item.name),
                                  subtitle: Text("Raza: " + item.raza),
                                  trailing:
                                      Icon(Icons.favorite_border_outlined),
                                ),
                                Image.asset(
                                  item.img,
                                ),
                                Container(
                                  padding: EdgeInsets.all(16.0),
                                  alignment: Alignment.centerLeft,
                                  child: Text(item.description),
                                ),
                                ButtonBar(
                                  children: [
                                    TextButton(
                                      child: const Text('MAS DETALLES'),
                                      onPressed: () {
                                        _moreDescription();
                                      },
                                    ),
                                    TextButton.icon(
                                      // <-- TextButton
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, RoutePaths.mapPage);
                                      },
                                      icon: Icon(
                                        Icons.map,
                                        size: 24.0,
                                      ),
                                      label: Text('NOTIFICAR'),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ]),
                  ),
                )
                .toList())
      ],
    );
  }

  void _moreDescription() {
    mostrarMensaje(
        context,
        "Por ahora no contamos con la funcionalidad, presione el boton del lado",
        Constantes.MENSAJE_EXITOSO);
  }
}
