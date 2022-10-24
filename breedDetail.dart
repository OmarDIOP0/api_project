import 'package:appli_api_test/main.dart';
import 'package:flutter/material.dart';

class BreedDetail extends StatelessWidget {
  final Breed breed;
  const BreedDetail({Key? key,required this.breed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Detail de l API')),
      body:Center(
    child: Column(
    children: [
        Text(breed.breed),
        Text(breed.coat),
        Text(breed.country),
        Text(breed.pattern),
        Text(breed.origin),
      ],
    ),
    ),

    );
  }
}
