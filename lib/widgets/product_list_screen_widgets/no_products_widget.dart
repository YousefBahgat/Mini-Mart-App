import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoProductsWidget extends StatelessWidget {
  const NoProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.shopping_bag_outlined,
              color: Colors.grey,
              size: 80,
            ),
            const SizedBox(height: 16),
            Text(
              'No Products Available',
              style: GoogleFonts.ubuntuCondensed(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'It seems like there are no products at the moment.\nPlease check back later.',
              textAlign: TextAlign.center,
              style: GoogleFonts.ubuntuCondensed(
                fontSize: 18,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
