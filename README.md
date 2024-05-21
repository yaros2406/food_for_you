###Food For You###

#Overview#

"Food For You" is a cross-platform application developed using Flutter that allows users to order food from a restaurant’s menu.
The app operates on Android, iOS, and web browsers, utilizing a common codebase.

#Features#

 - Display a list of dishes fetched from JSON data.
 - Add items to the cart with quantity selection.
 - View and manage items in the cart.
 - Place an order with user name input.
 - Show a confirmation screen upon successful order placement with an order number and a thank you note.
 - Custom splash screen with animation.

#Customization#

 - CustomLottieAnimation
File: custom_anim_widgets.dart
Purpose: Displays a Lottie animation with specified asset path and fit.
 - ConfirmationPopup
File: custom_dialog_widget.dart
Purpose: Shows the order confirmation popup dialog with transitions to the success screen after a delay.
 - showImageGallery
File: show_image.dart
Purpose: Displays a gallery of images that can be viewed in fullscreen with page view.
 - CartButton
File: custom_image_widgets.dart
Purpose: Displays a floating action button with a shopping cart icon and a badge indicating the number of items in the cart.
 - ImageCarousel.
File: custom_image_widgets.dart
Purpose: Displays a carousel slider for images with tap functionality to show the image gallery.

#Project Structure#

lib/
│
├── data/
│   ├── model/
│   │   └── menu_item.dart
│   ├── provider/
│   │   └── cart_provider.dart
│   ├── repository/
│   │   └── menu_repository.dart
│   └── di/
│       └── locator.dart
│
├── presentation/
│   ├── screens/
│   │   ├── add_to_cart_screen.dart
│   │   ├── cart_list_screen.dart
│   │   ├── menu_list_screen.dart
│   │   ├── order_placement_screen.dart
│   │   ├── order_success_screen.dart
│   │   └── splash_screen.dart
│   │
│   └── utils/
│       ├── show_image.dart
│       ├── show_toast.dart
│       ├── strings.dart
│       ├── theme.dart
│
│   └── widgets/
│       ├── custom_anim_widgets.dart
│       ├── custom_dialog_widget.dart
│       ├── custom_image_widgets.dart
│
├── main.dart

#State Management#

The state management in this application is handled using the Provider package.
The CartProvider is used to manage the state of the cart throughout the application.

#Setup and Installation#

Prerequisites
 - Flutter SDK: Install Flutter
 - Dart SDK
 - Android Studio or Xcode for mobile development
Installation
 - Clone the repository:
   git clone https://github.com/yaros2406/food_for_you.git
   cd food_for_you
 - Get the dependencies:
   flutter pub get

 #Running the App#
  - Android/IOS
   Ensure that an Android/IOS device is connected, or an emulator is running.
   Run the following command: flutter run
 - Web
   Ensure that a web browser is installed.
   Run the following command: flutter run -d chrome
