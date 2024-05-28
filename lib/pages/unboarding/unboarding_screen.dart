import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ulearning_app/common/constant.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/pages/global.dart';
import 'package:ulearning_app/pages/login/view/login_page.dart';
import 'package:ulearning_app/pages/unboarding/notifire.dart';

class UnboardingScreen extends ConsumerWidget {
  static const String id = '/';
  UnboardingScreen({super.key});
  final controller = PageController();
  final List<UnboardingModel> contents = [
    UnboardingModel(
      title: const Text(
        'First see Learning',
        style: TextStyle(
          fontSize: 30,
          fontFamily: 'Pacifico Regular',
          fontWeight: FontWeight.w900,
        ),
      ),
      image: 'assets/images/reading.png',
      discription: "Forgot about all paper, now learning in one place",
      buttonText: 'Next',
    ),
    UnboardingModel(
      title: const Text(
        'High-quality Products',
        style: TextStyle(
          fontSize: 30,
          fontFamily: 'Pacifico Regular',
          fontWeight: FontWeight.w900,
        ),
      ),
      image: 'assets/images/man.png',
      discription: "Here you can find the best products for your pet.",
      buttonText: 'Next',
    ),
    UnboardingModel(
      title: const Text(
        'Reliable reviews',
        style: TextStyle(
          fontSize: 30,
          fontFamily: 'Pacifico Regular',
          fontWeight: FontWeight.w900,
        ),
      ),
      image: 'assets/images/boy.png',
      discription: "A review can be left only by a user who used the service. ",
      buttonText: 'Get started',
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
              onTap: () {
                Global.storageService.setBool(Constant.IS_FIRST_TIME, true);
                Navigator.pushNamed(context, LoginPage.id);
              },
              child: Text('Login')),
          SizedBox(
            width: 10.0,
          )
        ],
      ),
      body: SafeArea(
        child: Consumer(builder: (context, watch, child) {
          int currentIndex = ref.watch(indexNotifireProvider);
          return SizedBox(
            height: 812,
            width: 375,
            child: ListView(
              children: [
                SizedBox(
                  width: 378,
                  height: 600,
                  child: PageView.builder(
                    itemCount: 3,
                    controller: controller,
                    onPageChanged: (int index) {
                      ref
                          .read(indexNotifireProvider.notifier)
                          .changeIndex(index);
                    },
                    itemBuilder: (_, i) {
                      return Column(
                        children: [
                          SizedBox(
                            width: 378,
                            height: 375,
                            child: Image(
                              image: AssetImage(contents[currentIndex].image!),
                            ),
                          ),
                          const SizedBox(height: 20),
                          contents[currentIndex].title!,
                          const SizedBox(height: 12),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 19),
                            child: SizedBox(
                              height: 50,
                              child: Text(
                                contents[currentIndex].discription!,
                                style: const TextStyle(
                                    fontSize: 16, color: AppColors.primaryText),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          const SizedBox(height: 35),
                        ],
                      );
                    },
                  ),
                ),
                Center(
                  child: AnimatedSmoothIndicator(
                    activeIndex: currentIndex,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: Colors.orange,
                      dotHeight: 10,
                      dotWidth: 20,
                    ),
                    onDotClicked: (index) {
                      controller.animateToPage(
                        index,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                  ),
                ),
                SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    currentIndex == 0
                        ? SizedBox()
                        : IconButton(
                            color: Colors.purple,
                            onPressed: () {
                              print('before $currentIndex');

                              if (currentIndex > 0 && currentIndex <= 2) {
                                currentIndex == 1
                                    ? ref
                                        .read(indexNotifireProvider.notifier)
                                        .changeIndex(0)
                                    : ref
                                        .read(indexNotifireProvider.notifier)
                                        .changeIndex(1);
                              }
                              print('aftre $currentIndex');
                            },
                            icon: Icon(Icons.arrow_back)),
                    currentIndex == 2
                        ? SizedBox()
                        : IconButton(
                            color: Colors.purple,
                            onPressed: () {
                              print('before $currentIndex');
                              if (currentIndex >= 0 && currentIndex < 2) {
                                currentIndex == 0
                                    ? ref
                                        .read(indexNotifireProvider.notifier)
                                        .changeIndex(1)
                                    : ref
                                        .read(indexNotifireProvider.notifier)
                                        .changeIndex(2);
                              }
                              print('aftre $currentIndex');
                            },
                            icon: Icon(Icons.arrow_forward)),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class UnboardingModel {
  String? image;
  Widget? title;
  String? discription;
  String? buttonText;

  UnboardingModel({
    this.image,
    this.title,
    this.discription,
    this.buttonText,
  });
}
