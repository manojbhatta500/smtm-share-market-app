import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smtm/features/security_details/bloc/security_details_bloc.dart';

class SecurityDetails extends StatefulWidget {
  const SecurityDetails({Key? key, required this.tickerId}) : super(key: key);

  final String tickerId;

  @override
  State<SecurityDetails> createState() => _SecurityDetailsState();
}

class _SecurityDetailsState extends State<SecurityDetails> {
  @override
  void initState() {
    BlocProvider.of<SecurityDetailsBloc>(context)
        .add(FetchSecurityDetailEvent(tickerdata: widget.tickerId));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Security"),
          actions: const [
            Icon(Icons.info),
            SizedBox(width: 10),
            Icon(Icons.remove_red_eye_rounded),
            SizedBox(width: 10),
            Icon(Icons.notification_add),
            SizedBox(width: 10),
            Icon(Icons.today_outlined),
            SizedBox(width: 10),
          ],
        ),
        body: BlocBuilder<SecurityDetailsBloc, SecurityDetailsState>(
          builder: (context, state) {
            switch (state.runtimeType) {
              case SecurityDetailsInitial:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case SecurityDetailFaliureState:
                return const Text("the error state is emited");

              case SecurityDetailsLoadingState:
                return const Center(
                  child: CircularProgressIndicator(),
                );

              case SecurityDetailsSuccessstate:
                final dataState = state as SecurityDetailsSuccessstate;
                final listData = dataState.individualTrackerData[0];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 30),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 231, 217, 217),
                        borderRadius: BorderRadius.circular(
                            10), // Set your desired background color
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(
                                0.3), // You can adjust the color and opacity here
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 0), // changes the position of the shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            listData.ticker!,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            listData.tickerName!,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "Sector : ${listData.indices!}",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 30),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 231, 217, 217),
                        borderRadius: BorderRadius.circular(
                            10), // Set your desired background color
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(
                                0.3), // You can adjust the color and opacity here
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 0), // changes the position of the shadow
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "volume: ${listData.volume.toString()}",
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                "amount: ${listData.amount}",
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                "previousClosing: ${listData.previousClosing}",
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                "percentage change: ${listData.pointChange}",
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "LTP :  ${listData.ltp.toString()}",
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                "Low:${listData.low}",
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                "Open:${listData.open}",
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                "High:${listData.high}",
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Tab bar and tab views
                    TabBar(
                      tabs: [
                        Tab(text: '1 Month'),
                        Tab(text: '3 Month'),
                        Tab(text: '1 Year'),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          Container(
                            child: Center(child: Text('1 Month')),
                          ),
                          Container(
                            child: Center(child: Text('3 Months')),
                          ),
                          Container(
                            child: Center(child: Text('1 Year')),
                          ),
                        ],
                      ),
                    ),
                  ],
                );

              default:
                return const Text('this is not a state');
            }
          },
        ),
      ),
    );
  }
}
