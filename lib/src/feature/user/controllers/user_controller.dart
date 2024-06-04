import 'package:get/get.dart';
import 'package:project_test_03/src/core/base/base_controller.dart';
import 'package:project_test_03/src/core/config/user_data_config.dart';
import 'package:project_test_03/src/feature/user/models/user_model.dart';
import 'package:project_test_03/src/routers/route_path.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends BaseController {
  Future<UserController> init() async {
    _preferences = await SharedPreferences.getInstance();
    setAccessToken = _preferences.getString("access_token") ?? "";
    if (accessToken != "") {
      UserModel currentUser = UserModel(
        email: accessToken,
        password: UserDummy.pass,
        firstName: UserDummy.firstName,
        lastName: UserDummy.lastName,
      );
      setUser = currentUser;
    }
    return this;
  }

  late SharedPreferences _preferences;

  final _accessToken = "".obs;
  String get accessToken => _accessToken.value;

  set setAccessToken(String value) {
    _accessToken.value = value;
  }

  final _user = UserModel().obs;
  UserModel get user => _user.value;

  set setUser(UserModel value) {
    _user.value = value;
  }

  Future<bool> updateUser(UserModel value) async {
    setUser = value;
    bool result = await _preferences.setString("access_token", user.email!);
    setAccessToken = value.email!;
    return result;
  }

  onPokemon() {
    Get.toNamed(RoutePath.pokemons);
  }

  onFoodDelivery() {
    Get.toNamed(RoutePath.foodDelivery);
  }

  onLogout() async {
    bool result = await _preferences.setString("access_token", "");
    if (result) {
      setAccessToken = "";
      setUser = UserModel();
      Get.offAllNamed(RoutePath.user);
    }
  }
}
