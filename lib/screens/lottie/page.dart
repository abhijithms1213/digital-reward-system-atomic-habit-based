import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottiePage extends StatefulWidget {
  const LottiePage({super.key});

  @override
  State<LottiePage> createState() => _LottiePageState();
}

class _LottiePageState extends State<LottiePage> with TickerProviderStateMixin {
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    // _controller=AnimationController(vsync: this)..value=.5..addListener(() {
    //   setState(() {
    //   });
    // },);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20),
          Lottie.asset(
            'assets/lottie/Success.json',
            controller: _controller,
            onLoaded: (composition) {
              _controller
                .duration = composition.duration;
                
            },
            repeat: true
          ),

          ElevatedButton(onPressed:() {
            _controller.reverse();
            setState(() {
              
            });
          }, child: Text('forward'))
        ],
      ),
    );

    // return Scaffold(
    //       appBar: AppBar(title: const Text('Animation control')),
    //       body: Column(
    //         children: <Widget>[
    //           const SizedBox(height: 20),
    //           Lottie.asset(
    //             'assets/lottie/Success.json',
    //             controller: _controller,
    //             height: 300,
    //             onLoaded: (composition) {
    //               setState(() {
    //                 _controller.duration = composition.duration;
    //               });
    //             },
    //           ),
    //           Text(_controller.value.toStringAsFixed(2)),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               // Play backward
    //               IconButton(
    //                 icon: const Icon(Icons.arrow_left),
    //                 onPressed: () {
    //                   _controller.reverse();
    //                 },
    //               ),
    //               // Pause
    //               IconButton(
    //                 icon: const Icon(Icons.pause),
    //                 onPressed: () {
    //                   _controller.stop();
    //                 },
    //               ),
    //               // Play forward
    //               IconButton(
    //                 icon: const Icon(Icons.arrow_right),
    //                 onPressed: () {
    //                   _controller.forward();
    //                 },
    //               ),
    //             ],
    //           ),
    //           const SizedBox(height: 30),
    //           ElevatedButton(
    //             onPressed: () {
    //               // Loop between 2 specifics frames

    //               var start = 0.1;
    //               var stop = 0.5;
    //               _controller.repeat(
    //                 min: start,
    //                 max: stop,
    //                 reverse: true,
    //                 period: _controller.duration! * (stop - start),
    //               );
    //             },
    //             child: const Text('Loop between frames'),
    //           ),
    //         ],
    //       ),
    //     );

    // return Scaffold(
    //   body: SizedBox(
    //     height: double.infinity,
    //     width: double.infinity,
    //     child: SingleChildScrollView(
    //       child: Column(
    //         children: [
    //           SizedBox(
    //             height: 190,
    //             width: 190,
    //             child: LottieBuilder.asset('assets/lottie/Stress Management.json'),
    //           ),
    //           Center(
    //             child: SizedBox(
    //               height: 190,
    //               width: 190,
    //               child: LottieBuilder.asset('assets/lottie/Success.json',height: 50,width: 50,frameRate: FrameRate(30),),
    //             ),
    //           ),
    //           SizedBox(height: 10),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
