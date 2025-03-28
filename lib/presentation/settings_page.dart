import 'dart:io';
import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readly/core/l10n/locale_keys.g.dart';
import 'package:readly/presentation/language_page.dart';
import 'package:readly/presentation/theme_settings_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:readly/core/utils/extensions/locale_extension.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late String _selectedLanguage;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final currentLocale = Localizations.localeOf(context);
    _selectedLanguage = getLanguageName(currentLocale);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title:
            Text(LocaleKeys.settings.locale, style: TextStyle(fontSize: 24.sp)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(LocaleKeys.general_settings.locale,
                style: TextStyle(
                  fontSize: 16.sp,
                )),
            SizedBox(height: 12.h),
            _buildSettingsCard([
              _buildSettingsTile(
                title: LocaleKeys.language_settings.locale,
                icon: Icons.language,
                value: _selectedLanguage,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const LanguageSettingsPage(),
                    ),
                  );
                },
              ),
              _buildSettingsTile(
                title: LocaleKeys.theme_settings.locale,
                icon: Icons.color_lens,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ThemeSettingsPage(),
                    ),
                  );
                },
              ),
              _buildSettingsTile(
                title: LocaleKeys.notification_settings.locale,
                icon: Icons.notifications_active_outlined,
                onTap: openNotificationSettings,
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsCard(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: List.generate(children.length * 2 - 1, (i) {
          if (i.isEven) return children[i ~/ 2];
          return Divider(height: 1, color: Colors.grey.shade300);
        }),
      ),
    );
  }

  Widget _buildSettingsTile({
    required String title,
    required IconData icon,
    VoidCallback? onTap,
    String? value,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        child: Row(
          children: [
            Icon(icon, color: Colors.blueAccent, size: 22.sp),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            if (value != null)
              Text(
                value,
                style: TextStyle(
                  fontSize: 13.sp,
                ),
              ),
            const Icon(Icons.arrow_forward_ios_rounded, size: 14),
          ],
        ),
      ),
    );
  }

  String getLanguageName(Locale locale) {
    switch (locale.languageCode) {
      case 'tr':
        return 'Türkçe';
      case 'en':
        return 'English';
      case 'es':
        return 'Español';
      default:
        return 'Bilinmiyor';
    }
  }

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
        debugPrint('Android intent error: $e');
      }
    } else if (Platform.isIOS) {
      await launchUrl(Uri.parse('app-settings:'));
    }
  }
}
