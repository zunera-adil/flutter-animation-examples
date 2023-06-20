import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class ImplicitTweenAnimation extends StatefulWidget {
  const ImplicitTweenAnimation({Key? key}) : super(key: key);

  @override
  State<ImplicitTweenAnimation> createState() => _ImplicitTweenAnimationState();
}

class _ImplicitTweenAnimationState extends State<ImplicitTweenAnimation> {
   double _sliderValue = 0;
   Color _newColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset('images/background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TweenAnimationBuilder(
                duration: const Duration(seconds: 5),
                tween: ColorTween(begin: Colors.white,end: _newColor),
                builder: (context,Color? color, child){
                  return ColorFiltered(
                      colorFilter:  ColorFilter.mode(color!, BlendMode.modulate),
                      child: child);
                },
                // tween: Tween<double>(begin: 0,end: pi*2),
                // builder: (_,double angel, child){
                //   return Transform.rotate(
                //     angle: angel,
                //     child: child,);
                // },
                child: Image.asset('images/earth.png',),
              ),
              const SizedBox(height: 20,),
              Slider.adaptive(value: _sliderValue,
                  onChanged: (value){
                    setState(() {
                      _sliderValue = value;
                      _newColor = Color.lerp(Colors.white, Colors.red, _sliderValue)!;
                    });
                  })
            ],
          )
        ],
      ),
    );
  }
}
