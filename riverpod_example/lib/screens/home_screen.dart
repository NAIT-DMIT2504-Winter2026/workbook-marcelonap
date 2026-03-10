import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/state/user_notifier.dart';
import 'dart:math' as math;

class HomeScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  int _tweenValue = 0;
  late Timer _tweenTimer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    _tweenTimer = Timer.periodic(Duration(milliseconds: 50), (timer) {
      setState(() {
        _tweenValue = (_tweenValue + 1) % 1000;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userNotifierProvider);
    final userNotifier = ref.read(userNotifierProvider.notifier);

    return Scaffold(
      body: Column(
        children: <Widget>[
          Spacer(),
          Transform.rotate(
            angle: 230 * (math.pi / 180),
            child: Text("Welcome ${userState.user.firstName}"),
          ),
          Spacer(),
          Transform.scale(
            scale: 1.3,
            child: Transform.translate(
              offset: Offset(80.0, -60.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/last-name-screen");
                },
                child: Text("Go to other page"),
              ),
            ),
          ),

          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              //print("Value of animation: ${_animationController.value}");
              return Transform.rotate(
                angle: _animationController.value * (math.pi * 2),
                child: child,
              );
            },
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/login");
              },
              child: Text(
                userState.isLoggedIn ? "No Need to log in" : "Log in",
              ),
            ),
          ),

          Transform.translate(
            offset: Offset(90.0, -50.0),
            child: TweenAnimationBuilder(
              tween: IntTween(begin: 0, end: _tweenValue),
              duration: Duration(milliseconds: 500),
              builder: (_, value, child) {
                print("Value of tween: ${value}");
                return Transform.rotate(
                  angle: value / 100 * (math.pi * 2),
                  child: child,
                );
              },
              child: Text("Rotated by tween"),
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          userNotifier.updateFirstName("New first name");
        },
        child: Text("Change name"),
      ),
    );
  }
}
