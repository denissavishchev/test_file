import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_file/provider_json/model.dart';

class PokemonPage extends StatelessWidget {
  const PokemonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Magic')),
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: Center(
          child: Consumer<NewData>(
            builder: (context, value, child) {
              return FutureBuilder<Data>(
                future: context.read<NewData>().fetchData,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            var data = snapshot.data!.cards.map((e) => e.name).toList();
                            return ListView.builder(
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                    elevation: 10,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(data[index]),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          }else if (snapshot.hasError) {
                            return Text('error');
                          }
                          return const CircularProgressIndicator();
                        });
            },
          ),
        ),
      ),
    );
  }
}
