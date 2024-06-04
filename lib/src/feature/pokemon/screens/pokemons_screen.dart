import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_test_03/src/core/widgets/responsive_layout.dart';
import 'package:project_test_03/src/feature/pokemon/controllers/pokemon_controller.dart';
import 'package:project_test_03/src/feature/pokemon/screens/pokemons_screen_md.dart';
import 'package:project_test_03/src/feature/pokemon/screens/pokemons_screen_sm.dart';
import 'package:skeletons/skeletons.dart';

import '../../../core/base/base_stl_widget.dart';

class PokemonsScreen extends StatelessWidget {
  PokemonsScreen({super.key});
  final crtl = Get.put(PokemonController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileBody: PokemonsScreenSM(),
      tabletBody: PokemonsScreenMD(),
    );
  }
}

abstract class BasePokemonsScreen extends BaseStlScreen {
  BasePokemonsScreen({super.key});

  @protected
  double get titleFontSize => 20.0;

  @protected
  double get subTitleFontSize => 16.0;

  @protected
  TextStyle get titleTextStyle =>
      TextStyle(fontSize: titleFontSize, fontWeight: FontWeight.bold);

  @protected
  TextStyle get subTitleTextStyle =>
      titleTextStyle.copyWith(fontWeight: FontWeight.normal);

  @protected
  TextStyle get labelTextStyle =>
      titleTextStyle.copyWith(fontSize: subTitleFontSize, height: 1.4);

  @protected
  TextStyle get subLabelTextStyle => titleTextStyle.copyWith(
      fontSize: subTitleFontSize, fontWeight: FontWeight.normal, height: 1.2);

  @protected
  double get departmentsHeight => 120.0;

  @protected
  double get productsHeight => 180.0;

  @protected
  double get boxHeight_1 => 11.0;

  @protected
  double get boxHeight_2 => 22.0;

  @protected
  double get paddingAll => 15.0;

  Widget get productsLoadingWidget => Expanded(
        child: GridView.builder(
          itemCount: 20,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: paddingAll,
            crossAxisSpacing: paddingAll,
            mainAxisExtent: productsHeight,
          ),
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(11),
              child: Material(
                color: Colors.grey.shade200,
                elevation: 2,
                child: Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: Icon(
                          Icons.image,
                          size: 120,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SkeletonLine(
                              style: SkeletonLineStyle(
                                width: double.infinity,
                              ),
                            ),
                            SkeletonLine(
                              style: SkeletonLineStyle(
                                width: 70,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SkeletonLine(
                                  style: SkeletonLineStyle(
                                    width: 70,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      );
}
