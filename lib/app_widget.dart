import 'package:entendendo_bloc/search_cep/search_cep_module.dart';
import 'package:flutter/material.dart';

import 'search_cep/search_cep_view.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    initSearchCepModule();
    super.initState();
  }

  @override
  void dispose() {
    disposeSearchCepModule();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Entendendo Bloc',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SearchCepView(),
    );
  }
}
