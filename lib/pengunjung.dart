import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';

class Pelanggan extends StatefulWidget {
  @override
  _PelangganState createState() => _PelangganState();
}

class _PelangganState extends State<Pelanggan> {
  late Future<Map<String, dynamic>> data1;
  late Future<Map<String, dynamic>> data2;
  late Future<Map<String, dynamic>> data3;

  @override
  void initState() {
    super.initState();
    data1 = fetchData(1);
    data2 = fetchData(2);
    data3 = fetchData(3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1450A3),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Immobile',
          style: GoogleFonts.goldman(fontSize: 25.0, color: Colors.grey),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff191D88),
      ),
      body: ListView(
        children: <Widget>[
          FutureBuilder(
            future: data1,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                final Map<String, dynamic> data = snapshot.data!;
                return ListWidget(
                  gambar: "assets/jam.png",
                  judul: "1 Hari Lalu",
                  jam: "Jam : ${data['1hariyanglalu']}",
                  rata: "Rata-Rata Pengunjung : ${data['average_visitors1']}",
                );
              }
            },
          ),
          Divider(color: const Color(0xff191D88), height: 10.0),
          FutureBuilder(
            future: data2,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                final Map<String, dynamic> data = snapshot.data!;
                return ListWidget(
                  gambar: "assets/seru.png",
                  judul: "2 Hari Lalu",
                  jam: "Jam : ${data['2hariyanglalu']}",
                  rata: "Rata-Rata Pengunjung : ${data['average_visitors2']}",
                );
              }
            },
          ),
          Divider(color: const Color(0xff191D88), height: 10.0),
          FutureBuilder(
            future: data3,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                final Map<String, dynamic> data = snapshot.data!;
                return ListWidget(
                  gambar: "assets/stop.png",
                  judul: "3 Hari Lalu",
                  jam: "Jam : ${data['3hariyanglalu']}",
                  rata: "Rata-Rata Pengunjung : ${data['average_visitors3']}",
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class ListWidget extends StatelessWidget {
  ListWidget({
    required this.gambar,
    required this.judul,
    required this.jam,
    required this.rata,
  });

  final String gambar;
  final String judul;
  final String jam;
  final String rata;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff191D88),
      padding: EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Image.asset(
                gambar,
                width: 90.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              judul,
              style: GoogleFonts.goldman(fontSize: 25.0, color: Colors.white),
            ),
            SizedBox(height: 10.0),
            Text(
              jam,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 10.0),
            Text(
              rata,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

Future<Map<String, dynamic>> fetchData(int daysAgo) async {
  try {
    final response = await http.get(Uri.parse('https://backendparkol-m77laoox7a-uc.a.run.app/average'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final List<dynamic> dataList = responseData['data'];
      final Map<String, dynamic> data = dataList[daysAgo - 1];
      return data;
    } else {
      throw Exception('Failed to load average data. Error: ${response.statusCode}');
    }
  } catch (error) {
    throw Exception('Error fetching average data: $error');
  }
}
