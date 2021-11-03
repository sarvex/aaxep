import 'package:flutter/material.dart';

import '../../config/colors.dart';
import '../../layout/device.dart';

class WeOfferSection extends StatelessWidget {
  const WeOfferSection({Key? key}) : super(key: key);

  static const _weOfferText = {
    'Hassle-Free truck rental': 'Book mini truck online. Whenever you need, wherever you need',
    'Transparent Pricing': 'Enjoy the most affordable rates in town with our transparent pricing',
    'Realtime Tracking': 'Track your goods movement across the city with our app',
    'Safe and Reliable Trucks': 'Superior safety ensured with our team of verified & trained partners'
  };

  static const _weOfferIcons = [Icons.mobile_friendly, Icons.receipt_long, Icons.gps_fixed, Icons.local_shipping];

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        color: kAaxepLightWhiteBg,
        padding: EdgeInsets.symmetric(vertical: Device.grid(context) * 0.5, horizontal: Device.grid(context) * 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('What we offer', style: Theme.of(context).textTheme.headline3),
            SizedBox(width: Device.margin(context) * 3, child: const Divider(color: kAaxepPrimary, thickness: 5)),
            Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: Device.column(context),
                children: List.generate(
                    _weOfferIcons.length,
                    (index) => _weOfferContainer(context,
                        title: _weOfferText.keys.elementAt(index), subTitle: _weOfferText.values.elementAt(index), icon: _weOfferIcons[index])))
          ],
        ));
  }

  Widget _weOfferContainer(context, {required String title, required String subTitle, required IconData icon}) => Container(
      width: Device.grid(context) * 3,
      padding: EdgeInsets.symmetric(vertical: Device.margin(context) * 2),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        CircleAvatar(
            radius: Device.grid(context),
            backgroundColor: kAaxepPrimary.withOpacity(0.2),
            child: Icon(icon, size: Device.grid(context), color: Colors.black54)),
        Padding(
            padding: EdgeInsets.symmetric(vertical: Device.margin(context) * 1.5),
            child: Text(title, style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.bold, color: Colors.black54))),
        Text(subTitle, style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.black54), textAlign: TextAlign.center)
      ]));
}
