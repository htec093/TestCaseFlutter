import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ososs_test/app/data/models/pokemon_page.dart';

import '../../../data/models/failures.dart';
import '../../../data/repositories/main_data_repository.dart';

class PokemonsController extends GetxController {
  GlobalKey<ScaffoldState>? scaffoldKey;
  PokemonPage pokemonPage = PokemonPage();
  var pokemonList = <Pokemon>[].obs;

  /// loading: 0 , errorResponse: 1, emptyResponse =2
  var screenState = 0.obs;
  Failure? failure;

  ScrollController? scrollController;
  var isLoading = true.obs;


  @override
  void onInit() {
    scaffoldKey = GlobalKey<ScaffoldState>();
    scrollController = ScrollController();
    failure = Failure(0, '');
    scrollController!.addListener(loadMore);
    listenForPokemons();
    super.onInit();
  }

  Future<void> refreshPage() async {
    failure = Failure(0, '');
    pokemonPage = PokemonPage();
    pokemonList.value = [];
    listenForPokemons();
  }

  Future<void> listenForPokemons() async {
    screenState.value = 0;
    isLoading.value = true;
    getPokemons(path: pokemonPage.next).then((response) {
      isLoading.value = false;
      response.fold((fail) {
        screenState.value = 1;
        failure = fail;
      }, (pokemonPg) {
        pokemonList.addAll(pokemonPg.pokemons!);
        pokemonPage = pokemonPg;
        if (pokemonList.isEmpty) {
          screenState.value = 2;
        }
      });
    });
  }

  loadMore() {
    if (isLoading.isFalse &&
        scrollController!.offset >=
            scrollController!.position.maxScrollExtent &&
        !scrollController!.position.outOfRange) {
      if (pokemonPage.next !=null) {
        listenForPokemons();
      }
    }
  }

}
