import 'package:flutter/material.dart';
import 'package:practice_project_flutter/l10n/locale_provider.dart';
import 'package:practice_project_flutter/share_pref/share_pref.dart';
import 'package:practice_project_flutter/widgets/theme_switch_toggle_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var language = ["english", "chinese", "hindi"];
  String dropdownvalue = "english";
  String? setLang;
  @override
  void initState() {
    SharePref.getString(SharePref.language).then((value) {
      print("language==>>$value");
      setLang = value;
      Provider.of<LocaleProvider>(context, listen: false)
          .setLocale(Locale(value.toString()));
      setState(() {});
    });
    // print("language==>>$lang");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var locale = Provider.of<LocaleProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0.0,
        title: Text("MediaTheming....",
            style: TextStyle(
              color: Theme.of(context).accentColor,
            )),
        actions: const [
          ThemeSwitchToggleButton(),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            width: 100,
            color: Colors.red,
            child: DropdownButton(
              // Initial Value
              value: dropdownvalue,

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: language.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) async {
                final prefs = await SharedPreferences.getInstance();
                prefs.clear();
                setState(() {
                  dropdownvalue = newValue!;
                  if (newValue == "english") {
                    locale.setLocale(Locale("en"));
                    SharePref.setString(SharePref.language, "en");
                  } else if (newValue == "chinese") {
                    locale.setLocale(Locale("zh"));
                    SharePref.setString(SharePref.language, "zh");
                  } else if (newValue == "hindi") {
                    locale.setLocale(Locale("hi"));
                    SharePref.setString(SharePref.language, "hi");
                  }
                });
              },
            ),
          ),
          Center(
            child: Container(
                child: Text(
              AppLocalizations.of(context)!.language,
              style: TextStyle(
                color: Theme.of(context).cardColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
        ],
      ),
    );
  }
}
