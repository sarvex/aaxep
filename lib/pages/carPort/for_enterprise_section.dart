import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../config/colors.dart';
import '../../config/lottie_json.dart';
import '../../layout/device.dart';

class ForEnterpriseSection extends StatelessWidget {
  const ForEnterpriseSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: kAaxepLightWhiteBg,
        padding: EdgeInsets.symmetric(vertical: Device.grid(context) * 0.5, horizontal: Device.grid(context) * 2),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child:  Container(
                width: 350,
                child: Column(children: [
                    SizedBox(width: Device.grid(context) * 4, child: Lottie.asset(LottieJson.enterprise)),
                    Padding(
                      padding: EdgeInsets.all(Device.margin(context)),
                      child: Text('For Enterprise', style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.bold)),
                    ),
                  Padding(
                    padding: EdgeInsets.all(Device.margin(context)),
                    child: Text(
                          'Porter offers the most efficient and time bound logistic services for businesses. With our huge fleet of vehicles we take care of your peak business requirements and bulk booking challenges. Clients also benefit from significant cost savings and improved SLA.', style: Theme.of(context).textTheme.bodyText1),
                  ),
                  Padding(padding: EdgeInsets.all(Device.margin(context)), child: SizedBox(height: 50, child: ElevatedButton.icon(onPressed: (){}, icon: const Icon(Icons.arrow_forward_ios_sharp, size: 13), label: const Text('Know More'))))
                  ]),
              ),
              ),
          ],
        ),
        );
  }
}
