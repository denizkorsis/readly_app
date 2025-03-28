import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readly/application/books/books_bloc.dart';
import 'package:readly/application/books/books_event.dart';
import 'package:readly/application/books/books_state.dart';
import 'package:readly/core/l10n/locale_keys.g.dart';
import 'package:readly/data/datasources/book_api_service.dart';
import 'package:readly/data/repositories/book_repository_impl.dart';
import 'package:readly/presentation/widgets/book_card.dart';
import 'package:readly/presentation/widgets/custom_app_bar.dart';
import 'package:readly/core/utils/extensions/locale_extension.dart';

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
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: Column(
              children: [
                CustomAppBar(
                  title: LocaleKeys.books.locale,
                ),
                Padding(
                  padding: EdgeInsets.all(12.r),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      hintText: LocaleKeys.search_books.locale,
                      hintStyle: TextStyle(
                        fontSize: 14.sp,
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(10.r),
                        child: Icon(Icons.search, size: 20.sp),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (value) {
                      context.read<BooksBloc>().add(SearchBooks(value));
                    },
                  ),
                ),
                Expanded(
                  child: BlocBuilder<BooksBloc, BooksState>(
                    builder: (context, state) {
                      if (state is BooksLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is BooksLoaded) {
                        return GridView.builder(
                          padding: const EdgeInsets.all(12),
                          itemCount: state.books.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 0.75,
                          ),
                          itemBuilder: (context, index) {
                            final book = state.books[index];
                            return BookCard(book: book);
                          },
                        );
                      } else if (state is BooksError) {
                        return Center(child: Text(state.message));
                      } else {
                        return Center(
                          child: Text(LocaleKeys.books_load_error.locale),
                        );
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
