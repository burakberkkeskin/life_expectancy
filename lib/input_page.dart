import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:life_expection/constants.dart';
import 'package:life_expection/result_page.dart';

import 'person.dart';
import 'GenderWidget.dart';
import 'MyContainer.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Person person = Person();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    child: buildRow('Boy', person.height),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    child: buildRow('Kilo', person.weight),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Haftada Kaç Gün Spor Yapıyorsunuz?', style: kTextStyle),
                  Text(person.sporDayCount.round().toString(),
                      style: kNumberStyle),
                  Slider(
                    min: 0,
                    max: 7,
                    value: person.sporDayCount,
                    divisions: 7,
                    onChanged: (double newValue) {
                      setState(() {
                        person.sporDayCount = newValue;
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Günde Kaç Sigara İçiyorsunuz?', style: kTextStyle),
                  Text(person.cigaretteCount.round().toString(),
                      style: kNumberStyle),
                  Slider(
                    min: 0,
                    max: 30,
                    value: person.cigaretteCount,
                    onChanged: (double newValue) {
                      setState(() {
                        person.cigaretteCount = newValue;
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        person.selectedGender = 'kadın';
                      });
                    },
                    child: MyContainer(
                      newColor: person.selectedGender == 'kadın'
                          ? Colors.pink
                          : Colors.blueGrey,
                      child: GenderWidget(
                          gender: 'Kadın',
                          icon: Icon(
                            FontAwesomeIcons.venus,
                            size: 50,
                            color: Colors.yellow,
                          )),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        person.selectedGender = 'erkek';
                      });
                    },
                    child: MyContainer(
                      newColor: person.selectedGender == 'erkek'
                          ? Colors.blue
                          : Colors.blueGrey,
                      child: GenderWidget(
                        gender: 'Erkek',
                        icon: Icon(
                          FontAwesomeIcons.mars,
                          color: Colors.yellow,
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(
                                person: person,
                              )));
                },
                child: Text('Hesapla', style: kTextStyle),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                )),
          ),
        ],
      ),
    );
  }

  Row buildRow(String text, int number) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotatedBox(
          child: Text(text, style: kTextStyle),
          quarterTurns: 3,
        ),
        SizedBox(
          width: 10,
        ),
        RotatedBox(
          child: Text(number.toString(), style: kNumberStyle),
          quarterTurns: 3,
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTheme(
              minWidth: 10,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    text == 'Boy' ? person.height++ : person.weight++;
                  });
                },
                child: Icon(
                  FontAwesomeIcons.plus,
                  size: 15,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  text == 'Boy' ? person.height-- : person.weight--;
                });
              },
              child: Icon(
                FontAwesomeIcons.minus,
                size: 15,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
