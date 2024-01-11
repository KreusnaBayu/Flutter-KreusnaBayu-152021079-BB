import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;


class GempaInfoPage extends StatefulWidget {
  @override
  _GempaInfoPageState createState() => _GempaInfoPageState();
}

class _GempaInfoPageState extends State<GempaInfoPage> {
  late Future<List<GempaInfo>> gempaInfoList;

  @override
  void initState() {
    super.initState();
    gempaInfoList = fetchGempaInfo();
  }

  Future<List<GempaInfo>> fetchGempaInfo() async {
    final response = await http.get(Uri.parse('https://data.bmkg.go.id/DataMKG/TEWS/gempaterkini.json'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['Infogempa']['gempa'];
      List<GempaInfo> gempaList = data.map((json) => GempaInfo.fromJson(json)).toList();
      return gempaList;
    } else {
      throw Exception('Failed to load data');
    }
  }

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
      body: FutureBuilder(
        future: gempaInfoList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<GempaInfo> gempaList = snapshot.data as List<GempaInfo>;
            return ListView.builder(
              itemCount: gempaList.length,
              itemBuilder: (context, index) {
                return GempaCard(gempaInfo: gempaList[index]);
              },
            );
          }
        },
      ),
    );
  }
}

class GempaInfo {
  final String tanggal;
  final String jam;
  final String datetime;
  final String coordinates;
  final String lintang;
  final String bujur;
  final String magnitude;
  final String kedalaman;
  final String wilayah;
  final String potensi;

  GempaInfo({
    required this.tanggal,
    required this.jam,
    required this.datetime,
    required this.coordinates,
    required this.lintang,
    required this.bujur,
    required this.magnitude,
    required this.kedalaman,
    required this.wilayah,
    required this.potensi,
  });

  factory GempaInfo.fromJson(Map<String, dynamic> json) {
    return GempaInfo(
      tanggal: json['Tanggal'],
      jam: json['Jam'],
      datetime: json['DateTime'],
      coordinates: json['Coordinates'],
      lintang: json['Lintang'],
      bujur: json['Bujur'],
      magnitude: json['Magnitude'],
      kedalaman: json['Kedalaman'],
      wilayah: json['Wilayah'],
      potensi: json['Potensi'],
    );
  }
}

class GempaCard extends StatelessWidget {
  final GempaInfo gempaInfo;

  GempaCard({required this.gempaInfo});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        title: Text('Tanggal: ${gempaInfo.tanggal} Jam: ${gempaInfo.jam}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Coordinates: ${gempaInfo.coordinates}'),
            Text('Lintang: ${gempaInfo.lintang}'),
            Text('Bujur: ${gempaInfo.bujur}'),
            Text('Magnitude: ${gempaInfo.magnitude}'),
            Text('Kedalaman: ${gempaInfo.kedalaman}'),
            Text('Wilayah: ${gempaInfo.wilayah}'),
            Text('Potensi: ${gempaInfo.potensi}'),
          ],
        ),
      ),
    );
  }
}