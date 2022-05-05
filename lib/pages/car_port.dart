import 'package:aaxep/widgets/footer.dart';
import 'package:flutter/material.dart';

import '../layout/device.dart';
import 'for_enterprise.dart';
import 'hero.dart';
import 'people_say.dart';
import 'steps.dart';
import 'we_offer.dart';

class CarPort extends StatefulWidget {
  const CarPort({Key? key}) : super(key: key);

  @override
  _CarPortState createState() => _CarPortState();
}

class _CarPortState extends State<CarPort> {
  @override
  Widget build(BuildContext context) {
    return Device(
        desktop: ListView(children: const [HeroSection(), StepSection(), WeOfferSection(), PeopleSay(), ForEnterpriseSection(), Footer()]),
        mobile: ListView(children: const [HeroSection(), WeOfferSection(), PeopleSay(), Footer()]));
  }
}
