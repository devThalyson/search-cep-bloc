import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'search_cep_bloc.dart';
import 'search_cep_state.dart';

class SearchCepView extends StatefulWidget {
  const SearchCepView({Key? key}) : super(key: key);

  @override
  _SearchCepViewState createState() => _SearchCepViewState();
}

class _SearchCepViewState extends State<SearchCepView> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.all(
          10,
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Cep',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                GetIt.I<SearchCepBloc>().add(textController.text);
              },
              child: Text('Pesquisar'),
            ),
            SizedBox(
              height: 10,
            ),
            BlocBuilder<SearchCepBloc, SearchCepState>(
              bloc: GetIt.I<SearchCepBloc>(),
              builder: (context, state) {
                if (state is SearchCepError) {
                  return Text(
                    state.message,
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  );
                }

                if (state is SearchCepLoading) {
                  return Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                state = state as SearchCepSucess;

                if (state.data.isEmpty) {
                  return Container();
                }

                return Text("Cidade: ${state.data['localidade']}");
              },
            ),
          ],
        ),
      ),
    );
  }
}
