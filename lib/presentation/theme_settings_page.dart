import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readly/application/theme/theme_cubit.dart';

class ThemeSettingsPage extends StatelessWidget {
  const ThemeSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tema Ayarları')),
      body: Column(
        children: [
          ListTile(
            title: const Text('Açık Tema'),
            leading: const Icon(Icons.light_mode),
            onTap: () => context.read<ThemeCubit>().setLightTheme(),
          ),
          ListTile(
            title: const Text('Koyu Tema'),
            leading: const Icon(Icons.dark_mode),
            onTap: () => context.read<ThemeCubit>().setDarkTheme(),
          ),
          ListTile(
            title: const Text('Sistem Teması'),
            leading: const Icon(Icons.phone_android),
            onTap: () => context.read<ThemeCubit>().setSystemTheme(),
          ),
        ],
      ),
    );
  }
}
