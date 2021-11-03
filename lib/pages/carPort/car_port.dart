import 'package:flutter/material.dart';

import '../../layout/footer.dart';
import 'for_enterprise_section.dart';
import 'hero.dart';
import 'people_say.dart';
import 'steps_section.dart';
import 'we_offer.dart';

class CarPort extends StatefulWidget {
  const CarPort({Key? key}) : super(key: key);

  @override
  _CarPortState createState() => _CarPortState();
}

class _CarPortState extends State<CarPort> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: const [
          HeroSection(),
          StepSection(),
          WeOfferSection(),
          PeopleSay(),
          ForEnterpriseSection(),
          Footer()
        ]));
  }
}
