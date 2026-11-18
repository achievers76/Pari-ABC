import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class ClassLearningPage extends StatelessWidget {
  final String className; // Nursery, LKG, ya UKG
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
      backgroundColor: const Color(0xFFFFF9C4), // Light Yellow Background
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
              // Upar ka Welcome Banner
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

              // Learning Categories Grid
              Expanded(
                child: GridView.count(
                  crossAxisCount: isTablet ? 3 : 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.1,
                  children: [
                    _buildCategoryCard(
                      title: "Varnmala (A-Z / अ-ज्ञ)",
                      subtitle: "Akshar Seekhein",
                      cardColor: Colors.orange.shade100,
                      iconData: Icons.menu_book,
                      onTap: () {
                        _showLearningModal(context, "Varnmala / Alphabets");
                      },
                    ),
                    _buildCategoryCard(
                      title: "Ginti (1-100 / Numbers)",
                      subtitle: "Counting Sikhein",
                      cardColor: Colors.green.shade100,
                      iconData: Icons.pin,
                      onTap: () {
                        _showLearningModal(context, "Ginti / Counting");
                      },
                    ),
                    _buildCategoryCard(
                      title: "Fals & Fruits",
                      subtitle: "Fruits & Vegetables",
                      cardColor: Colors.pink.shade100,
                      iconData: Icons.eco,
                      onTap: () {
                        _showLearningModal(context, "Fruits & Vegetables");
                      },
                    ),
                    _buildCategoryCard(
                      title: "Rhymes & Poems",
                      subtitle: "Mazedaar Kavitayein",
                      cardColor: Colors.blue.shade100,
                      iconData: Icons.music_note,
                      onTap: () {
                        _showLearningModal(context, "Rhymes & Audio Poems");
                      },
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

  // Grid Card Widget
  Widget _buildCategoryCard({
    required String title,
    required String subtitle,
    required Color cardColor,
    required IconData iconData,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
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

  // Bottom Sheet ya Detail View dikhane ke liye helper function
  void _showLearningModal(BuildContext context, String topic) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(24),
          height: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                topic,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0D1B2A),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Yahan bachhe interactive tarike se seekhenge! Jaise A for Apple, B for Ball aur 1, 2, 3...",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text("Shuru Karein (Start)", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        );
      },
    );
  }
}
