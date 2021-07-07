import 'package:flutter/material.dart';
import 'package:life_expection/constants.dart';
import 'package:life_expection/person.dart';

import 'calculate.dart';

class ResultPage extends StatelessWidget {
  Person person;

  ResultPage({required this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sonuç Sayfası')),
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: Center(
              child: Text(
                'Beklenen Yaşam Süresi: ${Calculate(person: person).calculateLifeExpection()}',
                style: kTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.all(40),
              child: ElevatedButton(
                child: Text(
                  'Geri Dön',
                  style: kTextStyle,
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.stretch,
      ),
    );
  }
}
