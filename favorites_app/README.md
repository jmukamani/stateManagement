Favorites Management App
A simple Flutter application demonstrating state management using the Provider package. The app allows users to add products to a favorites list, view their favorite items, and remove them as needed.

## Features

_Product List Screen_

Displays a list of products.
Add products to favorites using a heart icon.
Favorites Screen

_View all favorite items._
Remove items from favorites using a delete icon.

_State Management_

Uses the Provider package to manage the state of the favorites list.
Getting Started

## Prerequisites

Flutter SDK
Dart SDK (comes with Flutter)

## Installation

Clone the repository

cd favorites_app

## Install dependencies:

flutter pub get

## Run the app:

flutter run

## File Structure

lib/
├── main.dart # Entry point of the app
├── favorites.dart # Model for managing favorites
└── favorites_screen.dart # Screen for viewing and managing favorites

# Implementation Details

1. State Management
   The app uses the Provider package to manage the state of the favorites list.
   The Favorites class extends ChangeNotifier to notify widgets when the list changes.
2. Product List Screen
   Displays a list of products in a ListView.
   Users can add products to favorites using an IconButton.
3. Favorites Screen
   Displays the list of favorite items using a ListView.
   Users can remove items from favorites with a delete button.

### Code Highlights

Provider Integration
Wrap the MaterialApp with ChangeNotifierProvider in main.dart:

ChangeNotifierProvider(
create: (context) => Favorites(),
child: MaterialApp(
home: ProductListScreen(),
),
);
Adding/Removing Favorites
Use notifyListeners() to update the UI when items are added or removed:

dart
Copy code
void addItem(String item) {
if (!\_items.contains(item)) {
\_items.add(item);
notifyListeners();
}
}

void removeItem(String item) {
if (\_items.contains(item)) {
\_items.remove(item);
notifyListeners();
}
}

# Dependencies

Flutter SDK
provider: ^6.0.5
