import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_file/provider_json/model.dart';

class PokemonPage extends StatelessWidget {
  const PokemonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<NewData>().fetchData;
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: Center(
          child: Consumer<NewData>(
            builder: (context, value, child) {
              return value.map.isEmpty && !value.error
                  ? const CircularProgressIndicator()
                  : value.error
                      ? Text(
                          'Something went wrong. ${value.errorMessage}',
                          textAlign: TextAlign.center,
                        )
                      : ListView.builder(
                          itemCount: value.map['results'].length,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 10,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${value.map['results'][index]['name']}'),
                                    // Image.network('${value.map['results'][index]['url']}')
                                  ],
                                ),
                              ),
                            );
                          });
            },
          ),
        ),
      ),
    );
  }
}
