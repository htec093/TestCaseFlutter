import 'package:get/get.dart';

import '../modules/animation_screen/bindings/animation_screen_binding.dart';
import '../modules/animation_screen/views/animation_screen_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/pokemons/bindings/pokemons_binding.dart';
import '../modules/pokemons/views/pokemons_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),

    // GetPage(
    //   name: _Paths.PROJECT_DETAILS,
    //   page: () => const ProjectDetailsView(),
    //   binding: ProjectDetailsBinding(),
    //   showCupertinoParallax: true,
    //   transition: Transition.rightToLeft,
    // ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ANIMATION_SCREEN,
      page: () => const AnimationScreenView(),
      binding: AnimationScreenBinding(),
    ),
    GetPage(
      name: _Paths.POKEMONS,
      page: () => const PokemonsView(),
      binding: PokemonsBinding(),
    ),
  ];
}
