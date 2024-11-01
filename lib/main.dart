import 'package:captain11/providers/exercise_provider.dart';
import 'package:captain11/screen/Onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:captain11/screen/main_screens/HomePage.dart';
import 'package:captain11/helpers/consts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:captain11/providers/auth_provider.dart';
import 'package:captain11/providers/base_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
  Intl.defaultLocale = 'en_GB';

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BaseProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()..initilazAuthProvider()),
        ChangeNotifierProvider(create: (_) => ExerciseProvider()),
      ],
      child: MaterialApp(
        locale: const Locale('ar', ''),
        supportedLocales: [
          const Locale('en', ''),
          const Locale('ar', ''),
        ],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale?.languageCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(),
          appBarTheme: AppBarTheme(
            backgroundColor: mainColor,
            titleTextStyle: GoogleFonts.changa(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            iconTheme: IconThemeData(color: Colors.white),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: mainColor,
              textStyle: GoogleFonts.changa(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          textTheme: TextTheme(
            bodyLarge: GoogleFonts.changa(),
            bodyMedium: GoogleFonts.changa(),
            displayLarge:
                GoogleFonts.changa(fontSize: 32, fontWeight: FontWeight.bold),
            titleLarge:
                GoogleFonts.changa(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        home: OnboardingScreen(),
      ),
    );
  }
}
