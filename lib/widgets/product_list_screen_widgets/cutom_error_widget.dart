import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:google_fonts/google_fonts.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, color: Colors.red, size: 80),
            const SizedBox(height: 16),
            Text(
              'Error Occurred!',
              style: GoogleFonts.ubuntuCondensed(
                  fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'please wait some time until  the error is resolved and try again later',
              textAlign: TextAlign.center,
              style: GoogleFonts.ubuntuCondensed(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
