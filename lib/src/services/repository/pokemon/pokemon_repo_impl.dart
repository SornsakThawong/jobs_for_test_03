import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:project_test_03/src/services/repository/pokemon/pokemon_repo.dart';

import '../../api/dio_service.dart';

class PokemonRepoImpl extends DioService implements PokemonRepo {
  @override
  Future<Response> getPokemons({String? next}) async {
    String endpoint = baseUrl;
    if (next != null) {
      endpoint = next;
    }
    log(" URL : $endpoint");
    return await httpDio.get(endpoint);
  }

  @override
  Future<Response> getPokemon({required String id}) async {
    String endpoint = "$baseUrl/$id";
    return await httpDio.get(endpoint);
  }
}
