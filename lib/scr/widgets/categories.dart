import 'package:flutter/material.dart';
import 'package:foodapp/scr/helpers/style.dart';
import 'package:foodapp/scr/models/category.dart';
import 'package:foodapp/scr/widgets/loading.dart';

import 'package:transparent_image/transparent_image.dart';

//import '../helpers/style.dart';
import 'custom_text.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryModel category;

  const CategoryWidget({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Stack(
        children: <Widget>[
          Container(
            width: 100,
            height: 100,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                        child: Align(
                      alignment: Alignment.center,
                      child: Loading(),
                    )),
                    Center(
                      child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: category.image),
                    )
                  ],
                )),
          ),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.elliptical(20, 15),
                ),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.55),
                    Colors.black.withOpacity(0.5),
                    Colors.black.withOpacity(0.4),
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.1),
                    Colors.black.withOpacity(0.075),
                  ],
                )),
          ),
          Positioned.fill(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomText(
                    text: category.name,
                    color: Colors.deepOrangeAccent, //white, //
                    size: 15,
                    weight: FontWeight.bold,
                  )))
        ],
      ),
    );
  }
}
