import 'package:get/get.dart';

import '../controllers/pokemons_controller.dart';

class PokemonsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PokemonsController>(
      () => PokemonsController(),
    );
  }
}
