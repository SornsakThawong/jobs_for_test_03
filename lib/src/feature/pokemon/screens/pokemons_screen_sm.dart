import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_test_03/src/feature/pokemon/controllers/pokemon_controller.dart';

import '../../../core/config/enum_config.dart';
import '../models/pokemons_model.dart';
import 'pokemons_screen.dart';

class PokemonsScreenSM extends BasePokemonsScreen {
  PokemonsScreenSM({super.key});
  final ctrl = Get.find<PokemonController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: paddingAll),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildProductsBody(),
          ],
        ),
      ),
    );
  }

  Widget buildProductsBody() {
    return Obx(() {
      if (ctrl.pokemonsState == ApiState.START ||
          ctrl.pokemonsState == ApiState.LOADING) {
        return productsLoadingWidget;
      }
      if (ctrl.pokemonsState == ApiState.ERROR) {
        return const Center(child: Text("Error products."));
      }
      if (ctrl.pokemonsState == ApiState.SUCCESSNULL) {
        return const Center(
          child: Text("Empty product data."),
        );
      }
      return Expanded(
        child: GridView.builder(
          padding: EdgeInsets.only(bottom: paddingAll),
          itemCount: ctrl.pokemons.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: paddingAll,
            crossAxisSpacing: paddingAll,
            mainAxisExtent: productsHeight,
          ),
          itemBuilder: (context, index) {
            PokemonModel item = ctrl.pokemons[index];
            return Material(
              color: Colors.white,
              elevation: 2,
              borderRadius: BorderRadius.circular(11),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: InkWell(
                onTap: () => ctrl.onPokemonDetail(item.url ?? ""),
                child: Column(
                  children: [
                    Expanded(
                      flex: 6,
                      child: SizedBox.expand(
                        child: Container(
                          color: Colors.grey,
                          child: const Icon(
                            Icons.image,
                            size: 80,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              item.name ?? "",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: labelTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
