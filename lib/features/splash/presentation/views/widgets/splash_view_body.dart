import 'package:bookly/core/utils/routers.dart';
import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'animated_widget.dart';
import 'package:go_router/go_router.dart';


class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scalingAni;
  late Animation<Offset> slidingAni;

  void initAnimations() {
    controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1000),
        lowerBound: 0,
        upperBound: 1);
    scalingAni = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.linear));
    slidingAni = Tween<Offset>(
      begin: const Offset(0,10),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.linear));
    controller.forward();
  }

  void fadeNavigator(StatelessWidget s) {
    Future.delayed(
        const Duration(milliseconds: 2500),
            (){
              GoRouter.of(context).pushReplacement(AppRouter.authScreenRouter);
               //GoRouter.of(context).pushReplacement(AppRouter.homeViewRouter);

               // Get.to(
          //         ()=> s,
          //     transition: Transition.cupertinoDialog,duration:transitionDuration
          // );
        }
    );
  }

  @override
  void initState() {
    super.initState();
    initAnimations();
    fadeNavigator(const HomeView());
  }



  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ScalingPic(doubleAni: scalingAni, size: size),
        SlidingText(offsetAni: slidingAni, size: size),
      ],
    );
  }

}
