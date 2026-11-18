import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const PariABCApp());
}

class PariABCApp extends StatelessWidget {
  const PariABCApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pari ABC',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
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

  // Function to play sound and show action message
  void _onCardTap(String className) async {
    try {
      // Yahan aap apni audio file play kar sakte hain
      // await _audioPlayer.play(AssetSource('sounds/chalo_nursery.mp3'));
    } catch (e) {
      debugPrint("Audio error: $e");
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Chalo $className me chalte hain!"),
        duration: const Duration(seconds: 1),
        backgroundColor: Colors.indigo,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isTablet = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      backgroundColor: const Color(0xFFFFF9C4), // Light Yellow Background (#FFF9C4)
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isTablet ? 32.0 : 16.0,
                vertical: 20.0,
              ),
              child: Column(
                children: [
                  // App Branding / Title
                  Text(
                    "Pari ABC",
                    style: TextStyle(
                      fontSize: isTablet ? 28.0 : 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink.shade700,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Upar ka Greeting Text
                  Text(
                    "Namaste Beta! Aao Seekhte Hain",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: isTablet ? 34.0 : 24.0,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF0D1B2A), // Dark Blue Color
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Bich ke 3 Bade Card Buttons
                  Expanded(
                    child: ListView(
                      children: [
                        _buildClassCard(
                          title: "NURSERY",
                          subtitle: "3-4 Saal Ke Liye",
                          cardColor: Colors.amber.shade200,
                          lottieUrl:
                              'https://assets2.lottiefiles.com/packages/lf20_q5pk6pzz.json', // Apple
                          onTap: () => _onCardTap("Nursery"),
                        ),
                        const SizedBox(height: 16),
                        _buildClassCard(
                          title: "LKG",
                          subtitle: "4-5 Saal Ke Liye",
                          cardColor: Colors.green.shade200,
                          lottieUrl:
                              'https://assets5.lottiefiles.com/packages/lf20_1idq8zx3.json', // Ball
                          onTap: () => _onCardTap("LKG"),
                        ),
                        const SizedBox(height: 16),
                        _buildClassCard(
                          title: "UKG",
                          subtitle: "5-6 Saal Ke Liye",
                          cardColor: Colors.blue.shade200,
                          lottieUrl:
                              'https://assets10.lottiefiles.com/packages/lf20_xybpny7a.json', // Lion
                          onTap: () => _onCardTap("UKG"),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Niche Chhota Button: "Mummy Papa Ke Liye"
                  TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Mummy Papa Dashboard Khul Raha Hai..."),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.indigo.shade800,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                    ),
                    child: Text(
                      "Mummy Papa Ke Liye",
                      style: TextStyle(
                        fontSize: isTablet ? 18.0 : 14.0,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
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

  // Reusable Card Widget
  Widget _buildClassCard({
    required String title,
    required String subtitle,
    required Color cardColor,
    required String lottieUrl,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 110,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainCategory.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0D1B2A),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade800,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 80,
              height: 80,
              child: Lottie.network(
                lottieUrl,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.star, size: 40, color: Colors.orange);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
