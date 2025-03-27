import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:readly/application/theme/theme_cubit.dart';
import 'package:readly/core/notifications/notification_service.dart';
import 'package:readly/presentation/book_detail_page.dart';
import 'presentation/books_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:readly/domain/entities/book.dart'; // BookAdapter için gerekli

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
    MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
      ],
      child: EasyLocalization(
        supportedLocales: const [Locale('tr'), Locale('en'), Locale('es')],
        path: 'assets/lang',
        fallbackLocale: const Locale('tr'),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return MaterialApp(
          navigatorKey: navigatorKey,
          title: 'Readly',
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: themeMode,
          home: const BooksPage(),
        );
      },
    );
  }
}
