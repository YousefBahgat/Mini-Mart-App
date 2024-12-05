
# Mini Shop App

A Flutter-based Mini Shop application that demonstrates state management, API integration, and local storage. The app allows users to browse products, view details, add items to a local cart, and search for products locally.

---

## 🚀 How to Run the Project

### Prerequisites
1. **Flutter SDK**: Install Flutter from the [official guide](https://flutter.dev/docs/get-started/install).
2. **Dart**: Comes bundled with Flutter.
3. **Android/iOS Emulator** or a physical device connected to your system.

### Steps to Run
1. Clone the repository:
    # Clone the repository to your local machine
   ```bash
   git clone https://github.com/YousefBahgat/Mini-Mart-App/
   ```
    # Navigate into the project directory
   ```bash
   cd Mini-Mart-App
   ```
- Before running the app, make sure that the following permission is added to your `AndroidManifest.xml` file to allow internet access:
# This permission is required for the app to fetch data from the internet.
```xml
<uses-permission android:name="android.permission.INTERNET"/>
```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run the app:
   ```bash
   flutter run
   ```

   - To target a specific device, use:
     ```bash
     flutter run -d <device_id>
     ```

4. Ensure the `assets` directory is properly configured in `pubspec.yaml` if there are missing assets.

---

## 🌟 App Features

### Main Features
1. **Product List Screen**:
   - Displays a list of products fetched from the [FakeStoreAPI](https://fakestoreapi.com/products).
   - Includes a search bar to filter products locally by name.
   - Shows a message if no products match the search query.
   - Each product has an image, title, price, and an "Add to Cart" button.
   - Displays a loading indicator while fetching products.

2. **Product Details Screen**:
   - Displays product details including image, title, description, price, and category.
   - Includes an "Add to Cart" button for easy addition to the cart.

3. **Cart Screen**:
   - Lists all items added to the cart, showing name, price, and quantity.
   - Allows removing items or adjusting quantities.
   - Shows the total price of items in the cart.
   - Displays a message when the cart is empty.

### Additional Features
- **Persistent Cart Storage**:
  - Cart items are saved locally using Hive, ensuring they remain after the app restarts.

- **State Management**:
  - State management is implemented using **Cubit/BLoC** for clear separation of concerns and effective state handling.

- **API Integration**:
  - Products are fetched using the **Dio** package, with loading, success, and error states managed seamlessly.

---

## 🛠️ Libraries Used

Here’s a list of libraries used in this project:

| Library                | Version  | Purpose                                           |
|------------------------|----------|---------------------------------------------------|
| `badges`               | ^3.1.2   | Displays notification badges on icons.           |
| `dio`                  | ^5.7.0   | Handles API requests and responses.              |
| `easy_splash_screen`   | ^1.0.4   | Provides a simple splash screen for the app.     |
| `flutter_bloc`         | ^8.1.6   | Manages app state using Cubit/BLoC.              |
| `google_fonts`         | ^6.2.1   | Applies custom fonts from Google Fonts.          |
| `hive`                 | ^2.2.3   | Manages local storage for the cart.              |
| `hive_flutter`         | ^1.1.0   | Flutter-specific extensions for Hive.            |

For more details on each library, refer to their [pub.dev](https://pub.dev) documentation.
---
### App Icon

The app icon is set using the `flutter_launcher_icons` package. The configuration is specified in the `pubspec.yaml` file, which allows the app to have a custom launcher icon on both Android and iOS platforms. 

Here’s the configuration used in the project:
# The package generates the necessary icon sizes for both platforms, and the image located at assets/appicon.png is used as the icon for the app
```yaml
flutter_launcher_icons:
  android: "launcher_icon"
  ios: true
  remove_alpha_ios: true
  image_path: "assets/appicon.png"
  min_sdk_android: 21
  adaptive_icon_background: "#ffffff"
  adaptive_icon_foreground: "assets/appicon.png"
```
---
## 📝 API Endpoints Used

1. **Fetch all products**:
   - URL: `https://fakestoreapi.com/products`
   - Usage: Displays the list of products on the home screen.

2. **Fetch a single product**:
   - URL: `https://fakestoreapi.com/products/{id}`
   - Usage: Displays detailed information about a selected product.

---

## 📂 Folder Structure

Here’s an overview of the folder structure:

```
lib/
├── models/             # Data models (e.g., CartItem, Product).
├── screens/            # UI screens (Product List, Details, Cart).
├── cubits/              # State management logic (e.g., ProductCubit, CartCubit).
├── services/           # API integration using Dio.
├── widgets/            # Reusable UI components.
└── main.dart           # App entry point.
```

---

## 📽️ Demo Video

You can view the app's demo video [here](https://drive.google.com/drive/folders/your-google-drive-link).  
The video showcases features like product browsing, adding to a cart, managing cart items, and search functionality.

---
### License

This app is open-source and available under the [MIT License](LICENSE).

---
Feel free to explore, customize, and improve upon this project! 😊
