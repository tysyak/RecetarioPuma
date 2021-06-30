import 'package:flutter/material.dart';
import 'package:recetario/Model/Recipe.dart';

class RecipesHomePage extends StatefulWidget {
  RecipesHomePage({Key? key}) : super(key: key);

  @override
  _RecipesHomePageState createState() => _RecipesHomePageState();
}

class _RecipesHomePageState extends State<RecipesHomePage> {
  static List<Recipe> muestras = [
    Recipe(1, "Mole con pollo", "assets/images/comida1.jpeg", [
      "200 mililitros de mole poblano",
      "2 piernas de pollo",
      "2 muslos de pollo",
      "frijoles refritos de lata",
    ]),
    Recipe(2, "Chilaquiles", "assets/images/comida2.jpeg"),
    Recipe(3, "Tacos dorados", "assets/images/comida3.jpeg"),
    Recipe(4, "Maruchan con suadero", "assets/images/comida4.jpeg",
        ["Cancer", "Carne de Dogo", "Awa de uwu"]),
    Recipe(5, "Taquitos de canasta", "assets/images/comida5.jpeg")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Recetario PUMA"),
        ),
        body: SafeArea(
          child: ListView.builder(
            itemCount: muestras.length,
            itemBuilder: (BuildContext context, int index) {
              return widgetRecipeCard(context, muestras[index]);
            },
          ),
        ));
  }
}

Widget widgetRecipeCard(BuildContext context, Recipe recipe) {
  return Card(
    child: Column(
      children: <Widget>[
        ListTile(
          title: Text(recipe.id.toString() + ': ' + recipe.title),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DetailRecipe(recipe)));
          },
          leading: CircleAvatar(backgroundImage: AssetImage(recipe.imageRecipe)),
        ),
      ],
    ),
  );
}

class DetailRecipe extends StatelessWidget {
  // Define una variable requerida y recibe los parámetros pasados
  final Recipe recipe;

  // Establezca un parámetro predeterminado para el título, de modo que no se pueda pasar ningún valor al saltar a esta interfaz.
  DetailRecipe(this.recipe);

  @override
  Widget build(BuildContext context) {
    /// Scaffold puede generar fácilmente una página de estilo de material
    return Scaffold(
        // barra de navegación superior
        appBar: AppBar(
          title: Text(recipe.title),
        ),
        body: Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
              Image.asset(recipe.imageRecipe),
              Text(recipe.printMenu())
            ])));
  }
}
