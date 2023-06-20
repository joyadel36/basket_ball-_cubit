import 'package:basketballcounter/applocal.dart';
import 'package:basketballcounter/cubit/counntercubit.dart';
import 'package:basketballcounter/pointcounter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
       MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          AppLocale.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en', ''),
          Locale('ar', ''),
        ],
        localeResolutionCallback: (currentlang, supportlang) {
          if (currentlang != null) {
            for (Locale locallang in supportlang) {
              if (locallang.languageCode == currentlang.languageCode) {
                return locallang;
              }
            }
          } else {
            return supportlang.first;
          }
        },
        home: BlocProviderpointsCounter(),
      );
  }
}


