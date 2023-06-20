import 'package:flutter/material.dart';
class AnimatedBuilderExample extends StatefulWidget {
  const AnimatedBuilderExample({Key? key}) : super(key: key);

  @override
  _AnimatedBuilderExampleState createState() => _AnimatedBuilderExampleState();
}

class _AnimatedBuilderExampleState extends State<AnimatedBuilderExample>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget? child) {
                return Center(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: const [Colors.purple, Colors.pink, Colors.yellow],
                        stops: [0, _controller.value, 1],
                      ),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20,),
            Row(children: [
              Expanded(
                child: MaterialButton(
                  color: Colors.blue,
                    onPressed: (){
                    _controller.forward();
                    },
                  child: const Text("Forward"),
                ),
              ),
              const SizedBox(width: 10,),
              Expanded(
                child: MaterialButton(
                  color: Colors.blue,
                  onPressed: (){
                    _controller.reverse();
                  },
                  child: const Text("Reverse"),
                ),
              ),
              const SizedBox(width: 10,),
              Expanded(
                child: MaterialButton(
                  color: Colors.blue,
                  onPressed: (){
                    _controller.repeat(reverse: true);
                  },
                  child: const Text("Repeat"),
                ),
              ),
              const SizedBox(width: 10,),
              Expanded(
                child: MaterialButton(
                  color: Colors.blue,
                  onPressed: (){
                    _controller.stop();
                  },
                  child: const Text("Stop"),
                ),
              ),
            ],)
          ],
        ),
      )
    );
  }
}