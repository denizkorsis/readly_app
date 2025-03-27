// 1. SettingsPage ve LanguageSettingsPage sayfalarını oluştur
// 2. BooksPage'e ayar butonunu ekle

// --- settings_page.dart ---
import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:readly/presentation/language_page.dart';
import 'package:readly/presentation/theme_settings_page.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  Future<void> openNotificationSettings() async {
    if (Platform.isAndroid) {
      final intent = AndroidIntent(
        action: 'android.settings.APP_NOTIFICATION_SETTINGS',
        arguments: <String, dynamic>{
          'android.provider.extra.APP_PACKAGE': 'com.example.readly',
        },
      );

      try {
        await intent.launch();
      } on PlatformException catch (e) {
        debugPrint('❌ Android intent error: $e');
      }
    } else if (Platform.isIOS) {
      // iOS 10+ için direkt ayarlar sayfasına yönlendirebiliriz
      // Ama bildirim ayarlarının olduğu yere tam gitmek mümkün değil.
      await launchUrl(Uri.parse('app-settings:'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ayarlar')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Dil Ayarları'),
            leading: const Icon(Icons.language),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const LanguageSettingsPage()),
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Tema Ayarları'),
            leading: const Icon(Icons.color_lens),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ThemeSettingsPage()),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Bildirim Ayarları'),
            leading: const Icon(Icons.notifications_active),
            onTap: openNotificationSettings,
          ),
        ],
      ),
    );
  }
}
