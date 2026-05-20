// import 'dart:async';
// import 'dart:developer';
// import 'dart:io';

// import 'package:app_settings/app_settings.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:sukar/helper/theme/app_colors.dart';
// import 'package:sukar/presintation/view/Localization/language_service.dart';
// import 'package:sukar/presintation/widgets/text/body_text1.dart';
// import 'package:sukar/utils/routes/routes_string.dart';
// import 'package:sukar/utils/tools.dart';

// class AppSettingController extends GetxController {
//   bool check = false;
//   RxBool ischeked = false.obs;
//   bool? isLogged;

//   final PageController pageController = PageController();
//   final ValueNotifier<int> currentPage = ValueNotifier<int>(0);
//   final int totalPages = 3;

//   final List<String> boxTexts = [
//     "Welcome to Sukr – your smart companion in managing diabetes.",
//     "Track your blood sugar levels daily and stay in control.",
//     "Get personalized health tips and insights for a better life.",
//   ];

//   Widget buildDots() {
//     return ValueListenableBuilder<int>(
//       valueListenable: currentPage,
//       builder: (context, current, child) {
//         return Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: List.generate(totalPages, (index) {
//             return AnimatedContainer(
//               duration: const Duration(milliseconds: 300),
//               margin: const EdgeInsets.symmetric(horizontal: 5),
//               width: current == index ? 16 : 8,
//               height: 8,
//               decoration: BoxDecoration(
//                 color: current == index ? const Color(0xFF5a5ea3) : Colors.grey,
//                 borderRadius: BorderRadius.circular(4),
//               ),
//             );
//           }),
//         );
//       },
//     );
//   }

//   Future<void> loadSavedLanguage() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? languageCode = prefs.getString('language') ?? 'en';
//     await LanguageService.changeLocale(languageCode);
//   }

//   Future<void> saveLanguage(String languageCode) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('language', languageCode);
//     await LanguageService.changeLocale(languageCode);
//   }

//   Future<void> checkIntro() async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     ischeked.value = sharedPreferences.getBool('intro') ?? false;
//     log('Intro checked: ${ischeked.value}');
//   }

//   void saveIntro() async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     await sharedPreferences.setBool('intro', true);
//   }

//   void checkUserLogin() async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     isLogged = sharedPreferences.getBool('isLoggedIn');
//     if (isLogged == true) {
//       Get.offAllNamed(RoutesString.homescreen);
//     } else {
//       Get.offAllNamed(RoutesString.login);
//     }
//   }

//   void network() {
//     ScaffoldMessenger.of(Get.context!).showSnackBar(
//       SnackBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         duration: const Duration(seconds: 3),
//         content: Container(
//           height: 50,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(12),
//             color: AppColors.white,
//           ),
//           child: const Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               SizedBox(width: 10),
//               Icon(
//                 Icons.error_outline,
//                 color: AppColors.defaultBlack,
//                 size: 30,
//               ),
//               SizedBox(width: 20),
//               BodyText1(
//                 title: 'No internet connection',
//                 color: AppColors.defaultBlack,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void checkNetwork() async {
//     List<ConnectivityResult> connectivityResult =
//         await Connectivity().checkConnectivity();

//     if (!connectivityResult.contains(ConnectivityResult.wifi) &&
//         !connectivityResult.contains(ConnectivityResult.mobile)) {
//       appTools.showAlertDialogTwoFun(
//         Get.context!,
//         content: "Turn on cellular data or use Wi-Fi \n to access data",
//         title: "No Internet Connection",
//         yes: () async {
//           if (Platform.isAndroid) {
//             await AppSettings.openAppSettingsPanel(
//               AppSettingsPanelType.internetConnectivity,
//             );
//           } else {
//             await openAppSettings();
//           }
//           Get.back();
//         },
//         no: () => Get.back(),
//       );
//       network();
//     }

//     Connectivity().onConnectivityChanged.listen((
//       List<ConnectivityResult> result,
//     ) {
//       if (!result.contains(ConnectivityResult.wifi) &&
//           !result.contains(ConnectivityResult.mobile)) {
//         appTools.showAlertDialogTwoFun(
//           Get.context!,
//           content: "Turn on cellular data or use Wi-Fi \n to access data",
//           title: "No Internet Connection",
//           yes: () => Get.back(),
//           no: () async {
//             if (Platform.isAndroid) {
//               await AppSettings.openAppSettingsPanel(
//                 AppSettingsPanelType.internetConnectivity,
//               );
//             } else {
//               await openAppSettings();
//             }
//             Get.back();
//           },
//         );

//         network();
//       }
//     });
//   }

//   // Start of Future-based Initialization Logic
//   Future<void> initialize() async {
//     await checkIntro();
//     await loadSavedLanguage();
//     checkNetwork(); // Ensure no blocking calls in onInit
//   }

