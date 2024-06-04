import 'package:get/get.dart';
import 'package:project_test_03/src/core/base/base_controller.dart';
import 'package:project_test_03/src/routers/route_path.dart';
import 'package:project_test_03/src/services/repository/pokemon/pokemon_repo.dart';

import '../../../core/config/enum_config.dart';
import '../models/pokemons_model.dart';

class PokemonController extends BaseController {
  final PokemonRepo _pokemonRepo = Get.find(tag: (PokemonRepo).toString());

  final _pokemon = PokemonsModel().obs;
  PokemonsModel get pokemon => _pokemon.value;
  set _setPokemon(PokemonsModel value) => _pokemon.value = value;

  final _pokemons = <PokemonModel>[].obs;
  List<PokemonModel> get pokemons => _pokemons;
  set _setPokemons(List<PokemonModel> value) => _pokemons.value = value;

  // Api State
  final _pokemonsState = ApiState.START.obs;
  ApiState get pokemonsState => _pokemonsState.value;
  set _setPokemonsState(ApiState value) => _pokemonsState.value = value;

  onPokemonDetail(String url) {
    List<String> values = url.split("/");
    String id = values[values.length - 2];
    Get.toNamed(
      "${RoutePath.pokemonDetail}?id=$id",
    );
  }

  Future getPokemons() async {
    try {
      _setPokemonsState = ApiState.LOADING;
      var res = await _pokemonRepo.getPokemons();
      _setPokemon = PokemonsModel.fromJson(res.data);
      _setPokemons = pokemon.results ?? [];
      if (pokemons.isEmpty) {
        _setPokemonsState = ApiState.SUCCESSNULL;
        return;
      }
      _setPokemonsState = ApiState.SUCCESS;
    } catch (e) {
      _setPokemonsState = ApiState.ERROR;
    }
  }

  init() async {
    await getPokemons().then((value) async {});
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }
}
