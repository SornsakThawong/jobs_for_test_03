import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_test_03/src/core/base/base_stl_widget.dart';
import 'package:project_test_03/src/core/widgets/responsive_layout.dart';
import 'package:project_test_03/src/feature/pokemon/controllers/pokemon_detail_controller.dart';
import 'package:project_test_03/src/feature/pokemon/screens/pokemon_detail_screen_md.dart';
import 'package:project_test_03/src/feature/pokemon/screens/pokemon_detail_screen_sm.dart';

class PokemonDetailScreen extends StatelessWidget {
  PokemonDetailScreen({super.key});
  final crtl = Get.put(PokemonDetailController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileBody: PokemonDetailScreenSM(),
      tabletBody: PokemonDetailScreenMD(),
    );
  }
}

abstract class BasePokemonDetailScreen extends BaseStlScreen {
  BasePokemonDetailScreen({super.key});

  @protected
  double get paddingAll => 15.0;

  @protected
  TextStyle get titleTextStyle =>
      const TextStyle(fontSize: 32, fontWeight: FontWeight.bold);
}
