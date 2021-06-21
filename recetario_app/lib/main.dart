import 'package:flutter/material.dart';
import 'package:recetario/Pages/RecipesHomePage.dart';

import 'Utilities/Colors.dart';

void main() => runApp(RecetarioPuma());

class RecetarioPuma extends StatelessWidget {
  const RecetarioPuma({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recetario Puma',
      theme: ThemeData(
        primaryColor: UNAM_Blue,
        accentColor: UNAM_Gold,
      ),
      home: RecipesHomePage(),
      routes: {
        '/detailRecipe': (context, {arguments}) => DetailRecipe(arguments)
      },
    );
  }
}
