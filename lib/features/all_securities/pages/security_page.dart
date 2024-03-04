import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smtm/features/all_securities/ticker_bloc/ticker_bloc_bloc.dart';
import 'package:smtm/features/all_securities/ticker_bloc/ticker_bloc_state.dart';
import 'package:smtm/features/all_securities/widgets/tracker_container.dart';

class TickerPage extends StatefulWidget {
  const TickerPage({super.key});

  @override
  State<TickerPage> createState() => _TickerPageState();
}

class _TickerPageState extends State<TickerPage> {
  @override
  void initState() {
    BlocProvider.of<TickerBlocBloc>(context).add(FetchAllTickerEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.width;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("WatchList"),
        actions: [
          Text(
            "%",
            style: TextStyle(color: Colors.amber),
          ),
          SizedBox(
            width: 10,
          ),
          Text('Rs'),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: BlocBuilder<TickerBlocBloc, TickerBlocState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case TickerBlocFailedState:
              return Center(
                child: Text('failed state'),
              );
            case TickerBlocLoadingState:
              return Center(
                child: CircularProgressIndicator(),
              );
            case TickerBlocSuccessState:
              final trackerData = state as TickerBlocSuccessState;
              return ListView.builder(
                  itemCount: trackerData.tickerModelState.length,
                  itemBuilder: (BuildContext context, index) {
                    return TrackerContainer(
                        trackerdata: trackerData.tickerModelState[index]);
                  });

            default:
              return Center(
                child: CircularProgressIndicator(),
              );
          }
        },
      ),
    );
  }
}
