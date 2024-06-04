import 'package:dio/dio.dart';

abstract class PokemonRepo {
  Future<Response> getPokemons({String? next});
  Future<Response> getPokemon({required String id});
}
