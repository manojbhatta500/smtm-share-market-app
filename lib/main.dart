import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smtm/features/all_securities/pages/security_page.dart';
import 'package:smtm/features/all_securities/ticker_bloc/ticker_bloc_bloc.dart';
import 'package:smtm/features/security_details/bloc/security_details_bloc.dart';
import 'package:smtm/features/security_details/pages/security_details.dart'; // Import BlocProvider from flutter_bloc

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TickerBlocBloc(),
        ),
        BlocProvider(
          create: (context) => SecurityDetailsBloc(),
        ),
      ],
      child: MaterialApp(
        home: TickerPage(),
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
