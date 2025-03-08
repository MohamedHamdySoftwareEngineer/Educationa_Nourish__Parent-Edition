import 'package:concentric_transition/page_view.dart';
import 'package:educational_nourish/Parent/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'choice_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});
  final data = [
    ItemData(
      title: "SMART EDUCATION",
      subtitle: "Connect, learn, and grow with innovative education solutions.",
      image: const AssetImage("assets/image-1.png"),
      backgroundColor: const Color.fromARGB(255, 107, 157, 249),
      titleColor: const Color.fromARGB(255, 131, 243, 189),
      subtitleColor: Colors.white,
      background: Lottie.network(
          'https://assets2.lottiefiles.com/packages/lf20_bq485nmk.json'),
    ),
    ItemData(
      title: "BEST TEACHERS",
      subtitle: "Experience quality education from top teachers.",
      image: const AssetImage("assets/image-2.png"),
      backgroundColor: const Color(0xFF4757C0),
      titleColor: Colors.red.shade400,
      subtitleColor: Colors.black,
      background: Lottie.network(
          'https://assets2.lottiefiles.com/packages/lf20_bq485nmk.json'),
    ),
    ItemData(
      title: "SMART STUDENTS",
      subtitle: "A smarter way for students to reach new heights.",
      image: const AssetImage("assets/image-3.png"),
      backgroundColor: const Color.fromARGB(255, 107, 157, 249),
      titleColor: Colors.greenAccent,
      subtitleColor: Colors.white,
      background: Lottie.network(
          'https://assets2.lottiefiles.com/packages/lf20_bq485nmk.json'),
    ),
    ItemData(
      title: "MODERN EDUCATION",
      subtitle: "Where creativity and technology drive learning.",
      image: const AssetImage("assets/image-4.png"),
      backgroundColor: const Color(0xFF4757C0),
      titleColor: Colors.red.shade400,
      subtitleColor: Colors.black,
      background: Lottie.network(
          'https://assets2.lottiefiles.com/packages/lf20_bq485nmk.json'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConcentricPageView(
        onFinish: () {
          GoRouter.of(context).push(AppRouter.rChoiceScreen);
        },
        // radius: 40,
        colors: data.map((e) => e.backgroundColor).toList(),
        itemCount: data.length,
        itemBuilder: (int index) {
          return ItemWidget(
            data: data[index],
            isLastPage: index == data.length - 1,
          );
        },
      ),
    );
  }
}

class ItemData {
  final String title;
  final String subtitle;
  final ImageProvider image;
  final Color backgroundColor;
  final Color titleColor;
  final Color subtitleColor;
  final Widget? background;

  ItemData({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.backgroundColor,
    required this.titleColor,
    required this.subtitleColor,
    this.background,
  });
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    required this.data,
    required this.isLastPage,
    super.key,
  });

  final ItemData data;
  final bool isLastPage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 3),
              Flexible(
                flex: 20,
                child: Image(image: data.image),
              ),
              const Spacer(flex: 1),
              Text(
                data.title,
                style: TextStyle(
                  color: data.titleColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
                maxLines: 1,
              ),
              const Spacer(flex: 1),
              Text(
                data.subtitle,
                style: TextStyle(
                  color: data.subtitleColor,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
              const Spacer(flex: 10),
              if (isLastPage)
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChoiceScreen(),
                      ),
                    );
                  },
                  child: const Text('Get Started'),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
