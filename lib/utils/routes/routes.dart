import 'package:get/get.dart';
import 'package:sukar/presintation/binding/app_settings_binding.dart';
import 'package:sukar/presintation/binding/auth_binding.dart';
import 'package:sukar/presintation/binding/chat_binding.dart';
import 'package:sukar/presintation/binding/parents_binding.dart';
import 'package:sukar/presintation/view/Exercise/exercise_page3.dart';
import 'package:sukar/presintation/view/add_dose_of_insulin.dart';
import 'package:sukar/presintation/view/auth/child_profile.dart';
import 'package:sukar/presintation/view/auth/login.dart';
import 'package:sukar/presintation/view/auth/signup.dart';
import 'package:sukar/presintation/view/change_password_page.dart';
import 'package:sukar/presintation/view/chat_list_screen.dart';
import 'package:sukar/presintation/view/chat_screen.dart';
import 'package:sukar/presintation/view/chatpot_screen.dart';
import 'package:sukar/presintation/view/child_info.dart';
import 'package:sukar/presintation/view/child_personal_profile_page.dart';
import 'package:sukar/presintation/view/deactivate_account_page.dart';
import 'package:sukar/presintation/view/emergency_instructions_page.dart';
import 'package:sukar/presintation/view/Exercise/exercise_page.dart';
import 'package:sukar/presintation/view/Exercise/exercise_page2.dart';
import 'package:sukar/presintation/view/high_blood_sugar_page.dart';
import 'package:sukar/presintation/view/home_screen.dart';
import 'package:sukar/presintation/view/intro_screen.dart';
import 'package:sukar/presintation/view/loss_of_consciousness_page.dart';
import 'package:sukar/presintation/view/low_blood_sugar_page.dart';
import 'package:sukar/presintation/view/meal_management_page.dart';
import 'package:sukar/presintation/view/medication_management_page.dart';
import 'package:sukar/presintation/view/personala_ccount_settings.dart';
import 'package:sukar/presintation/view/privacy_policy_page.dart';
import 'package:sukar/presintation/view/request_help_page.dart';
import 'package:sukar/presintation/view/setting_screen.dart';
import 'package:sukar/presintation/view/share_child_profile.dart';
import 'package:sukar/presintation/view/splash_screen.dart';
import 'package:sukar/presintation/view/who_am_i.dart';
import 'package:sukar/utils/routes/routes_string.dart';

List<GetPage<dynamic>>? pages = [
  GetPage(
    name: RoutesString.splashScreen,
    page: () => SplashScreen(),
    binding: AppSettingsBinding(),
  ),
  GetPage(
    name: RoutesString.introScreen,
    page: () => IntroScreen(),
    binding: AppSettingsBinding(),
  ),
  GetPage(
    name: RoutesString.login,
    page: () => LoginPage(),
    binding: AuthBinding(),
  ),
  GetPage(
    name: RoutesString.signUp,
    page: () => Signup(),
    binding: AuthBinding(),
  ),
  GetPage(
    name: RoutesString.childInfo,
    page: () => ChildInfo(),
    binding: ParentsBinding(),
  ),
  GetPage(
    name: RoutesString.childProfile,
    page: () => ChildProfile(),
    binding: ParentsBinding(),
  ),
  GetPage(name: RoutesString.shareProfile, page: () => ShareChildProfilePage()),
  GetPage(
    name: RoutesString.userType,
    page: () => UserType(),
    binding: AuthBinding(),
  ),
  GetPage(name: RoutesString.homescreen, page: () => HomeScreen()),
  GetPage(name: RoutesString.settings, page: () => SettingScreen()),
  GetPage(
    name: RoutesString.profile,
    page: () => PersonalAccountSettingsPage(),
  ),
  GetPage(name: RoutesString.changePassword, page: () => ChangePasswordPage()),
  GetPage(
    name: RoutesString.deactivateAccount,
    page: () => DeactivateAccountPage(),
  ),
  GetPage(
    name: RoutesString.childpersonalprofilepage,
    page: () => ChildPersonalProfilePage(),
  ),
  GetPage(
    name: RoutesString.medicationmanagementpage,
    page: () => MedicationManagementPage(),
  ),
  GetPage(
    name: RoutesString.mealmanagementpage,
    page: () => MealManagementPage(),
  ),
  GetPage(
    name: RoutesString.emergencyinstructionspage,
    page: () => EmergencyHomePage(),
  ),
  GetPage(
    name: RoutesString.lowbloodsugarpage,
    page: () => LowBloodSugarPage(),
  ),
  GetPage(
    name: RoutesString.highbloodsugarpage,
    page: () => HighBloodSugarPage(),
  ),
  GetPage(
    name: RoutesString.lossofconsciousnesspage,
    page: () => LossOfConsciousnessPage(),
  ),
  GetPage(name: RoutesString.requestforhelppage, page: () => RequestHelpPage()),
  GetPage(
    name: RoutesString.exercisePage,
    page: () => ExercisePage(),
    binding: ParentsBinding(),
  ),
  GetPage(
    name: RoutesString.exercisePage2,
    page: () => ExercisePage2(),
    binding: ParentsBinding(),
  ),
  GetPage(
    name: RoutesString.exercisePage3,
    page: () => ExercisePage3(),
    binding: ParentsBinding(),
  ),
  GetPage(
    name: RoutesString.chatScreen,
    page: () => ChatScreen(),
    binding: ChatBinding(),
  ),
  GetPage(
    name: RoutesString.chatListScreen,
    page: () => ChatListScreen(),
    binding: ChatBinding(),
  ),
  GetPage(
    name: RoutesString.chatPotScreen,
    page: () => ChatpotScreen(),
    binding: ChatBinding(),
  ),
  GetPage(
    name: RoutesString.privacypolicypage,
    page: () => PrivacyPolicyPage(),
    // binding: ChatBinding(),
  ),
  GetPage(
    name: RoutesString.addDoseOfInsulinPage,
    page: () => AddDoseOfInsulin(),
    binding: ParentsBinding(),
  ),
];
