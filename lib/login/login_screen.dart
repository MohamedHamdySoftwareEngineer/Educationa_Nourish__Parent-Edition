import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _bottomCircleAnimation;
  late Animation<double> _middleCircleAnimation;
  late Animation<double> _topCircleAnimation;
  late Animation<double> _leftCircleAnimation;
  late AnimationController _formController;
  late Animation<Offset> _emailAnimation;
  late Animation<Offset> _passwordAnimation;
  late Animation<Offset> _forgetPasswordAnimation;
  late Animation<Offset> _loginButtonAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );

    _bottomCircleAnimation = Tween<double>(begin: -400, end: -300).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );

    _middleCircleAnimation = Tween<double>(begin: -400, end: -250).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 0.7, curve: Curves.easeOut),
      ),
    );

    _topCircleAnimation = Tween<double>(begin: -400, end: -200).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 0.9, curve: Curves.easeOut),
      ),
    );

    _leftCircleAnimation = Tween<double>(begin: -400, end: -90).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeOut),
      ),
    );

    _controller.forward();

    _formController = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );

    _emailAnimation =
        Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _formController,
        curve: const Interval(0.0, 0.25, curve: Curves.easeOut),
      ),
    );

    _passwordAnimation =
        Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _formController,
        curve: const Interval(0.25, 0.5, curve: Curves.easeOut),
      ),
    );

    _forgetPasswordAnimation =
        Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _formController,
        curve: const Interval(0.5, 0.75, curve: Curves.easeOut),
      ),
    );

    _loginButtonAnimation =
        Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _formController,
        curve: const Interval(0.75, 1.0, curve: Curves.easeOut),
      ),
    );

    _formController.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _formController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Circles Animation
          AnimatedBuilder(
            animation: _bottomCircleAnimation,
            builder: (context, child) {
              return Positioned(
                bottom: _bottomCircleAnimation.value,
                left: MediaQuery.of(context).size.width / 2 - 450,
                child: CircleAvatar(
                  radius: 450,
                  backgroundColor: Colors.blue.shade100,
                ),
              );
            },
          ),
          AnimatedBuilder(
            animation: _middleCircleAnimation,
            builder: (context, child) {
              return Positioned(
                bottom: _middleCircleAnimation.value,
                left: MediaQuery.of(context).size.width / 2 - 400,
                child: CircleAvatar(
                  radius: 400,
                  backgroundColor: Colors.blue.shade200,
                ),
              );
            },
          ),
          AnimatedBuilder(
            animation: _topCircleAnimation,
            builder: (context, child) {
              return Positioned(
                bottom: _topCircleAnimation.value,
                left: MediaQuery.of(context).size.width / 2 - 350,
                child: CircleAvatar(
                  radius: 350,
                  backgroundColor: Colors.blue.shade300,
                ),
              );
            },
          ),
          AnimatedBuilder(
            animation: _leftCircleAnimation,
            builder: (context, child) {
              return Positioned(
                top: -100,
                left: _leftCircleAnimation.value,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 150,
                      backgroundColor: Colors.blue.shade300,
                    ),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(left: 60, top: 140),
                        child: Text(
                          "Log In",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.3),
              SlideTransition(
                position: _emailAnimation,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Type Here...",
                      labelText: "Email",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SlideTransition(
                position: _passwordAnimation,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Type Here...",
                      labelText: "Password",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SlideTransition(
                position: _forgetPasswordAnimation,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forget Password",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SlideTransition(
                position: _loginButtonAnimation,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Colors.white,
                  ),
                  child: const Text(
                    "Log In",
                    style: TextStyle(fontSize: 18, color: Colors.blueGrey),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
