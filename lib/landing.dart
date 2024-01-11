
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parkol/BarChart.dart';
import 'package:parkol/chat.dart';
import 'package:parkol/crud.dart';
import 'package:parkol/gempa.dart';
import 'package:parkol/home.dart';
import 'package:parkol/kapasitas.dart';
import 'package:parkol/slo1.dart';
import 'package:parkol/slo2.dart';
import 'package:parkol/timer/timer.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeContent(),
    );
  }
}

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  int _selectedIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: <Widget>[
          Home(),
          Kapasitas(),
          menu(),
          ChartPage(),
        ],
      ),
      selectedIndex: _selectedIndex,
      onTabTapped: onTabTapped,
    );
  }
}

class CommonScaffold extends StatelessWidget {
  final Widget body;
  final int selectedIndex;
  final Function(int) onTabTapped;

  CommonScaffold({required this.body, required this.selectedIndex, required this.onTabTapped});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: const Color(0xff191D88),
        color: Colors.white,
        index: selectedIndex,
        items: <Widget>[
          Icon(Icons.flight_land, size: 30),
          Icon(Icons.attach_money, size: 30),
          Icon(Icons.local_parking, size: 30),
          Icon(Icons.auto_graph_rounded, size: 30),
        ],
        onTap: onTabTapped,
      ),
    );
  }
}


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
        backgroundColor: const Color(0xff1450A3),
        title: Align(
          alignment: Alignment.center,
          child: Text(
            "Immobile",
            style: GoogleFonts.goldman(fontSize: 25.0, color: Colors.white),
          ),
        ),
      ),
      backgroundColor: const Color(0xff191D88),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CardItem(
                  title: 'Info Gempa',
                  imagePath: 'assets/gempa2.jpeg',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GempaInfoPage()),
                    );
                  },
                ),
                CardItem(
                  title: 'CRUD',
                  imagePath: 'assets/CRUD2.jpeg',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BookListPage()),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 20), // Tambahkan jarak antara dua baris card
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CardItem(
                  title: 'Chat',
                  imagePath: 'assets/chat.jpeg',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatPage()),
                    );
                  },
                ),
                CardItem(
                  title: 'Timer',
                  imagePath: 'assets/timer2.jpeg',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StopwatchApp()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onPressed;

  CardItem({required this.title, required this.imagePath, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onPressed,
        child: Column(
          children: [
            Container(
              width: 160,
              height: 230,
              alignment: Alignment.center,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title),
            ),
          ],
        ),
      ),
    );
  }
}
