import 'package:flutter/material.dart';
import 'package:bookly/core/assets/assets.dart';
import '../../../../../constant.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({Key? key,required this.offsetAni,required this.size}) : super(key: key);
  final Animation<Offset> offsetAni;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: offsetAni,
        builder: (c2,_) {
          return SlideTransition(
            position: offsetAni,
            child: Container(
              child: Column(
                children: [
                  logoText(size.width*.08),
                  SizedBox(
                    height: size.height * .01,
                  ),
                  const Text(
                    'Read Free Books',
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          );
        }
    );
  }
}

class ScalingPic extends StatelessWidget {
  const ScalingPic({Key? key, required this.doubleAni, required this.size}) : super(key: key);
  final Animation<double> doubleAni;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: doubleAni,
        builder: (c1,_) {
          return ScaleTransition(
            scale: doubleAni,
            child: Image.asset(
              AssetsData.booksPic,
              height: size.height * .2,
              //width: size.width*.2,
            ),
          );
        }
    );
  }
}

