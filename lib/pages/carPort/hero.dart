import 'package:aaxep/config/theme.dart';
import 'package:aaxep/layout/device.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({Key? key}) : super(key: key);

  @override
  _HeroSectionState createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  final List<Tab> myTabs = const [
    Tab(text: 'Car Port'),
    Tab(text: 'Transportation Partner'),
    Tab(text: 'Home Pick & Drop'),
    Tab(text: 'For Enterprise')
  ];
  late String _currentSelectedCity, _currentSelectedRequirement;
  final List<String> _city = ['Delhi', 'Mumbai', 'Pune', 'Chandigarh', 'Noida', 'Gurgaon', 'Bangalore', 'Hyderabad'];
  final List<String> _requirement = ['Personal', 'Business'];
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _currentSelectedCity = '';
    _currentSelectedRequirement = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Stack(children: [
        Lottie.asset(AaxepTheme.truck, width: double.infinity, height: Device.height(context) * 0.9, fit: BoxFit.fill),
        _getEstimate()
      ])
    ]);
  }

  Widget _getEstimate() => Center(
      child: Card(
          margin: EdgeInsets.symmetric(vertical: Device.grid(context) * 1.5, horizontal: Device.grid(context)),
          child: Form(
              key: _formKey,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                      child: Container(
                    constraints: BoxConstraints(maxWidth: Device.grid(context) * 1.8),
                    child: FormField<String>(builder: (state) {
                      return InputDecorator(
                        decoration: const InputDecoration(border: InputBorder.none),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            hint: const Text('City', style: TextStyle(fontSize: 12)),
                            style: const TextStyle(fontSize: 13),
                            iconEnabledColor: Colors.black54,
                            iconDisabledColor: Colors.black54,
                            value: _currentSelectedCity.isEmpty ? null : _currentSelectedCity,
                            isDense: true,
                            onChanged: (value) {
                              setState(() {
                                _currentSelectedCity = value!;
                                state.didChange(value);
                              });
                            },
                            items: _city.map((value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    }),
                  )),
                  SizedBox(
                      height: Device.margin(context) * 2.7, child: const VerticalDivider(color: AaxepTheme.darkGrey)),
                  Flexible(
                      child: TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'PickUp Address', border: InputBorder.none, focusedBorder: InputBorder.none),
                          validator: (value) {
                            return value == null ? 'PickUp address can\'t be empty' : null;
                          })),
                  SizedBox(
                      height: Device.margin(context) * 2.7, child: const VerticalDivider(color: AaxepTheme.darkGrey)),
                  Flexible(
                      child: TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'DropOff Address', border: InputBorder.none, focusedBorder: InputBorder.none),
                          validator: (value) {
                            return value == null ? 'DropOff address can\'t be empty' : null;
                          })),
                  SizedBox(
                      height: Device.margin(context) * 2.7, child: const VerticalDivider(color: AaxepTheme.darkGrey)),
                  Flexible(
                      child: TextFormField(
                          inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                      ],
                          decoration: const InputDecoration(
                            prefixText: '+91',
                            labelText: 'Mobile Number',
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                          validator: (value) {
                            return value == null ? 'Mobile Number can\'t be empty' : null;
                          })),
                  SizedBox(
                      height: Device.margin(context) * 2.7, child: const VerticalDivider(color: AaxepTheme.darkGrey)),
                  Flexible(
                      child: TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Name (Optional)', border: InputBorder.none, focusedBorder: InputBorder.none),
                  )),
                  SizedBox(
                      height: Device.margin(context) * 2.7, child: const VerticalDivider(color: AaxepTheme.darkGrey)),
                  Flexible(
                      child: Container(
                    constraints: BoxConstraints(maxWidth: Device.grid(context) * 1.8),
                    child: FormField<String>(builder: (state) {
                      return InputDecorator(
                        decoration: const InputDecoration(border: InputBorder.none),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            hint: const Text('Requirement', style: TextStyle(fontSize: 12)),
                            iconEnabledColor: Colors.black54,
                            iconDisabledColor: Colors.black54,
                            value: _currentSelectedRequirement.isEmpty ? null : _currentSelectedRequirement,
                            style: const TextStyle(fontSize: 13),
                            isDense: true,
                            onChanged: (value) {
                              setState(() {
                                _currentSelectedRequirement = value!;
                                state.didChange(value);
                              });
                            },
                            items: _requirement.map((value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    }),
                  )),
                  SizedBox(
                      height: Device.margin(context) * 2.7, child: const VerticalDivider(color: AaxepTheme.darkGrey)),
                  Flexible(
                      child: SizedBox(
                          height: Device.margin(context) * 2.4,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(elevation: 0),
                            onPressed: () {},
                            child: const Text('Get Estimate'),
                          ))),
                  SizedBox(width: Device.margin(context) * 0.4)
                ],
              ))));
}
