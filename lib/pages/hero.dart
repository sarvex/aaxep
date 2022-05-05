import 'package:aaxep/config/theme.dart';
import 'package:aaxep/layout/device.dart';
import 'package:blobs/blobs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
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
  final _formKey = GlobalKey<FormBuilderState>();

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
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, crossAxisAlignment: CrossAxisAlignment.center, children: [
              Card(
                  margin: EdgeInsets.symmetric(vertical: Device.grid(context) * 1.5, horizontal: Device.grid(context)),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: Device.grid(context) * 4),
                    padding: EdgeInsets.all(Device.margin(context)),
                    child: FormBuilder(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FormBuilderDropdown(
                                name: 'city',
                                validator: FormBuilderValidators.required(context),
                                decoration: const InputDecoration(labelText: 'City', iconColor: Colors.black87),
                                items: _city.map((value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList()),
                            SizedBox(height: Device.margin(context)),
                            FormBuilderTextField(
                              decoration: const InputDecoration(labelText: 'PickUp Address'),
                              validator: FormBuilderValidators.required(context),
                              name: 'pickup_address',
                            ),
                            SizedBox(height: Device.margin(context)),
                            FormBuilderTextField(
                              decoration: const InputDecoration(labelText: 'DropOff Address'),
                              validator: FormBuilderValidators.required(context),
                              name: 'dropoff_address',
                            ),
                            SizedBox(height: Device.margin(context)),
                            FormBuilderTextField(
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(10),
                                ],
                                decoration: const InputDecoration(prefixText: '+91', labelText: 'Mobile Number'),
                                validator: FormBuilderValidators.required(context),
                                name: 'mobile'),
                            SizedBox(height: Device.margin(context)),
                            FormBuilderTextField(
                              decoration: const InputDecoration(labelText: 'Name (Optional)'),
                              name: 'name',
                            ),
                            SizedBox(height: Device.margin(context)),
                            FormBuilderDropdown(
                                name: 'requirement',
                                validator: FormBuilderValidators.required(context),
                                decoration: const InputDecoration(labelText: 'Requirement', iconColor: Colors.black87),
                                items: ['Personal', 'Business', 'Shifting'].map((value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList()),
                            SizedBox(height: Device.margin(context)),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(elevation: 0),
                              onPressed: () {
                                if (_formKey.currentState!.saveAndValidate()) {
                                  CollectionReference users = FirebaseFirestore.instance.collection('leads');
                                  users.add(_formKey.currentState!.value).then((value) {
                                    _formKey.currentState?.reset();
                                    _showMyDialog();
                                  }).catchError((error) => print("Failed to add user: $error"));
                                }
                              },
                              child: const Text('Get Estimate'),
                            ),
                            SizedBox(height: Device.margin(context) * 0.4)
                          ],
                        )),
                  ))
            ]))
      ]);

  Future<void> _showMyDialog() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
              title:  Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.check_circle, color: Colors.green, size: 34),
                ],
              ),
              content: SingleChildScrollView(
                child: ListBody(
                  children: const <Widget>[
                    Text('We will get back to you shortly!!'),
                    Text('You can reach us out directly on +91 98099 99044'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                    child: const Text('Ok'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    })
              ]);
        });
  }
}
