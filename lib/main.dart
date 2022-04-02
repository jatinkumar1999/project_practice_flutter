import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:practice_project_flutter/app/app.dart';
import 'package:practice_project_flutter/l10n/l10n.dart';
import 'package:practice_project_flutter/l10n/locale_provider.dart';
import 'package:practice_project_flutter/provider/theme_provider.dart';
import 'package:practice_project_flutter/provider/user_controller.dart';
import 'package:practice_project_flutter/theming/my_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'fadding_edge_list/fadding_edge__list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (_) => ThemeProvider(),
        ),
        ChangeNotifierProvider<LocaleProvider>(
          create: (_) => LocaleProvider(),
        ),

        ChangeNotifierProvider<UserController>(
          create: (_) => UserController(),
        ),
      ],
      child: Consumer<LocaleProvider>(
        builder: (context, appLocale, child) {
          return Consumer<ThemeProvider>(
            builder: (context, themeMode, child) {
              return MaterialApp(
                title: 'Theme Practice',
                debugShowCheckedModeBanner: false,
                navigatorKey: App.materialkey,
                // themeMode: ThemeMode.system,
                themeMode: themeMode.thememode,
                theme: MyTheme.light,
                darkTheme: MyTheme.dark,
                locale: appLocale.locale,
                supportedLocales: L10n.all,

                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                home: FadingListViewWidget(),
              );
            },
          );
        },
      ),
    );
  }
}
