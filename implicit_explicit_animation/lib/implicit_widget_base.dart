import 'package:flutter/material.dart';

class ImplicitWidgetBase extends StatefulWidget {
  const ImplicitWidgetBase({Key? key}) : super(key: key);

  @override
  State<ImplicitWidgetBase> createState() => _ImplicitWidgetBaseState();
}

class _ImplicitWidgetBaseState extends State<ImplicitWidgetBase> {
   bool _bigger = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedContainer(
        duration: const Duration(seconds: 5),
          width: _bigger ? 500:100,
          child: Image.asset('images/star.png'),
    ),
        const SizedBox(height: 20,),
        MaterialButton(
          color: Colors.white,
            onPressed: (){
            setState(() {
              _bigger = !_bigger;
            });
            },
          child: const Text("Pressed"),
        ),
      ],
    );
  }
}
