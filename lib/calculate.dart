import 'package:life_expection/person.dart';

class Calculate {
  Person person;

  Calculate({required this.person});

  int calculateLifeExpection() {
    double life;
    int total;
    life = 90 +
        person.sporDayCount -
        person.cigaretteCount +
        (person.height / person.weight);
    person.selectedGender == 'kadın' ? life += 3 : life--;
    total = life.round();

    return total;
  }
}
