import 'package:flutter/material.dart';

class ExplicitReadyToUseWidgetAnimation extends StatefulWidget {
  const ExplicitReadyToUseWidgetAnimation({Key? key}) : super(key: key);

  @override
  State<ExplicitReadyToUseWidgetAnimation> createState() => _ExplicitReadyToUseWidgetAnimationState();
}

class _ExplicitReadyToUseWidgetAnimationState extends State<ExplicitReadyToUseWidgetAnimation> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation<double> _animation;
  late Animation<Offset> _offsetAnimation;
  @override
  void initState() {
    _animationController = AnimationController(vsync: this,duration: const Duration(seconds: 5));
    _animationController.addListener(() {
      setState(() {

      });
    });
    _animation = Tween<double>(begin:  100, end: 170)
        .animate(_animationController);
    _offsetAnimation = Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0, -3.5))
        .animate(_animationController);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(_animationController.status == AnimationStatus.completed){
            _animationController.reverse();
          }
          else{
            _animationController.forward();
          }
          //_animationController.repeat();
        },
      ),
      body: Column(
        children: [
          const Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            // child: Container(
            //   width: _animation.value,
            //   height: _animation.value,
            //   decoration: const BoxDecoration(
            //     shape: BoxShape.circle,
            //     color: Colors.red
            //   ),
            // ),
            child: SlideTransition(
              position: _offsetAnimation,
              child: Container(
                width: _animation.value,
                height: _animation.value,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("images/rocket.png"))
                ),
              ),
            ),
          ),
          const SizedBox(height: 40,)
        ],
      ),
    );
  }
}
