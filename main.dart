import 'dart:convert';
import 'package:appli_api_test/breedDetail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'API',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  Future getCatData() async {
    var uri = Uri.https('catfact.ninja', 'breeds');

    var response = await http.get(uri);
    var jsonData = jsonDecode(response.body);

    List<Breed> breeds = [];
    for (var data in jsonData['data']) {
      Breed breed = Breed(
        data['breed'],
        data['country'],
        data['origin'],
        data['coat'],
        data['pattern'],
      );
      breeds.add(breed);
    }

    return breeds;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('API'),centerTitle: true,backgroundColor: Colors.black,),
        body: Card(
          child: FutureBuilder(
              future: getCatData(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return const Center(
                    child: Text('Loadiiiiiing........'),
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, i) {
                        return ListTile(
                          title: Text(snapshot.data[i].breed),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    BreedDetail(breed: snapshot.data[i])));
                          },
                          subtitle: Text(snapshot.data[i].origin),
                        );
                      });
                }
              }),
        ));
  }
}

class Cat {
  final String fact, facts, breeds;

  Cat(this.fact, this.facts, this.breeds);
}

class Breed {
  final String breed, country, origin, coat, pattern;

  Breed(this.breed, this.country, this.origin, this.coat, this.pattern);
}
