import 'package:aaxep/layout/device.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ContainerShimmer extends StatelessWidget {
  const ContainerShimmer({required this.width, required this.height, Key? key}) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade400,
        highlightColor: Colors.grey.shade300,
        child: Container(
            width: width,
            height: height,
            decoration: const BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(Dimension.padding * 2)))));
  }
}

class ListShimmer extends StatelessWidget {
  const ListShimmer({required this.length, Key? key}) : super(key: key);

  final int length;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade400,
        highlightColor: Colors.grey.shade300,
        child: Column(
            children: List.generate(
          length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: Dimension.padding),
            child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
              Container(
                  decoration: const BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(Dimension.padding * 2))),
                  width: Dimension.padding * 10,
                  height: Dimension.padding * 10),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
              Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                Container(width: double.infinity, height: Dimension.padding * 2, color: Colors.white),
                const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
                Container(width: double.infinity, height: Dimension.padding * 2, color: Colors.white),
                const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
                Container(width: Dimension.shimmerWidth, height: Dimension.padding * 2, color: Colors.white)
              ])),
            ]),
          ),
        )));
  }
}
