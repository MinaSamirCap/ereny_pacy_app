import 'package:ereny_pacy_app/khadem/home_screen.dart';
import 'package:flutter/material.dart';

import 'package:ereny_pacy_app/ui/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'agbya/agbya_home_screen.dart';
import 'ui/login_page.dart';
import 'utils/lang/app_localization.dart';

const String APP_NAME = 'Ereny Pacy';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ereny Pacy',
  supportedLocales: [Locale(CODE_EN, CON_US), Locale(CODE_AR, CON_EG)],

        /// these delegates make sure that the localization data for the proper
        /// language is loaded ...
        localizationsDelegates: [
          /// A class which loads the translations from JSON files
          AppLocalizations.delegate,

          /// Built-in localization of basic text for Material widgets
          GlobalMaterialLocalizations.delegate,

          /// Built-in localization for text direction LTR/RTL
          GlobalWidgetsLocalizations.delegate,
        ],

        /// Returns a locale which will be used by the app
        localeResolutionCallback: (locale, supportedLocales) {
          /// Check if the current device locale is in our supported locales list
          /// That we added previously --> supportedLocales: [Locale('en', 'US'), Locale('ar', 'EG')],

          for (var localItem in supportedLocales) {
            if (localItem.languageCode == locale.languageCode &&
                localItem.countryCode == locale.countryCode) {
              return localItem;
            }
          }

          /// If the locale of the device is not supported, use the first one
          /// from the list (English, in this case).
          return supportedLocales.first;
        },
        debugShowCheckedModeBanner: false,      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        HomeScren.ROUTE_NAME: (ctx) => HomeScren(),
        AgbyaHomePage.ROUTE_NAME: (ctx) => AgbyaHomePage(),
        KhademHomePage.ROUTE_NAME: (ctx) => KhademHomePage()
      },
      home: HomeScren(),
    );
  }
}

class DummyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(APP_NAME),
      ),
      body: Center(child: Text(APP_NAME)),
    );
  }
}
