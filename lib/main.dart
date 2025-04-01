import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // EKLENDİ
import 'package:path_provider/path_provider.dart';
import 'package:readly/application/bottom_nav/bottom_nav_cubit.dart';
import 'package:readly/application/locale/language_cubit.dart';
import 'package:readly/application/theme/theme_cubit.dart';
import 'package:readly/core/notifications/notification_service.dart';
import 'package:readly/domain/entities/book.dart';
import 'package:readly/presentation/book_detail_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:readly/presentation/splash_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  await NotificationService.init(
    onNotificationClick: (payload) {
      final bookId = int.tryParse(payload ?? '');
      if (bookId != null) {
        navigatorKey.currentState?.push(
          MaterialPageRoute(
            builder: (_) => BookDetailPage.fromBookId(bookId),
          ),
        );
      }
    },
  );
  Hive.registerAdapter(BookAdapter());
  await Hive.openBox<Book>('favoritesBox');

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('tr'), Locale('en'), Locale('es')],
      path: 'assets/lang',
      fallbackLocale: const Locale('tr'),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => ThemeCubit()),
          BlocProvider(create: (_) => LanguageCubit()),
          BlocProvider(create: (_) => BottomNavCubit()),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        return BlocBuilder<LanguageCubit, Locale>(
          builder: (context, locale) {
            return BlocBuilder<ThemeCubit, ThemeData>(
              builder: (context, theme) {
                return MaterialApp(
                  navigatorKey: navigatorKey,
                  debugShowCheckedModeBanner: false,
                  title: 'Readly',
                  locale: context.locale,
                  supportedLocales: context.supportedLocales,
                  localizationsDelegates: context.localizationDelegates,
                  theme: theme,
                  darkTheme: ThemeData.dark(),
                  home: const SplashScreen(),
                );
              },
            );
          },
        );
      },
    );
  }
}
