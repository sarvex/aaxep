import 'package:aaxep/config/theme.dart';
import 'package:flutter/material.dart';

import '../layout/device.dart';

class FeedbackCard extends StatelessWidget {
  const FeedbackCard(
      {Key? key, required this.img, required this.title, required this.icon, required this.body, this.width = 290})
      : super(key: key);

  final String img;
  final String title;
  final String body;
  final IconData icon;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        child: Card(
            semanticContainer: true,
            child: Padding(
              padding: EdgeInsets.all(Device.margin(context)),
              child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Icon(icon, color: AaxepTheme.darkGrey, size: Device.margin(context) * 2),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: Device.margin(context)),
                  child: Text(body, textAlign: TextAlign.center),
                ),
                Text(title, style: Theme.of(context).textTheme.headline6!.copyWith(color: AaxepTheme.deepBlack)),
                SizedBox(height: Device.margin(context)),
                CircleAvatar(radius: 54, backgroundImage: NetworkImage(img))
              ]),
            )));
  }
}
