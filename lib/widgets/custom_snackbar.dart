import 'package:flutter/material.dart';

class CustomSnackbar {
  static void showCustomSnackbar({
    required BuildContext context,
    required String title,
    required String message,
  }) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    // Define the snackbar
    final snackbar = Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          bottom: isLandscape ? 10 : 20, // Adjust position for orientation
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9, // Responsive width
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
            decoration: BoxDecoration(
              color: Colors.teal.shade700,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 6,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.check_circle,
                  color: Colors.white,
                  size: 28,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        message,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          height: 1.4, // Line height for better readability
                          decoration: TextDecoration.none,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).clearSnackBars();
                  },
                  icon: const Icon(Icons.close, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );

    // Display snackbar using Overlay
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(builder: (_) => snackbar);

    overlay.insert(overlayEntry);

    // Auto-remove after duration
    Future.delayed(const Duration(seconds: 3), () {
      overlayEntry.remove();
    });
  }
}
