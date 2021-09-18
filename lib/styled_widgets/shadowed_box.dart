import 'package:flutter/material.dart';
import 'package:aaxep/_widgets/decorated_container.dart';
import 'package:aaxep/core_packages.dart';

class ShadowedBg extends StatelessWidget {
  const ShadowedBg(this.color, {Key? key, this.ignorePointer = true}) : super(key: key);
  final Color color;
  final bool ignorePointer;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: ignorePointer,
      child: DecoratedContainer(color: color, shadows: Shadows.universal),
    );
  }
}
