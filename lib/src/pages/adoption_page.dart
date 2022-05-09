import 'package:flutter/material.dart';
import 'package:huellitas/src/models/pet.dart';

class AdoptionPage extends StatefulWidget {
  const AdoptionPage({Key? key}) : super(key: key);

  @override
  State<AdoptionPage> createState() => _AdoptionPageState();
}

class _AdoptionPageState extends State<AdoptionPage> {
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
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade200,
                            blurRadius: 10,
                            spreadRadius: 3,
                            offset: Offset(3, 4))
                      ],
                    ),
                    child: ListTile(
                      leading: Image.asset(
                        item.img, //"images/pet1.png",
                        height: 140,
                      ),
                      title: Text(
                        item.name,
                        style: TextStyle(fontSize: 25),
                      ),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Edad: " + item.edad.toString()),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  item.description,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Interesados: 2"),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 40,
                            width: 200,
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                  left: 0,
                                  bottom: 0,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.green,
                                    child: Image.asset(
                                      "images/user3.png",
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 30,
                                  bottom: 0,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.green,
                                    child: Image.asset(
                                      "images/user2.png",
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      trailing: Icon(Icons.favorite_border_outlined),
                    ),
                  ),
                )
                .toList())
      ],
    );
  }
}

class Product {
  final image;
  final name;
  final price;

  Product(this.image, this.name, this.price);
}
