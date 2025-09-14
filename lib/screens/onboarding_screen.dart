import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenHeight * (536 / 812), // Original height: 536px
            child: Image.asset(
              'assets/images/I156_95_417_719.png',
              fit: BoxFit.cover,
            ),
          ),

          // Gradient Overlay (Shadow Container)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: screenHeight * (360 / 812), // Original height: 360px
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x00050505), // r: 0.019, a: 0
                    Color(0xFF050505), // r: 0.019, a: 1
                  ],
                  stops: [0.0, 0.23670603334903717], // Figma gradient stops
                ),
              ),
            ),
          ),

          // Content (Title, Description, Button)
          Positioned(
            bottom: screenHeight * (54 / 812), // (812 - 758) bottom of button frame to screen bottom
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * (24 / 375)), // Original x=24 margin
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Fall in Love with Coffee in Blissful Delight!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.sora(
                      fontSize: screenWidth * (32 / 375), // Original 32px
                      fontWeight: FontWeight.w600, // SemiBold
                      color: Colors.white,
                      height: 1.5, // Line height 48px / font size 32px = 1.5
                      letterSpacing: 0.16,
                    ),
                  ),
                  SizedBox(height: screenHeight * (8 / 812)), // Item spacing 8
                  Text(
                    'Welcome to our cozy coffee corner, where every cup is a delightful for you.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.sora(
                      fontSize: screenWidth * (14 / 375), // Original 14px
                      fontWeight: FontWeight.w400, // Regular
                      color: const Color(0xFFA7A7A7), // r: 0.635, g: 0.635, b: 0.635, a: 1
                      height: 1.5, // Line height 21px / font size 14px = 1.5
                      letterSpacing: 0.14,
                    ),
                  ),
                  SizedBox(height: screenHeight * (32 / 812)), // Gap between text frame bottom (y=670) and button frame top (y=702)
                  // Get Started Button
                  SizedBox(
                    width: double.infinity,
                    height: screenHeight * (56 / 812), // Original height 56px
                    child: ElevatedButton(
                      onPressed: () {
                        context.go('/home'); // Navigate to the home screen using go_router
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFC67C4E), // r: 0.776, g: 0.486, b: 0.305, a: 1
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16), // cornerRadius 16
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * (20 / 375), // paddingLeft/Right 20
                          vertical: screenHeight * (16 / 812), // paddingTop/Bottom 16
                        ),
                      ),
                      child: Text(
                        'Get Started',
                        style: GoogleFonts.sora(
                          fontSize: screenWidth * (16 / 375), // Original 16px
                          fontWeight: FontWeight.w600, // SemiBold
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Custom Status Bar (Top)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenHeight * (44 / 812), // Original height 44px
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * (24 / 375)), // Original padding
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '9:41', // Original time
                      style: GoogleFonts.sora(
                        fontSize: screenWidth * (15 / 375), // Adjusted to fit common status bar time size
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.signal_cellular_alt, color: Colors.white, size: screenWidth * (17 / 375)), // Original size similar
                        SizedBox(width: screenWidth * (5 / 375)),
                        Icon(Icons.wifi, color: Colors.white, size: screenWidth * (17 / 375)), // Original size similar
                        SizedBox(width: screenWidth * (5 / 375)),
                        Icon(Icons.battery_full_rounded, color: Colors.white, size: screenWidth * (20 / 375)), // Original size similar
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Home Indicator (Bottom)
          Positioned(
            bottom: screenHeight * (8 / 812), // (812 - 799 - 5) bottom of home indicator to screen bottom
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: screenWidth * (134 / 375), // Original width 134px
                height: screenHeight * (5 / 812), // Original height 5px
                decoration: BoxDecoration(
                  color: const Color(0xFF242424), // r: 0.141, g: 0.141, b: 0.141, a: 1
                  borderRadius: BorderRadius.circular(100), // cornerRadius 100
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}