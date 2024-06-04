import 'package:get/get.dart';

import '../../services/repository/pokemon/pokemon_repo.dart';
import '../../services/repository/pokemon/pokemon_repo_impl.dart';

class PokemonBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PokemonRepo>(
      () => PokemonRepoImpl(),
      tag: (PokemonRepo).toString(),
    );
  }
}
