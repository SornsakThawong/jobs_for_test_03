import 'package:get/get.dart';

import 'language_key.dart';

class LanguageLocaleString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'th_TH': th,
        'en_US': en,
      };
  Map<String, String> th = {
    LanguageKey.welcome: 'ยินดีต้อนรับ',
    LanguageKey.login: 'เข้าสู่ระบบ',
    LanguageKey.logout: 'ออกจากระบบ',
    LanguageKey.email: 'อีเมล',
    LanguageKey.password: 'รหัสผ่าน',
    LanguageKey.pokemon: 'โปเกมอน',
    LanguageKey.foodDelivery: 'สั่งอาหาร',
  };
  Map<String, String> en = {
    LanguageKey.welcome: 'Welcome',
    LanguageKey.login: 'Login',
    LanguageKey.logout: 'Logout',
    LanguageKey.email: 'Email',
    LanguageKey.password: 'Password',
    LanguageKey.pokemon: 'Pokemon',
    LanguageKey.foodDelivery: 'Food Delivery',
  };
}
