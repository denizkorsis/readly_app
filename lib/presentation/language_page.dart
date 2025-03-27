// --- language_settings_page.dart ---
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:readly/presentation/settings_page.dart';

class LanguageSettingsPage extends StatelessWidget {
  const LanguageSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dil Seçimi')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Türkçe'),
            onTap: () {
              context.setLocale(const Locale('tr'));
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('English'),
            onTap: () {
              context.setLocale(const Locale('en'));
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Español'),
            onTap: () {
              context.setLocale(const Locale('es'));
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
