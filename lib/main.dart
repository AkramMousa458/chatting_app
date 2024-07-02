import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wafed/Screens/Apartment_page.dart';
import 'package:wafed/Screens/Chat/chat_screen.dart';
import 'package:wafed/Screens/Chat/people_screen.dart';
import 'package:wafed/Screens/home_page.dart';
import 'package:wafed/Screens/hospitals/Internal_page.dart';
import 'package:wafed/Screens/hospitals/hospital_page.dart';
import 'package:wafed/Screens/hospitals/surgery_page.dart';
import 'package:wafed/Screens/log_in_page.dart';
import 'package:wafed/Screens/restaurant/restaurant_page.dart';
import 'package:wafed/cubits/chat_cubit/chat_cubit.dart';
import 'package:wafed/cubits/login_cubit/login_cubit.dart';
import 'package:wafed/cubits/register_cubit/register_cubit.dart';
import 'package:wafed/firebase_options.dart';
import 'Screens/Colleges/Colleges_page.dart';
import 'Screens/Complaints_and_Inquiries.dart';
import 'Screens/Entertainement/Entertainement_page.dart';
import 'Screens/hospitals/Hospitals_page.dart';
import 'Screens/hospitals/dentistry_page.dart';
import 'localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Wafed());
  // runApp(DevicePreview(builder: (context) => Wafed()));
}

class Wafed extends StatelessWidget {
  Wafed({Key? Key}) : super(key: Key);

  final localizationController = Get.put(LocalizationController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(
        init: localizationController,
        builder: (LocalizationController controller) {
          return ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => LoginCubit(),
                ),
                BlocProvider(
                  create: (context) => RegisterCubit(),
                ),
                BlocProvider(
                  create: (context) => ChatCubit(),
                )
              ],
              child: MaterialApp(
                routes: {
                  'Log_in_Page': (context) => Log_in_Page(),
                  'lib/Screens/restaurant/restaurant_page.dart': (context) =>
                      restaurant_Page(),
                  'lib/Screens/Hospitals_page.dart': (context) =>
                      Hospital_Page(),
                  'lib/Screens/hospitals/dentistry_page.dart': (context) =>
                      dentistry_page(),
                  'lib/Screens/hospitals/genetics_page.dart': (context) =>
                      genetics_page(),
                  'lib/Screens/hospitals/neurology_page.dart': (context) =>
                      neurology_page(),
                  'lib/Screens/hospitals/surgery_page.dart': (context) =>
                      surgery_page(),
                  'lib/Screens/Entertainement/Entertainement_page.dart':
                      (context) => Entertainement_page(),
                  'lib/Screens/Apartment_page.dart': (context) =>
                      Apartment_page(),
                  "lib/Screens/Colleges/Colleges_page.dart": (context) =>
                      Colleges_page(),
                  "lib/Screens/Complaints_and_Inquiries.dart": (context) =>
                      Complaints_and_Inquiries(),
                  "lib/Screens/Chat/people_screen.dart": (context) =>
                      PeopleScreen(),
                  ChatScreen.id: (context) => ChatScreen(),
                },
                builder: DevicePreview.appBuilder,

                debugShowCheckedModeBanner: false,

                locale: controller.currentLanguage != ''
                    ? Locale(controller.currentLanguage, '')
                    : null,

                localeResolutionCallback:
                    LocalizationService.localeResolutionCallBack,
                supportedLocales: LocalizationService.supportedLocales,
                localizationsDelegates:
                    LocalizationService.localizationsDelegate,
                home: homepage(),
                // localizationsDelegates: [
                //   // S.delegate,

                //   GlobalMaterialLocalizations.delegate,
                //   GlobalWidgetsLocalizations.delegate,
                //   GlobalCupertinoLocalizations.delegate,
                // ],
                // supportedLocales: [
                //   Locale("en", ""),
                //   Locale("ar", ""),
                //   // Add more locales as needed
                // ],
                // locale: Locale("en", ""),
                // localeResolutionCallback: (currentLang, supportLang) {
                //   if (currentLang != null) {
                //     for (Locale locale in supportLang) {
                //       if (locale.languageCode == currentLang.languageCode) {
                //         return currentLang;
                //       }
                //     }
                //   }
                //   return supportLang.first;
                // },
              ),
            ),
          );
        });
  }
}
