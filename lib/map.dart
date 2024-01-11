import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Pendapatan extends StatefulWidget {
  @override
  _mapState createState() => _mapState();
}

class _mapState extends State<Pendapatan> {
  // Variabel untuk menyimpan data dari API
  String mobilTanggal = "";
  String mobilTotal = "";
  String motorTanggal = "";
  String motorTotal = "";

  Future<void> fetchData() async {
    try {
      final motorResponse = await http.get(Uri.parse('https://backendparkol-m77laoox7a-uc.a.run.app/totalpengunjung-hari/motor'));
      final mobilResponse = await http.get(Uri.parse('https://backendparkol-m77laoox7a-uc.a.run.app/totalpengunjung-hari/mobil'));

      if (motorResponse.statusCode == 200 && mobilResponse.statusCode == 200) {
        // Parse data JSON dari response motor
        final motorData = json.decode(motorResponse.body);
        // Parse data JSON dari response mobil
        final mobilData = json.decode(mobilResponse.body);

        // Update nilai variabel dengan data dari API
        setState(() {
          mobilTanggal = mobilData['data']['tanggal']?.toString() ?? "N/A";
          mobilTotal = mobilData['data']['total_harga']?.toString() ?? "N/A";
          motorTanggal = motorData['data']['tanggal']?.toString() ?? "N/A";
          motorTotal = motorData['data']['total_harga']?.toString() ?? "N/A";
        });
      } else {
        throw Exception('Gagal mengambil data dari API');
      }
    } catch (error) {
      print('Error fetching data: $error');
      // Tambahkan penanganan kesalahan sesuai kebutuhan Anda
    }
  }

  @override
  void initState() {
    super.initState();
    // Panggil fetchData() ketika widget diinisialisasi
    fetchData();
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
        title: Text('Immobile',
          style: GoogleFonts.goldman(fontSize: 25.0, color: Colors.white),),
        centerTitle: true,
        backgroundColor: const Color(0xff191D88),// Ganti dengan warna yang diinginkan
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 150.0,
              child: Container(
                width: 350.0,
                height: 200.0,
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Mobil",
                            style: GoogleFonts.goldman(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 7, 69, 238),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          "Tanggal : $mobilTanggal",
                          style: GoogleFonts.goldman(
                            fontSize: 18.0,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          "Total : $mobilTotal",
                          style: GoogleFonts.goldman(
                            fontSize: 18.0,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 50.0,
              child: Text(
                "Data Pendapatan",
                style: GoogleFonts.goldman(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              top: 400.0,
              child: Container(
                width: 350.0,
                height: 200.0,
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Motor",
                            style: GoogleFonts.goldman(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 7, 69, 238),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          "Tanggal : $motorTanggal",
                          style: GoogleFonts.goldman(
                            fontSize: 18.0,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          "Total : $motorTotal",
                          style: GoogleFonts.goldman(
                            fontSize: 18.0,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
