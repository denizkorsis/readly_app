// lib/application/locale/language_cubit.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(const Locale('tr'));

  void changeLanguage(Locale locale) {
    emit(locale);
  }
}
