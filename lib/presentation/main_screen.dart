import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readly/application/bottom_nav/bottom_nav_cubit.dart';
import 'package:readly/presentation/books_page.dart';
import 'package:readly/presentation/favorites_page.dart';
import 'package:readly/presentation/settings_page.dart';
import 'package:readly/presentation/widgets/custom_bottom_nav_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, selectedIndex) {
        final pages = [
          const BooksPage(),
          const FavoritesPage(),
          const SettingsPage(),
        ];

        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: pages[selectedIndex],
          bottomNavigationBar: CustomBottomNavigationBar(
            selectedIndex: selectedIndex,
            onTap: (index) => context.read<BottomNavCubit>().changeTab(index),
          ),
        );
      },
    );
  }
}
