import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readly/application/locale/language_cubit.dart';
import 'package:readly/core/theme/colors.dart';

class LanguageSettingsPage extends StatefulWidget {
  const LanguageSettingsPage({super.key});

  @override
  State<LanguageSettingsPage> createState() => _LanguageSettingsPageState();
}

class _LanguageSettingsPageState extends State<LanguageSettingsPage> {
  Locale _selectedLocale = const Locale('tr');

  final List<Map<String, dynamic>> _languages = [
    {"name": "Türkçe", "flag": "🇹🇷", "locale": const Locale('tr')},
    {"name": "English", "flag": "🇺🇸", "locale": const Locale('en')},
    {"name": "Español", "flag": "🇪🇸", "locale": const Locale('es')},
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _selectedLocale = context.locale;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title: Text(
          'Dil Seçimi',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            Text(
              "Lütfen bir dil seçin",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12.h),
            Expanded(
              child: ListView.builder(
                itemCount: _languages.length,
                itemBuilder: (context, index) {
                  final language = _languages[index];

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedLocale = language["locale"] as Locale;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10.h),
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.w, vertical: 16.h),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.softBlack),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Row(
                        children: [
                          Text(
                            language['flag'] as String,
                            style: TextStyle(fontSize: 22.sp),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            language['name'] as String,
                            style: TextStyle(fontSize: 14.sp),
                          ),
                          const Spacer(),
                          if (_selectedLocale == language['locale'])
                            const Icon(
                              Icons.radio_button_checked,
                              color: Colors.blue,
                            )
                          else
                            const Icon(
                              Icons.radio_button_off,
                              color: Colors.grey,
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  elevation: const WidgetStatePropertyAll(2),
                  backgroundColor: WidgetStateColor.resolveWith(
                    (states) => states.contains(WidgetState.disabled)
                        ? AppColors.grey.withOpacity(0.5)
                        : AppColors.blue,
                  ),
                  padding: WidgetStatePropertyAll(
                    EdgeInsets.symmetric(vertical: 10.h),
                  ),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  textStyle: WidgetStatePropertyAll(
                    TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                onPressed: () {
                  context.read<LanguageCubit>().changeLanguage(_selectedLocale);
                  context.setLocale(_selectedLocale);
                  Navigator.pop(context, true);
                },
                child: Text(
                  'Kaydet',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