//   @override
//   void onInit() async {
//     super.onInit();

//     // Use Future.delayed to wait for initialization
//     Future.delayed(const Duration(milliseconds: 500), () async {
//       // Ensure that initialize completes before navigating
//       await initialize();

//       // Now check user login state and navigate accordingly
//       final user = FirebaseAuth.instance.currentUser;
//       if (!ischeked.value) {
//         Get.offAllNamed(RoutesString.introScreen);
//       } else if (user == null) {
//         Get.offAllNamed(RoutesString.login);
//       } else {
//         Get.offAllNamed(RoutesString.homescreen);
//       }
//     });
//   }
// }

import 'dart:developer';
import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sukar/helper/theme/app_colors.dart';
import 'package:sukar/presintation/widgets/text/body_text1.dart';
import 'package:sukar/utils/routes/routes_string.dart';
import 'package:sukar/utils/tools.dart';

class AppSettingController extends GetxController {
  bool check = false;
  RxBool ischeked = false.obs;
  bool? isLogged;

  final PageController pageController = PageController();
  final ValueNotifier<int> currentPage = ValueNotifier<int>(0);
  final int totalPages = 3;

  final List<String> boxTexts = [
    "Welcome to Sukr – your smart companion in managing diabetes.",
    "Track your blood sugar levels daily and stay in control.",
    "Get personalized health tips and insights for a better life.",
  ];

  Widget buildDots() {
    return ValueListenableBuilder<int>(
      valueListenable: currentPage,
      builder: (context, current, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(totalPages, (index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              width: current == index ? 16 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: current == index ? Color(0xFF5a5ea3) : Colors.grey,
                borderRadius: BorderRadius.circular(4),
              ),
            );
          }),
        );
      },
    );
  }

  void checkNetwork() async {
    List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();
    if (!connectivityResult.contains(ConnectivityResult.wifi) &&
        !connectivityResult.contains(ConnectivityResult.mobile)) {
      appTools.showAlertDialogTwoFun(
        Get.context!,
        content: "Turn on cellular data or use WI-Fi \n to access data",
        title: "Turn on cellular data or use WI-Fi to",
        yes: () async {
          if (Platform.isAndroid) {
            await AppSettings.openAppSettingsPanel(
              AppSettingsPanelType.internetConnectivity,
            );
          } else {
            await openAppSettings();
          }

          Get.back();
        },
        no: () => Get.back(),
      );
      network();
    }
    Connectivity().onConnectivityChanged.listen((
      List<ConnectivityResult> connectivityResult,
    ) {
      if (!connectivityResult.contains(ConnectivityResult.wifi) &&
          !connectivityResult.contains(ConnectivityResult.mobile) &&
          !check) {
        appTools.showAlertDialogTwoFun(
          Get.context!,
          content: "Turn on cellular data or use WI-Fi \n to access data",
          title: "Turn on cellular data or use WI-Fi to",
          no: () async {
            if (Platform.isAndroid) {
              await AppSettings.openAppSettingsPanel(
                AppSettingsPanelType.internetConnectivity,
              );
            } else {
              await openAppSettings();
            }
            Get.back();
          },
          yes: () => Get.back(),
        );
        check = !check;
        network();
      }
    });
    checkPermissionAndWhatsAfterIt();
    Future.delayed(Duration(seconds: 4), () async {
      log('$user');
      if (ischeked.value == false) {
        Get.offAllNamed(RoutesString.introScreen);
      } else if (user == null ||
          !FirebaseAuth.instance.currentUser!.emailVerified) {
        Get.offAllNamed(RoutesString.login);
      } else {
        Get.offAllNamed(RoutesString.homescreen);
      }
    });
  }

  User? user = FirebaseAuth.instance.currentUser;

  void saveIntro() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool('intro', true);
  }

  void checkIntro() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    ischeked.value = sharedPreferences.getBool('intro') ?? false;
    log('${ischeked.value}');
  }

  void network() {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        duration: const Duration(seconds: 3),
        content: Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.white,
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 10),
              Icon(
                Icons.error_outline,
                color: AppColors.defaultBlack,
                size: 30,
              ),
              SizedBox(width: 20),
              BodyText1(
                title: 'No internet connection',
                color: AppColors.defaultBlack,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void checkPermissionAndWhatsAfterIt() async {
    PermissionStatus permissionStatus = await Permission.notification.status;
    if (permissionStatus != PermissionStatus.granted) {
      await Permission.notification.request();
    }
    permissionStatus = await Permission.notification.status;
    if (permissionStatus != PermissionStatus.granted) {
      AppSettings.openAppSettings(type: AppSettingsType.notification);
    }
    permissionStatus = await Permission.location.status;
    if (permissionStatus != PermissionStatus.granted) {
      await Permission.location.request();
    }
  }

  @override
  void onInit() {
    checkIntro();
    super.onInit();
  }
}
