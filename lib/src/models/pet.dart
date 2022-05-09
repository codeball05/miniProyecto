class Pet {
  String name;
  String tipo;
  int edad;
  String raza;
  String description;
  String img;
  bool inSearch;
  int interested;

  Pet(
      {required this.name,
      required this.tipo,
      required this.edad,
      required this.raza,
      this.description = "SN",
      required this.img,
      this.inSearch = false,
      this.interested = 0});
}
