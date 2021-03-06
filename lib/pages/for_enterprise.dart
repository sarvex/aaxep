import 'package:aaxep/config/theme.dart';
import 'package:aaxep/layout/device.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ForEnterpriseSection extends StatelessWidget {
  const ForEnterpriseSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Device(desktop: _desktop(context), mobile: _mobile(context));
  }

  Widget _desktop(context) => Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: Device.grid(context) * 0.5, horizontal: Device.grid(context) * 2),
      child: Column(
        children: [..._heading(context), _contentDesktop(context)],
      ));

  Widget _mobile(context) => Container(
      color: Colors.white,
      padding: EdgeInsets.all(Device.margin(context)),
      child: Column(
        children: [..._heading(context), _contentMobile(context)],
      ));

  List<Widget> _heading(context) => [
        Text('For Enterprise', style: Theme.of(context).textTheme.headline3),
        SizedBox(width: Device.margin(context) * 3, child: const Divider(color: AaxepTheme.primary, thickness: 5)),
        SizedBox(height: Device.column(context)),
      ];

  Widget _contentDesktop(context) => Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Expanded(flex: 5, child: Center(child: Lottie.asset(AaxepTheme.enterprise, height: Device.height(context) * 0.35, fit: BoxFit.contain))),
        Expanded(
            flex: 5,
            child: Container(
                width: 350,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Padding(
                      padding: EdgeInsets.all(Device.margin(context)),
                      child: const Text(
                        'Porter offers the most efficient and time bound logistic services for businesses. With our huge fleet of vehicles we take care of your peak business requirements and bulk booking challenges. Clients also benefit from significant cost savings and improved SLA.',
                        style: TextStyle(fontSize: 15, height: 1.64),
                      )),
                  Padding(
                      padding: EdgeInsets.all(Device.margin(context)),
                      child: SizedBox(
                          height: 50,
                          child: ElevatedButton.icon(
                              onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios_sharp, size: 13), label: const Text('Know More'))))
                ])))
      ]);

  Widget _contentMobile(context) => Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    Center(child: Lottie.asset(AaxepTheme.enterprise, height: Device.height(context) * 0.35, fit: BoxFit.contain)),
    SizedBox(
        width: 350,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.all(Device.margin(context)),
              child: const Text(
                'Porter offers the most efficient and time bound logistic services for businesses. With our huge fleet of vehicles we take care of your peak business requirements and bulk booking challenges. Clients also benefit from significant cost savings and improved SLA.',
                style: TextStyle(fontSize: 15, height: 1.64),
              )),
          Padding(
              padding: EdgeInsets.all(Device.margin(context)),
              child: SizedBox(
                  height: 50,
                  child: ElevatedButton.icon(
                      onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios_sharp, size: 13), label: const Text('Know More'))))
        ]))
  ]);
}
