import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const SamsadKidsApp());
}

class SamsadKidsApp extends StatelessWidget {
  const SamsadKidsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Samsad Kids - Pari Learning',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.amber,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> _playSound(String message) async {
    try {
      // Audio play logic yahan aayegi
    } catch (e) {
      debugPrint("Audio error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;

    return Scaffold(
      backgroundColor: const Color(0xFFFFF9C4), // Light Yellow Background
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: isTablet ? 48.0 : 20.0,
              vertical: 24.0,
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Header Title - Pari Learning Style
                  const Text(
                    "Pari Learning presents",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1565C0),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Namaste Beta! Aao Seekhte Hain",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: isTablet ? 36.0 : 26.0,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF0D47A1), // Dark Blue
                    ),
                  ),
                  const SizedBox(height: 32),

                  // 1. NURSERY Card
                  _buildCategoryCard(
                    title: "NURSERY",
                    subtitle: "3-4 Saal Ke Liye",
                    cardColor: const Color(0xFFFFEE58),
                    textColor: Colors.black87,
                    lottieUrl: 'https://assets2.lottiefiles.com/packages/lf20_5njp3vgg.json',
                    onTap: () {
                      _playSound("Chalo Nursery me chalte hain");
                      _showSnackBar("Chalo Nursery me chalte hain!");
                    },
                    isTablet: isTablet,
                  ),
                  const SizedBox(height: 18),

                  // 2. LKG Card
                  _buildCategoryCard(
                    title: "LKG",
                    subtitle: "4-5 Saal Ke Liye",
                    cardColor: const Color(0xFF81C784),
                    textColor: Colors.white,
                    lottieUrl: 'https://assets9.lottiefiles.com/packages/lf20_xyadohio.json',
                    onTap: () {
                      _playSound("Chalo LKG me chalte hain");
                      _showSnackBar("Chalo LKG me chalte hain!");
                    },
                    isTablet: isTablet,
                  ),
                  const SizedBox(height: 18),

                  // 3. UKG Card
                  _buildCategoryCard(
                    title: "UKG",
                    subtitle: "5-6 Saal Ke Liye",
                    cardColor: const Color(0xFF64B5F6),
                    textColor: Colors.white,
                    lottieUrl: 'https://assets10.lottiefiles.com/packages/lf20_UJNoYV.json',
                    onTap: () {
                      _playSound("Chalo UKG me chalte hain");
                      _showSnackBar("Chalo UKG me chalte hain!");
                    },
                    isTablet: isTablet,
                  ),
                  const SizedBox(height: 40),

                  // Mummy Papa Ke Liye Button
                  OutlinedButton(
                    onPressed: () {
                      _showSnackBar("Mummy Papa Dashboard Khul Raha Hai...");
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFF0D47A1), width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    child: const Text(
                      "Mummy Papa Ke Liye",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0D47A1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard({
    required String title,
    required String subtitle,
    required Color cardColor,
    required Color textColor,
    required String lottieUrl,
    required VoidCallback onTap,
    required bool isTablet,
  }) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: cardColor,
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(24),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: isTablet ? 24.0 : 18.0,
              horizontal: 24.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: isTablet ? 32.0 : 24.0,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: isTablet ? 18.0 : 14.0,
                          fontWeight: FontWeight.w500,
                          color: textColor.withOpacity(0.85),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: isTablet ? 90 : 70,
                  height: isTablet ? 90 : 70,
                  child: Lottie.network(
                    lottieUrl,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.star, size: 40, color: textColor);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(fontSize: 16)),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
