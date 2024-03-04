import 'package:flutter/material.dart';
import 'package:smtm/features/all_securities/models/ticker_detail_model.dart';
import 'package:smtm/features/security_details/pages/security_details.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TrackerContainer extends StatelessWidget {
  TrackerContainer({Key? key, required this.trackerdata});

  final TickerDetailModel trackerdata;

  final List<StockData> chartData = [
    StockData(DateTime(2023, 1, 1), 50.0),
    StockData(DateTime(2023, 2, 1), 55.0),
    StockData(DateTime(2023, 3, 1), 60.0),
    StockData(DateTime(2023, 4, 1), 65.0),
    StockData(DateTime(2023, 5, 1), 70.0),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SecurityDetails(
                      tickerId: trackerdata.ticker!,
                    )));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 86,
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 231, 217, 217),
          borderRadius:
              BorderRadius.circular(10), // Set your desired background color
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(
                  0.3), // You can adjust the color and opacity here
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 0), // changes the position of the shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    trackerdata.ticker!,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  Container(
                    child: Text(
                      trackerdata.tickerName!,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "${trackerdata.pointChange!} Rs.",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                  Text(
                    '${trackerdata.percentageChange} %',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class StockData {
  StockData(this.year, this.sales);
  final DateTime year;
  final double sales;
}
