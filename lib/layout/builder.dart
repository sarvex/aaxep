import 'package:flutter/material.dart';

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({Key? key, required this.builder}) : super(key: key);

  final Widget Function(BuildContext context, Size size, Size widgets) builder;

  @override
  Widget build(BuildContext context) =>
      LayoutBuilder(
        builder: (context, boxConstraints) =>
            builder(context, MediaQuery
                .of(context)
                .size, Size(boxConstraints.maxWidth, boxConstraints.maxHeight)),
      );
}