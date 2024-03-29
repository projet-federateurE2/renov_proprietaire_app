import 'package:flutter/material.dart';
import 'package:renov_proprietaire_app/values/colors.dart';
import 'package:renov_proprietaire_app/views/pages/work_type_selection_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renov_proprietaire_app/blocs/work_selection/select_work_bloc.dart';

void main() {
  runApp(
  MultiBlocProvider(providers: [
    BlocProvider<SelectWorkBloc>(create: (_) => SelectWorkBloc())
  ], child: const MyApp()
  ),
);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App renov',
      theme: ThemeData(fontFamily: 'Poppins', primaryColor: ColorsRenov.primaryGreen),
      home: const WorkTypeSelectionPage(),
    );
  }
}
