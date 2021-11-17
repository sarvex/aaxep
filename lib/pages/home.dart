import 'dart:ui';

import 'package:aaxep/config/theme.dart';
import 'package:aaxep/layout/device.dart';
import 'package:aaxep/pages/car_port.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = const [
    Tab(text: 'Car Port'),
    Tab(text: 'Transportation Partner'),
    Tab(text: 'Home Pick & Drop'),
    Tab(text: 'For Enterprise')
  ];

  final _tabView = const [CarPort(), CarPort(), CarPort(), CarPort()];
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: myTabs.length);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _appbar(), body: _body());
  }

  PreferredSizeWidget _appbar() => AppBar(
      automaticallyImplyLeading: false,
      title: Padding(
          padding: EdgeInsets.symmetric(horizontal: Device.column(context)),
          child: Image.asset(AaxepTheme.logo, height: 50)),
      actions: [
        Padding(
            padding:
                EdgeInsets.symmetric(vertical: Device.margin(context) * 0.18, horizontal: Device.margin(context) * 2),
            child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.person_add),
                label: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Device.margin(context) * 0.5),
                  child: const Text('JOIN US'),
                ))),
        TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.call, color: AaxepTheme.primary, size: Dimension.padding * 5),
            label: const Text('+91 98099 99044',
                style: TextStyle(color: AaxepTheme.primary, fontWeight: FontWeight.bold))),
        SizedBox(width: Device.column(context))
      ],
      bottom: PreferredSize(
          preferredSize: Size(Device.width(context), Device.margin(context) * 2.5),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Device.column(context)),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              SizedBox(
                  width: Device.width(context) * 0.6,
                  child: TabBar(
                    controller: _tabController,
                    tabs: myTabs,
                  )),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Device.margin(context)),
                    child: TextButton(
                        onPressed: () {},
                        child: const Text('Support',
                            style: TextStyle(color: AaxepTheme.deepBlack, fontWeight: FontWeight.bold))),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text('Track order',
                          style: TextStyle(color: AaxepTheme.deepBlack, fontWeight: FontWeight.bold))),
                ],
              ),
            ]),
          )));

  Widget _body() => TabBarView(controller: _tabController, children: _tabView.map((view) => view).toList());
}
