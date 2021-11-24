import 'package:aaxep/config/theme.dart';
import 'package:aaxep/layout/device.dart';
import 'package:blobs/blobs.dart';
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
    return Device(desktop: _getEstimate());
  }

  Widget _getEstimate() => Column(children: [
  Container(
  decoration: const BoxDecoration(
  image: DecorationImage(
      image: AssetImage(AaxepTheme.truckImg),
  fit: BoxFit.cover,
  colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken),
  )),
  child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, crossAxisAlignment: CrossAxisAlignment.center, children: [Card(
      margin: EdgeInsets.symmetric(vertical: Device.grid(context) * 1.5, horizontal: Device.grid(context)),
      child: Container(
        constraints: BoxConstraints(maxWidth: Device.grid(context) * 4),
        padding: EdgeInsets.all(Device.margin(context)),
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FormField<String>(builder: (state) {
                  return InputDecorator(
                    decoration: const InputDecoration(),
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
                SizedBox(height: Device.margin(context)),
                TextFormField(
                    decoration: const InputDecoration(labelText: 'PickUp Address'),
                    validator: (value) {
                      return value == null ? 'PickUp address can\'t be empty' : null;
                    }),
                SizedBox(height: Device.margin(context)),
                TextFormField(
                    decoration: const InputDecoration(labelText: 'DropOff Address'),
                    validator: (value) {
                      return value == null ? 'DropOff address can\'t be empty' : null;
                    }),
                SizedBox(height: Device.margin(context)),
                TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                    ],
                    decoration: const InputDecoration(prefixText: '+91', labelText: 'Mobile Number'),
                    validator: (value) {
                      return value == null ? 'Mobile Number can\'t be empty' : null;
                    }),
                SizedBox(height: Device.margin(context)),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Name (Optional)'),
                ),
                SizedBox(height: Device.margin(context)),
                FormField<String>(builder: (state) {
                  return InputDecorator(
                    decoration: const InputDecoration(),
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
                SizedBox(height: Device.margin(context)),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(elevation: 0),
                  onPressed: () {},
                  child: const Text('Get Estimate'),
                ),
                SizedBox(height: Device.margin(context) * 0.4)
              ],
            )),
      ))]))
  ]);
}
