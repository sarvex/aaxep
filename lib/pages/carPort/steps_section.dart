import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../config/colors.dart';
import '../../config/lottie_json.dart';
import '../../layout/device.dart';

class StepSection extends StatelessWidget {
  const StepSection({Key? key}) : super(key: key);

  static const _steps = {
    'Pick up and drop anywhere within India': 'Choose your pickup & drop location from within the city',
    'Choose vehicle of your choice': 'Get quotes for vehicles which can carry from 20 kgs to 2000 kgs and book instantly without any waiting',
    'Real time tracking':
        'Our verified partner will ensure that your goods are transported safely to the destination. You can monitor the trip with live vehicle tracking and regular sms/email updates from our MOBILE APP or TRACK ORDER HERE.'
  };

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: Device.grid(context) * 0.5, horizontal: Device.grid(context) * 2),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Expanded(
            flex: 5,
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _steps.length,
                itemBuilder: (context, index) => ListTile(
                      minVerticalPadding: 10,
                      leading: CircleAvatar(
                          radius: Device.grid(context),
                          backgroundColor: kAaxepLightGreen,
                          child: Text(
                            '${index + 1}',
                            style: const TextStyle(color: kAaxepGreen),
                          )),
                      title: Text(_steps.keys.elementAt(index), style: Theme.of(context).textTheme.headline5),
                      subtitle: Padding(
                        padding: EdgeInsets.symmetric(vertical: Device.margin(context)),
                        child: Text(_steps.values.elementAt(index)),
                      ),
                    )),
          ),
          Expanded(flex: 5, child: Center(child: Lottie.asset(LottieJson.navigation, height: Device.height(context) * 0.5, fit: BoxFit.contain)))
        ]));
  }
}
