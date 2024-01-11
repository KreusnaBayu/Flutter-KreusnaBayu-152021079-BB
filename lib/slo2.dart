import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:parkol/kapasitas.dart';
import 'package:parkol/slo1.dart';

class Lantai2 extends StatefulWidget {
  @override
  _Lantai2State createState() => _Lantai2State();
}

class _Lantai2State extends State<Lantai2> {
  late Future<List<int>> _occupiedSpots;

  @override
  void initState() {
    super.initState();
    _occupiedSpots = fetchOccupiedSpots();
  }

  Future<List<int>> fetchOccupiedSpots() async {
    final response = await http.get(
      Uri.parse(
          'https://backendparkol-m77laoox7a-uc.a.run.app/total-kendaraan-lantai-2'),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> data = jsonData['data'];

      // Mengambil ID dari data yang ditemukan
      List<int> occupiedIds = data.map<int>((item) => item['id']).toList();
      return occupiedIds;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor: const Color(0xff0C2F23),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Container(
            padding:
                EdgeInsets.fromLTRB(22 * fem, 61 * fem, 30 * fem, 17 * fem),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xff0C2F23),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // autogroup2dq5uwo (FgSTfdu64oGbH1NX6X2Dq5)
                  margin:
                      EdgeInsets.fromLTRB(5 * fem, 0 * fem, 0 * fem, 21 * fem),
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 10 * fem, 3 * fem, 0 * fem),
                        width: 23 * fem,
                        height: 20 * fem,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(
                                context); // Logika untuk kembali ke halaman sebelumnya
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 30 * fem,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(
                              30 * fem, 8 * fem, 0 * fem, 0 * fem),
                          child: Text(
                            'Denah Parkir',
                            style: GoogleFonts.goldman(
                              fontSize: 29 * ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.1600001105 * ffem / fem,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // autogroupcpnb4CR (FgSU3nvqYrvB6ppJfFcPNB)
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 16 * fem),
                  width: double.infinity,
                  height: 475 * fem,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // autogroupnqwvTVT (FgSUerkk23vZtdnAKKnQwV)
                        width: 322 * fem,
                        height: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 34 * fem,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .center, // Center horizontally
                                crossAxisAlignment: CrossAxisAlignment
                                    .center, // Center vertically
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 20 * fem),
                                    width: 98 * fem,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xffa9bb86)),
                                      color: Color(0xffffffff),
                                      borderRadius:
                                          BorderRadius.circular(50 * fem),
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        // Navigasi ke halaman baru ketika container ditekan
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Lantai1()),
                                        );
                                      },
                                      child: Center(
                                        child: Text(
                                          'Lantai 1',
                                          style: GoogleFonts.goldman(
                                            fontSize: 16 * ffem,
                                            fontWeight: FontWeight.w600,
                                            height: 1.445 * ffem / fem,
                                            color: Color(0xffa9bb86),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 98 * fem,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xffa9bb86)),
                                      color: Color(0xffa9bb86),
                                      borderRadius:
                                          BorderRadius.circular(50 * fem),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Lantai 2',
                                        style: GoogleFonts.goldman(
                                          fontSize: 16 * ffem,
                                          fontWeight: FontWeight.w600,
                                          height: 1.445 * ffem / fem,
                                          color: Color(0xffffffff),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              // entryTfo (6:992)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 0 * fem, 2.01 * fem),
                              child: Text(
                                'Entry',
                                style: GoogleFonts.goldman(
                                  fontSize: 20 * ffem,
                                  fontWeight: FontWeight.w600,
                                  height: 1.445 * ffem / fem,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),
                            Container(
                              // group79NXs (6:1026)
                              margin: EdgeInsets.fromLTRB(
                                  8.44 * fem, 0 * fem, 0 * fem, 10.42 * fem),
                              width: 12.33 * fem,
                              height: 35.57 * fem,
                              child: Image.asset(
                                'assets/turun.png',
                                width: 12.33 * fem,
                                height: 35.57 * fem,
                              ),
                            ),
                            Container(
                              // line25U57 (6:1020)
                              margin: EdgeInsets.fromLTRB(
                                  14 * fem, 0 * fem, 0 * fem, 17 * fem),
                              width: 2 * fem,
                              height: 42 * fem,
                              decoration: BoxDecoration(
                                color: Color(0xffa1a1a1),
                              ),
                            ),
                            Container(
                              // autogroupsy43atq (FgSVRkdbyPXWhAHWubsY43)
                              margin: EdgeInsets.fromLTRB(
                                  14 * fem, 0 * fem, 4.72 * fem, 15.23 * fem),
                              padding: EdgeInsets.fromLTRB(
                                  57 * fem, 31 * fem, 0 * fem, 0 * fem),
                              width: double.infinity,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    // group1565ffP (9:11)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 14.93 * fem, 0 * fem),
                                    width: 34.34 * fem,
                                    height: 12.77 * fem,
                                    child: Image.asset(
                                      'assets/kiri.png',
                                      width: 34.34 * fem,
                                      height: 12.77 * fem,
                                    ),
                                  ),
                                  Container(
                                    // line29NZo (9:9)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 11 * fem, 6.13 * fem),
                                    width: 41 * fem,
                                    height: 2 * fem,
                                    decoration: BoxDecoration(
                                      color: Color(0xffa1a1a1),
                                    ),
                                  ),
                                  Container(
                                    // line28hc5 (9:8)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 10 * fem, 6.13 * fem),
                                    width: 41 * fem,
                                    height: 2 * fem,
                                    decoration: BoxDecoration(
                                      color: Color(0xffa1a1a1),
                                    ),
                                  ),
                                  Container(
                                    // line272uF (9:7)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 0 * fem, 6.13 * fem),
                                    width: 41 * fem,
                                    height: 2 * fem,
                                    decoration: BoxDecoration(
                                      color: Color(0xffa1a1a1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              // autogroupvalkMwX (FgSViAKvsnizaVWHmnvALK)
                              margin: EdgeInsets.fromLTRB(
                                  14 * fem, 0 * fem, 0 * fem, 0 * fem),
                              width: double.infinity,
                              height: 221 * fem,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    // autogroupxbmdUmF (FgSVzerT4eYA4EftZXXBmD)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 49 * fem, 0 * fem),
                                    width: 2 * fem,
                                    height: double.infinity,
                                  ),
                                  Container(
                                    // autogroupuuvr1FP (FgSWB9YxpU4ApFmzt5uUVR)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 0 * fem, 1 * fem),
                                    width: 204 * fem,
                                    height: 206 * fem,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          // vector9857 (6:996)
                                          left: 4 * fem,
                                          top: 0 * fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 198 * fem,
                                              height: 206 * fem,
                                              child: Image.asset(
                                                'assets/garis.png',
                                                width: 198 * fem,
                                                height: 206 * fem,
                                              ),
                                            ),
                                          ),
                                        ),
                                        FutureBuilder<List<int>>(
                                          future: _occupiedSpots,
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              return CircularProgressIndicator();
                                            } else if (snapshot.hasError) {
                                              return Text(
                                                  'Error: ${snapshot.error}');
                                            } else {
                                              List<int> occupiedIds =
                                                  snapshot.data!;

                                              return Stack(
                                                children: [
                                                  Positioned(
                                                    left: 5 * fem,
                                                    top: 81 * fem,
                                                    child: Container(
                                                      width: 89 * fem,
                                                      height: 33 * fem,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Color(
                                                                0xffa9bb86)),
                                                        color: occupiedIds
                                                                .contains(9)
                                                            ? Color.fromARGB(
                                                                255,
                                                                165,
                                                                47,
                                                                47)
                                                            : Color(0xffffffff),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    10 * fem),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          'B03',
                                                          style: GoogleFonts
                                                              .goldman(
                                                            fontSize: 16 * ffem,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            height: 1.445 *
                                                                ffem /
                                                                fem,
                                                            color: occupiedIds
                                                                    .contains(9)
                                                                ? Colors.white
                                                                : Color
                                                                    .fromARGB(
                                                                        255,
                                                                        59,
                                                                        165,
                                                                        47),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  // Tambahkan widget lainnya di sini sesuai kebutuhan
                                                ],
                                              );
                                            }
                                          },
                                        ),
                                        FutureBuilder<List<int>>(
                                          future: _occupiedSpots,
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              return CircularProgressIndicator();
                                            } else if (snapshot.hasError) {
                                              return Text(
                                                  'Error: ${snapshot.error}');
                                            } else {
                                              List<int> occupiedIds =
                                                  snapshot.data!;

                                              return Stack(
                                                children: [
                                                  Positioned(
                                                    left: 4 * fem,
                                                    top: 154 * fem,
                                                    child: Container(
                                                      width: 89 * fem,
                                                      height: 33 * fem,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Color(
                                                                0xffa9bb86)),
                                                        color: occupiedIds
                                                                .contains(11)
                                                            ? Color.fromARGB(
                                                                255,
                                                                165,
                                                                47,
                                                                47)
                                                            : Color(0xffffffff),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    10 * fem),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          'B05',
                                                          style: GoogleFonts
                                                              .goldman(
                                                            fontSize: 16 * ffem,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            height: 1.445 *
                                                                ffem /
                                                                fem,
                                                            color: occupiedIds
                                                                    .contains(
                                                                        11)
                                                                ? Colors.white
                                                                : Color
                                                                    .fromARGB(
                                                                        255,
                                                                        59,
                                                                        165,
                                                                        47),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  // Tambahkan widget lainnya di sini sesuai kebutuhan
                                                ],
                                              );
                                            }
                                          },
                                        ),
                                        FutureBuilder<List<int>>(
                                          future: _occupiedSpots,
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              return CircularProgressIndicator();
                                            } else if (snapshot.hasError) {
                                              return Text(
                                                  'Error: ${snapshot.error}');
                                            } else {
                                              List<int> occupiedIds =
                                                  snapshot.data!;

                                              return Stack(
                                                children: [
                                                  Positioned(
                                                    left: 110 * fem,
                                                    top: 20 * fem,
                                                    child: Container(
                                                      width: 89 * fem,
                                                      height: 33 * fem,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Color(
                                                                0xffa9bb86)),
                                                        color: occupiedIds
                                                                .contains(8)
                                                            ? Color.fromARGB(
                                                                255,
                                                                165,
                                                                47,
                                                                47)
                                                            : Color(0xffffffff),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    10 * fem),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          'B02',
                                                          style: GoogleFonts
                                                              .goldman(
                                                            fontSize: 16 * ffem,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            height: 1.445 *
                                                                ffem /
                                                                fem,
                                                            color: occupiedIds
                                                                    .contains(8)
                                                                ? Colors.white
                                                                : Color
                                                                    .fromARGB(
                                                                        255,
                                                                        59,
                                                                        165,
                                                                        47),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  // Tambahkan widget lainnya di sini sesuai kebutuhan
                                                ],
                                              );
                                            }
                                          },
                                        ),
                                        FutureBuilder<List<int>>(
                                          future: _occupiedSpots,
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              return CircularProgressIndicator();
                                            } else if (snapshot.hasError) {
                                              return Text(
                                                  'Error: ${snapshot.error}');
                                            } else {
                                              List<int> occupiedIds =
                                                  snapshot.data!;

                                              return Stack(
                                                children: [
                                                  Positioned(
                                                    left: 4 * fem,
                                                    top: 20 * fem,
                                                    child: Container(
                                                      width: 89 * fem,
                                                      height: 33 * fem,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Color(
                                                                0xffa9bb86)),
                                                        color: occupiedIds
                                                                .contains(7)
                                                            ? Color.fromARGB(
                                                                255,
                                                                165,
                                                                47,
                                                                47)
                                                            : Color(0xffffffff),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    10 * fem),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          'B01',
                                                          style: GoogleFonts
                                                              .goldman(
                                                            fontSize: 16 * ffem,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            height: 1.445 *
                                                                ffem /
                                                                fem,
                                                            color: occupiedIds
                                                                    .contains(7)
                                                                ? Colors.white
                                                                : Color
                                                                    .fromARGB(
                                                                        255,
                                                                        59,
                                                                        165,
                                                                        47),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  // Tambahkan widget lainnya di sini sesuai kebutuhan
                                                ],
                                              );
                                            }
                                          },
                                        ),
                                        FutureBuilder<List<int>>(
                                          future: _occupiedSpots,
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              return CircularProgressIndicator();
                                            } else if (snapshot.hasError) {
                                              return Text(
                                                  'Error: ${snapshot.error}');
                                            } else {
                                              List<int> occupiedIds =
                                                  snapshot.data!;

                                              return Stack(
                                                children: [
                                                  Positioned(
                                                    left: 110 * fem,
                                                    top: 80 * fem,
                                                    child: Container(
                                                      width: 89 * fem,
                                                      height: 33 * fem,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Color(
                                                                0xffa9bb86)),
                                                        color: occupiedIds
                                                                .contains(10)
                                                            ? Color.fromARGB(
                                                                255,
                                                                165,
                                                                47,
                                                                47)
                                                            : Color(0xffffffff),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    10 * fem),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          'B04',
                                                          style: GoogleFonts
                                                              .goldman(
                                                            fontSize: 16 * ffem,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            height: 1.445 *
                                                                ffem /
                                                                fem,
                                                            color: occupiedIds
                                                                    .contains(
                                                                        10)
                                                                ? Colors.white
                                                                : Color
                                                                    .fromARGB(
                                                                        255,
                                                                        59,
                                                                        165,
                                                                        47),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  // Tambahkan widget lainnya di sini sesuai kebutuhan
                                                ],
                                              );
                                            }
                                          },
                                        ),
                                        FutureBuilder<List<int>>(
                                          future: _occupiedSpots,
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              return CircularProgressIndicator();
                                            } else if (snapshot.hasError) {
                                              return Text(
                                                  'Error: ${snapshot.error}');
                                            } else {
                                              List<int> occupiedIds =
                                                  snapshot.data!;

                                              return Stack(
                                                children: [
                                                  Positioned(
                                                    left: 110 * fem,
                                                    top: 154 * fem,
                                                    child: Container(
                                                      width: 89 * fem,
                                                      height: 33 * fem,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Color(
                                                                0xffa9bb86)),
                                                        color: occupiedIds
                                                                .contains(12)
                                                            ? Color.fromARGB(
                                                                255,
                                                                165,
                                                                47,
                                                                47)
                                                            : Color(0xffffffff),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    10 * fem),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          'B06',
                                                          style: GoogleFonts
                                                              .goldman(
                                                            fontSize: 16 * ffem,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            height: 1.445 *
                                                                ffem /
                                                                fem,
                                                            color: occupiedIds
                                                                    .contains(
                                                                        12)
                                                                ? Colors.white
                                                                : Color
                                                                    .fromARGB(
                                                                        255,
                                                                        59,
                                                                        165,
                                                                        47),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  // Tambahkan widget lainnya di sini sesuai kebutuhan
                                                ],
                                              );
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // autogroupk4gb82V (FgSXprJVsiwXYcuNcGk4Gb)
                  margin: EdgeInsets.fromLTRB(
                      54 * fem, 0 * fem, 18.72 * fem, 12 * fem),
                  padding:
                      EdgeInsets.fromLTRB(57 * fem, 0 * fem, 0 * fem, 0 * fem),
                  width: double.infinity,
                  height: 43 * fem,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // group77E5X (6:1021)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 4.23 * fem),
                        width: 34.34 * fem,
                        height: 12.77 * fem,
                        child: Image.asset(
                          'assets/kanan.png',
                          width: 34.34 * fem,
                          height: 12.77 * fem,
                        ),
                      ),
                      Container(
                        // autogroup6kfdk3s (FgSXzbXG5QvPxvW3cw6kfD)
                        padding: EdgeInsets.fromLTRB(
                            14.93 * fem, 17.64 * fem, 0 * fem, 23.36 * fem),
                        height: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // line17GY1 (6:1012)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 11 * fem, 0 * fem),
                              width: 41 * fem,
                              height: 2 * fem,
                              decoration: BoxDecoration(
                                color: Color(0xffa1a1a1),
                              ),
                            ),
                            Container(
                              // line16PsX (6:1011)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 10 * fem, 0 * fem),
                              width: 41 * fem,
                              height: 2 * fem,
                              decoration: BoxDecoration(
                                color: Color(0xffa1a1a1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
