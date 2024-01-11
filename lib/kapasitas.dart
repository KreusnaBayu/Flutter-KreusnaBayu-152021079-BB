import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:parkol/slo1.dart';
import 'package:parkol/slo2.dart';

class Kapasitas extends StatefulWidget {
  const Kapasitas({Key? key}) : super(key: key);

  @override
  State<Kapasitas> createState() => _KapasitasState();
}

class _KapasitasState extends State<Kapasitas> {
  String totalKendaraanLantai1 = '0'; // Provide an initial value
  String totalKendaraanLantai2 = '0'; // Provide an initial value

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      // Make API calls to get data for lantai 1 and lantai 2
      final responseLantai1 = await http.get(Uri.parse('https://backendparkol-m77laoox7a-uc.a.run.app/total-kendaraan-lantai-1'));
      final responseLantai2 = await http.get(Uri.parse('https://backendparkol-m77laoox7a-uc.a.run.app/total-kendaraan-lantai-2'));

      // Parse the JSON responses
      final dataLantai1 = jsonDecode(responseLantai1.body);
      final dataLantai2 = jsonDecode(responseLantai2.body);

      // Extract the totalKendaraan values directly
      totalKendaraanLantai1 = dataLantai1['totalKendaraan'].toString();
      totalKendaraanLantai2 = dataLantai2['totalKendaraan'].toString();

      // Update the UI by calling setState
      setState(() {});
    } catch (error) {
      print('Error fetching data: $error');
      // Handle errors, e.g., show an error message to the user
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 3,
              margin: EdgeInsets.all(20),
              child: Container(
                padding: EdgeInsets.all(20),
                height: 600,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'KAPASITAS PARKIR',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.goldman(
                        textStyle: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.all(10)),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Lantai1()),
                            );
                          },
                          child: Row(
                            children: [
                              Text(
                                'Lantai 1',
                                textAlign: TextAlign.start,
                                style: GoogleFonts.goldman(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(left: 70)),
                              Text(
                                totalKendaraanLantai1 == '6' ? 'Full' : '$totalKendaraanLantai1/6',
                                style: GoogleFonts.goldman(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.all(10)),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Lantai2()),
                            );
                          },
                          child: Row(
                            children: [
                              Text(
                                'Lantai 2',
                                textAlign: TextAlign.start,
                                style: GoogleFonts.goldman(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(left: 63)),
                              Text(
                                totalKendaraanLantai2 == '6' ? 'Full' : '$totalKendaraanLantai2/6',
                                style: GoogleFonts.goldman(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.only(left: 15, top: 120)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Harga Parkir",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.goldman(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Motor",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    "1 Jam Pertama",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(left: 30)),
                                Text(
                                  "Rp. 2.000",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    "1 Jam Selanjutnya",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(left: 5)),
                                Text(
                                  "Rp. 1.000",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Mobil",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    "1 Jam Pertama",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(left: 30)),
                                Text(
                                  "Rp. 5.000",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    "1 Jam Selanjutnya",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(left: 5)),
                                Text(
                                  "Rp. 2.000",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
