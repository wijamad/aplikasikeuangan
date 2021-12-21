import 'package:get/get.dart';
import 'package:utslogin/app/modules/home/bindings/home_binding.dart';

import 'package:utslogin/app/modules/home/views/home_view.dart';
import 'package:utslogin/app/modules/login/bindings/login_binding.dart';
import 'package:utslogin/app/modules/login/views/login_view.dart';
import 'package:utslogin/app/modules/pendaftaran/bindings/pendaftaran_binding.dart';
import 'package:utslogin/app/modules/pendaftaran/views/pendaftaran_view.dart';
import 'package:utslogin/app/modules/pin/bindings/pin_binding.dart';
import 'package:utslogin/app/modules/pin/views/pin_view.dart';
import 'package:utslogin/app/modules/profil/bindings/profil_binding.dart';
import 'package:utslogin/app/modules/profil/views/profil_view.dart';
import 'package:utslogin/app/modules/rekening/bindings/rekening_binding.dart';
import 'package:utslogin/app/modules/rekening/views/rekening_view.dart';
import 'package:utslogin/app/modules/setting/bindings/setting_binding.dart';
import 'package:utslogin/app/modules/setting/views/setting_view.dart';
import 'package:utslogin/app/modules/tambah/bindings/tambah_binding.dart';

import 'package:utslogin/app/modules/tambah/views/tambah_view.dart';
import 'package:utslogin/app/modules/ubahpin/bindings/ubahpin_binding.dart';
import 'package:utslogin/app/modules/ubahpin/views/ubahpin_view.dart';

// import 'package:utslogin/app/modules/tambah/views/tambah_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.PENDAFTARAN,
      page: () => PendaftaranView(),
      binding: PendaftaranBinding(),
    ),
    GetPage(
      name: _Paths.PROFIL,
      page: () => ProfilView(),
      binding: ProfilBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAH,
      page: () => TambahView(),
      binding: TambahBinding(),
    ),
    GetPage(
      name: _Paths.PIN,
      page: () => PinView(),
      binding: PinBinding(),
    ),
    GetPage(
      name: _Paths.REKENING,
      page: () => RekeningView(),
      binding: RekeningBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: _Paths.UBAHPIN,
      page: () => UbahpinView(),
      binding: UbahpinBinding(),
    ),
  ];
}
