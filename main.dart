import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

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

// ==================== HOME SCREEN ====================
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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

                  // Greeting Text
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

                  // 3 Bade Card Buttons
                  Expanded(
                    child: ListView(
                      children: [
                        _buildClassCard(
                          context: context,
                          title: "NURSERY",
                          subtitle: "3-4 Saal Ke Liye",
                          cardColor: Colors.amber.shade200,
                          themeColor: Colors.amber.shade700,
                          lottieUrl: 'https://assets2.lottiefiles.com/packages/lf20_q5pk6pzz.json', // Apple
                        ),
                        const SizedBox(height: 16),
                        _buildClassCard(
                          context: context,
                          title: "LKG",
                          subtitle: "4-5 Saal Ke Liye",
                          cardColor: Colors.green.shade200,
                          themeColor: Colors.green.shade700,
                          lottieUrl: 'https://assets5.lottiefiles.com/packages/lf20_1idq8zx3.json', // Ball
                        ),
                        const SizedBox(height: 16),
                        _buildClassCard(
                          context: context,
                          title: "UKG",
                          subtitle: "5-6 Saal Ke Liye",
                          cardColor: Colors.blue.shade200,
                          themeColor: Colors.blue.shade700,
                          lottieUrl: 'https://assets10.lottiefiles.com/packages/lf20_xybpny7a.json', // Lion
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
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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

  // Reusable Card Widget for Nursery, LKG, UKG
  Widget _buildClassCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required Color cardColor,
    required Color themeColor,
    required String lottieUrl,
  }) {
    return GestureDetector(
      onTap: () {
        // Yahan card dabane par agla page khulega
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ClassLearningPage(
              className: title,
              themeColor: themeColor,
            ),
          ),
        );
      },
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
              mainAxisAlignment: MainAxisAlignment.center,
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

// ==================== NEXT CLASS LEARNING PAGE ====================
class ClassLearningPage extends StatelessWidget {
  final String className;
  final Color themeColor;

  const ClassLearningPage({
    super.key,
    required this.className,
    required this.themeColor,
  });

  @override
  Widget build(BuildContext context) {
    bool isTablet = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      backgroundColor: const Color(0xFFFFF9C4),
      appBar: AppBar(
        backgroundColor: themeColor,
        title: Text(
          "Pari ABC - $className",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(isTablet ? 24.0 : 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Aao Seekhein!",
                          style: TextStyle(
                            fontSize: isTablet ? 22 : 18,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF0D1B2A),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Apni pasand ki activity chuno beta:",
                          style: TextStyle(
                            fontSize: isTablet ? 16 : 13,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                    const Icon(Icons.auto_awesome, color: Colors.amber, size: 36),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisCount: isTablet ? 3 : 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.1,
                  children: [
                    _buildCategoryCard(
                      context,
                      "Varnmala (A-Z / अ-ज्ञ)",
                      "Akshar Seekhein",
                      Colors.orange.shade100,
                      Icons.menu_book,
                    ),
                    _buildCategoryCard(
                      context,
                      "Ginti (1-100 / Numbers)",
                      "Counting Sikhein",
                      Colors.green.shade100,
                      Icons.pin,
                    ),
                    _buildCategoryCard(
                      context,
                      "Fals & Fruits",
                      "Fruits & Vegetables",
                      Colors.pink.shade100,
                      Icons.eco,
                    ),
                    _buildCategoryCard(
                      context,
                      "Rhymes & Poems",
                      "Mazedaar Kavitayein",
                      Colors.blue.shade100,
                      Icons.music_note,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(
    BuildContext context,
    String title,
    String subtitle,
    Color cardColor,
    IconData iconData,
  ) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("$title khul raha hai...")),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white, width: 3),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: Colors.white,
              child: Icon(iconData, size: 30, color: const Color(0xFF0D1B2A)),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0D1B2A),
              ),
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade800,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
