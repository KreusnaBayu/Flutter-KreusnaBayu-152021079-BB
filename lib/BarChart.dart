import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({super.key});

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  late List<ChartData> chartData;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse('https://backendparkol-m77laoox7a-uc.a.run.app/average1'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final Map<String, dynamic> data = responseData['data'];

        chartData = [
          ChartData("Minggu", data['Minggu'], 0, 0, 0),
          ChartData("Senin", data['Senin'], 0, 0, 0),
          ChartData("Selasa", data['Selasa'], 0, 0, 0),
          ChartData("Rabu", data['Rabu'], 0, 0, 0),
          ChartData("Kamis", data['Kamis'], 0, 0, 0),
          ChartData("Jumat", data['Jumat'], 0, 0, 0),
          ChartData("Sabtu", data['Sabtu'], 0, 0, 0),
        ];

        setState(() {});
      } else {
        throw Exception('Failed to load average data. Error: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching average data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Immobile',
          style: GoogleFonts.goldman(fontSize: 25.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff1450A3),
      ),
      body: Center(
        child: Container(
          child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            series: <ChartSeries>[
              StackedColumnSeries<ChartData, String>(
                dataSource: chartData,
                xValueMapper: (ChartData ch, _) => ch.x,
                yValueMapper: (ChartData ch, _) => ch.y1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChartData {
  final String x;
  final int y1;
  final int y2;
  final int y3;
  final int y4;

  ChartData(this.x, this.y1, this.y2, this.y3, this.y4);
}
