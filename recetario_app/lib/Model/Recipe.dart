class Recipe {
  int id;
  String title;
  String imageRecipe;
  List<String> ingredientes;

  Recipe(this.id, this.title, this.imageRecipe,
      [this.ingredientes = const ['Sin Ingredientes']]);

  String printMenu() {
    String receta = '';
    this.ingredientes.forEach((element) {
      receta += '	•' + element + '\n';
    });

    return receta;
  }
}
