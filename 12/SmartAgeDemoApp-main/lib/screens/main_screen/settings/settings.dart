import 'package:flutter/material.dart';
import 'package:smartage_care/i18n/strings.g.dart';
import 'package:smartage_care/screens/welcome_screen/welcome_screen.dart';
import 'package:smartage_care/screens/main_screen/home/home_screen.dart';
import 'package:smartage_care/screens/main_screen/dashboard.dart';
class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}
class _SettingsState extends State<Settings> {
  String selectedValue = '';
  String tempValue = '';
  @override
  void initState() {
    super.initState();
    if (LocaleSettings.currentLocale?.languageCode == 'en') {
      selectedValue = t.Settings.tLang[0];
    } else if (LocaleSettings.currentLocale?.languageCode == 'zh') {
      selectedValue = t.Settings.tLang[1];
    } else {
      selectedValue = t.Settings.tLang[2];
    }
  }
  void showSaveConfirmationDialog(VoidCallback onSave) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(t.Settings.tSave),
          content: Text(t.Settings.tSaveDes),
          actions: [
            TextButton(
              child: Text(t.tGlobal.tYes),
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                onSave(); // Call the save functionality
              },
            ),
            TextButton(
              child: Text(t.tGlobal.tNo),
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }
  void saveSelection() {
    // Custom save functionality
    // Update the locale and selected value
    String newValue = tempValue;
    if (newValue != null) {
      LocaleSettings.setLocaleRaw(t.locales.keys.firstWhere(
        (k) => t.locales[k] == newValue,
      ));
    }
    // Additional save logic
    /* LocaleSettings.setLocaleRaw(t.locales.keys.firstWhere(
      (k) => t.locales[k] == newValue,
    ));*/
    // Perform any necessary updates
    setState(() {
      selectedValue = tempValue;
    });
    // Navigate to the dashboard or perform other actions
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Dashboard(),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.Settings.tSettings),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${t.Settings.tLangText}:'),
            DropdownButton<String>(
              value: selectedValue,
              items: <String>[
                t.Settings.tLang[0],
                t.Settings.tLang[1],
                t.Settings.tLang[2],
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    tempValue = newValue;
                  });
                  showSaveConfirmationDialog(saveSelection);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}