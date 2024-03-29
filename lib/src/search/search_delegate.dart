import 'package:flutter/material.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';

class DataSearch extends SearchDelegate {
  final peliculasProvider = new PeliculasProvider();
}

String seleccion = '';

final peliculas = ['Spiderman', 'Aquaman', 'Batman', 'Shazam', 'Ironman'];

final peliculasRecientes = ['Spiderman', 'Capitán América'];

@override
List<Widget> buildActions(BuildContext context) {
  return [
    IconButton(
      icon: Icon(
        Icons.clear,
      ),
      onPressed: () {
        query = '';
      },
    )
  ];
}

@override
Widget buildLeading(BuildContext context) {
  return IconButton(
    icon: AnimatedIcon(
      icon: AnimatedIcons.menu_arrow,
      progress: transitionAnimation,
    ),
    onPressed: () {
      close(
        context,
        null,
      );
    },
  );
}

@override
Widget buildResults(BuildContext context) {
  return Center(
    child: Container(
      height: 100.0,
      width: 100.0,
      color: Colors.blueAccent,
      child: Text(''),
    ),
  );
}

@override
Widget buildSuggestions(BuildContext context) {
  if (query.isEmpty) {
    return Container();
  }

  return FutureBuilder(
      future: peliculasProvider.buscarPelicula(query),
      builder: (BuildContext context, AsyncSnapshot snapshot<List<Pelicula>>) {
        if (snapshot.hasData) {}
      });
}
