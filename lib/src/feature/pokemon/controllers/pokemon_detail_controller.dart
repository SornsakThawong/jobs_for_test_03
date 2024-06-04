import 'package:get/get.dart';
import 'package:project_test_03/src/core/base/base_controller.dart';

import '../../../core/config/enum_config.dart';
import '../../../services/repository/pokemon/pokemon_repo.dart';
import '../models/pokemon_item_model.dart';

class PokemonDetailController extends BaseController {
  final PokemonRepo _pokemonRepo = Get.find(tag: (PokemonRepo).toString());

  final _pokemon = PokemonItemModel().obs;
  PokemonItemModel get pokemon => _pokemon.value;
  set _setPokemon(PokemonItemModel value) => _pokemon.value = value;

  final _pokemonState = ApiState.START.obs;
  ApiState get pokemonState => _pokemonState.value;
  set _setPokemonState(ApiState value) => _pokemonState.value = value;

  Future getPokemon(String id) async {
    try {
      _setPokemonState = ApiState.LOADING;
      var res = await _pokemonRepo.getPokemon(id: id);
      _setPokemon = PokemonItemModel.fromJson(res.data);
      _setPokemonState = ApiState.SUCCESS;
    } catch (e) {
      _setPokemonState = ApiState.ERROR;
      // logError("message: ${e}");
    }
  }

  @override
  void onInit() {
    getPokemon(Get.parameters["id"] ?? "");
    super.onInit();
  }
}
