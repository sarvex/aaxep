import 'package:aaxep/config/theme.dart';
import 'package:flutter/material.dart';

import '../../layout/device.dart';
import '../../layout/feedback_card.dart';

class PeopleSay extends StatelessWidget {
  const PeopleSay({Key? key}) : super(key: key);

  static const _peopleSayText = {
    'Tara':
        'Way better than naaka waalas. Have shifted all my logistics needs to Porter and I can now safely focus on my business growth. Amazing service!',
    'Bhavya':
        'Excellent service by multiple drivers. I own a business and do multiple shiftings. Rather than ask local drivers and bargain every time, I use porter which fulfils all my need. Thanks a lot',
    'Apoorva':
        'Have had an amazing experience. Had three successful deliveries where it’s a struggle to arrange a tempo service for your desired pickup and drop off. Must try this app!',
    'Naisha':
        'Way better than naaka waalas. Have shifted all my logistics needs to Porter and I can now safely focus on my business growth. Amazing service!'
  };
  static const _peopleSatImgAndIcon = {
    'https://www.edarabia.com/wp-content/uploads/2015/11/7-ways-to-become-the-person-everyone-respects.jpg':
        Icons.format_quote,
    'https://mlhmvq6amqed.i.optimole.com/HIId8M4.WANK~27a14/w:940/h:788/q:auto/https://hackspirit.com/wp-content/uploads/2021/06/Copy-of-Copy-of-Copy-of-Rustic-Female-Teen-Magazine-Cover-52.jpg':
        Icons.format_quote,
    'https://thumbs.dreamstime.com/b/best-coffee-her-routine-sensual-girl-drinking-her-favorite-morning-coffee-pretty-woman-drinking-fresh-hot-coffee-160848126.jpg':
        Icons.format_quote,
    'https://images.unsplash.com/photo-1630568119734-1f6df1cd1669?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8aG90JTIwZ2lybHN8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80':
        Icons.format_quote,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: Device.grid(context) * 0.5, horizontal: Device.grid(context) * 2),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Text('What people say', style: Theme.of(context).textTheme.headline3),
          SizedBox(width: Device.margin(context) * 3, child: const Divider(color: AaxepTheme.primary, thickness: 5)),
          Padding(
            padding: EdgeInsets.symmetric(vertical: Device.column(context)),
            child: IntrinsicHeight(
                child: Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: Device.column(context),
                    runSpacing: Device.margin(context),
                    children: List.generate(
                        _peopleSayText.length,
                        (index) => FeedbackCard(
                            icon: _peopleSatImgAndIcon.values.elementAt(index),
                            body: _peopleSayText.values.elementAt(index),
                            title: _peopleSayText.keys.elementAt(index),
                            img: _peopleSatImgAndIcon.keys.elementAt(index))))),
          )
        ]));
  }
}
