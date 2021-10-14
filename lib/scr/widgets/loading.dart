import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sumptucious_shoe/scr/helpers/style.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: white,
        child: SpinKitHourGlass(
          color: Colors.deepOrange,
          size: 22.5,
        ));
  }
}
