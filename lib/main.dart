import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedexflutter/feature/home/container/home_container.dart';

import 'common/repository/pokemon_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeContainer(
        repository: PokemonRepository(
          dio: Dio(),
        ),
      ),
    );
  }
}
