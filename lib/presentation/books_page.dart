import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readly/application/books/books_bloc.dart';
import 'package:readly/application/books/books_event.dart';
import 'package:readly/application/books/books_state.dart';
import 'package:readly/core/l10n/locale_keys.g.dart';
import 'package:readly/core/notifications/notification_service.dart';
import 'package:readly/domain/repositories/book_repository.dart';
import 'package:readly/data/datasources/book_api_service.dart';
import 'package:readly/data/repositories/book_repository_impl.dart';
import 'package:readly/presentation/book_detail_page.dart';
import 'package:readly/presentation/favorites_page.dart';
import 'package:readly/core/utils/extensions/locale_extension.dart';
import 'package:readly/presentation/settings_page.dart';

class BooksPage extends StatelessWidget {
  const BooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final apiService = BookApiService();
        final repository = BookRepositoryImpl(apiService: apiService);
        return BooksBloc(repository: repository)..add(FetchBooks());
      },
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text(LocaleKeys.title.locale),
              actions: [
                IconButton(
                  icon: const Icon(Icons.favorite),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const FavoritesPage()),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SettingsPage()),
                    );
                  },
                ),
              ],
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Kitap ara...',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      context.read<BooksBloc>().add(SearchBooks(value));
                    },
                  ),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: BlocBuilder<BooksBloc, BooksState>(
                    builder: (context, state) {
                      if (state is BooksLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is BooksLoaded) {
                        return ListView.builder(
                          itemCount: state.books.length,
                          itemBuilder: (context, index) {
                            final book = state.books[index];
                            return ListTile(
                              title: Text(book.title),
                              subtitle:
                                  Text('${book.year} - ${book.publisher}'),
                              trailing: Text('${book.pages} sayfa'),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => BookDetailPage(book: book),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      } else if (state is BooksError) {
                        return Center(child: Text(state.message));
                      } else {
                        return const Center(
                            child: Text('Kitaplar yüklenemedi.'));
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
