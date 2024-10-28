import 'package:Islami/presentation_layer/home_page/screens/hadith_details_page.dart';
import 'package:Islami/presentation_layer/home_page/screens/home_page.dart';
import 'package:Islami/presentation_layer/onboarding/screens/onboarding.dart';
import 'package:Islami/presentation_layer/splash_screen/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  // Define your route names as static constants
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String home = '/home';
  static const String quran = '/quran';
  static const String hadith = '/hadith';
  //static const String hadithDetails = '/hadith_details';


  // Method to get the routes map
  static Map<String, WidgetBuilder> routes(Function(Locale) setLocale,) {
    return {
        '/splash': (context) => SplashScreen(setLocale:setLocale ),
        '/onboarding': (context) => OnboardingScreen(setLocale: setLocale),
        '/home': (context) =>  HomePage(),
    //    '/hadith_details':(context) =>  HadithDetailsPage(hadithText: ,),
    };
  }
}
