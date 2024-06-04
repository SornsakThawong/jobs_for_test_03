import 'package:get/get.dart';
import 'package:project_test_03/src/bindings/pokemon/pokemon_binding.dart';
import 'package:project_test_03/src/feature/auth/screens/login_screen.dart';
import 'package:project_test_03/src/feature/food_delivery/checkout/screens/checkout_screen.dart';
import 'package:project_test_03/src/feature/food_delivery/initial/screens/nav_bar_screen.dart';
import 'package:project_test_03/src/feature/food_delivery/product/screens/product_detail_screen.dart';
import 'package:project_test_03/src/feature/pokemon/screens/pokemon_detail_screen.dart';
import 'package:project_test_03/src/feature/pokemon/screens/pokemons_screen.dart';
import 'package:project_test_03/src/middlewares/global_middleware.dart';

import '../feature/initial/screens/splash_screen.dart';
import '../feature/user/screens/user_screen.dart';
import 'route_path.dart';

class RouteScreen {
  static const initial = RoutePath.splash;

  static final routes = [
    GetPage(
      name: RoutePath.splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: RoutePath.login,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: RoutePath.user,
      page: () => UserScreen(),
      middlewares: [
        GlobalMiddleware(),
      ],
    ),

    // Pokemon
    GetPage(
      name: RoutePath.pokemons,
      page: () => PokemonsScreen(),
      binding: PokemonBindings(),
    ),
    GetPage(
      name: RoutePath.pokemonDetail,
      page: () => PokemonDetailScreen(),
      binding: PokemonBindings(),
    ),

    // Food delivery
    GetPage(
      name: RoutePath.foodDelivery,
      page: () => NavBarScreen(),
    ),
    GetPage(
      name: RoutePath.detail,
      page: () => ProductDetailScreen(),
    ),
    GetPage(
      name: RoutePath.checkout,
      page: () => CheckoutScreen(),
    ),
  ];
}
