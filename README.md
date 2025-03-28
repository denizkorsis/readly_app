# One Dose Health - Flutter Case

Hello! This project was developed as part of a Flutter case study given by **One Dose Health**. As a junior Flutter developer, I did my best to complete the task and learned a lot along the way 😊

---

##  Project Goal

The goal was to develop a mobile application where users can:

-  Browse a list of books
-  View detailed information
-  Add or remove books from favorites
-  Set reminders for favorite books
-  Use the app in offline mode

Additionally, the app was expected to support multiple languages and theme switching.

---

##  Screens

- **Home Page** — Displays a list of books and a search bar
- **Book Detail Page** — Shows detailed information about a selected book
- **Favorites Page** — Lists the user's favorite books
- **Settings Page** — Language and theme selection

---

##  What I Learned & Implemented

###  API Integration

Books are fetched from:  
`https://stephen-king-api.onrender.com/api/books`  
I used the `dio` package to build a simple service layer.

###  Caching with Hive

Once books are fetched from the API, they are stored locally using Hive.  
This allows the app to work offline.

###  Favorite Feature

When a user taps the favorite icon, the book is added or removed from a Hive box called `favoritesBox`.

###  Local Notifications

Daily reminder notifications are set for favorite books — scheduled to appear at 8:00 AM.

###  Multi-Language Support

The app supports 3 languages:  
Turkish, English, Spanish  
Implemented using the `easy_localization` package.  
Users can change the language from the settings page.

### Theme Support

Light, dark, and system themes are available.  
Controlled via a custom `ThemeCubit`.

### State Management

- `BookFavoriteCubit`: Handles favorite actions
- `BooksBloc`: Fetches books from the API and filters search results

### Unit Testing
- Tested `BookApiService` (with mocked Dio responses)

---

##  Tech Stack

- Flutter (3.19.3)
- Bloc/Cubit (flutter_bloc)
- Hive for local storage
- Dio for networking
- easy_localization for i18n
- flutter_local_notifications for scheduling
- flutter_screenutil for responsive design
- mockito & bloc_test for unit testing

---


