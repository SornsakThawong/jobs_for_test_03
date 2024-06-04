import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/config/enum_config.dart';
import '../controllers/pokemon_detail_controller.dart';
import 'pokemon_detail_screen.dart';

class PokemonDetailScreenMD extends BasePokemonDetailScreen {
  PokemonDetailScreenMD({super.key});
  final ctrl = Get.find<PokemonDetailController>();

  @override
  double get paddingAll => 40.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: paddingAll),
          child: Obx(
            () {
              if (ctrl.pokemonState == ApiState.START ||
                  ctrl.pokemonState == ApiState.LOADING) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (ctrl.pokemonState == ApiState.ERROR) {
                return const Center(child: Text("Error."));
              }
              return buildBody();
            },
          ),
        ),
      ),
    );
  }

  Widget buildBody() {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 4/3,
          child: Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.red)),
            child: Image.network(
              ctrl.pokemon.sprites!.backDefault ?? "",
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          ctrl.pokemon.name ?? "",
          style: titleTextStyle.copyWith(fontSize: 42),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
