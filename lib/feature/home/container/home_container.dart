import 'package:flutter/cupertino.dart';
import 'package:pokedexflutter/common/models/pokemon.dart';
import 'package:pokedexflutter/feature/home/pages/home_error.dart';
import 'package:pokedexflutter/feature/home/pages/home_page.dart';
import 'package:pokedexflutter/feature/home/pages/home_loading.dart';

import '../../../common/repository/pokemon_repository.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({Key? key, required this.repository}) : super(key: key);
  final IPokemonRepository repository;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return HomeLoading();
        }

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return HomePage(list: snapshot.data!);
        }

        if (snapshot.hasError) {
          return HomeError(
            error: snapshot.error.toString(),
          );
        }
        return Container();
      }),
    );
  }
}
