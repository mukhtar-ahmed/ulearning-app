import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/home/controller/home_screen_banner_dots.dart';
import 'package:ulearning_app/pages/global.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  late PageController _controller;
  @override
  void didChangeDependencies() {
    _controller =
        PageController(initialPage: ref.watch(homeScreenBannerDotsProvider));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('Hello'),
            Text(Global.storageService.getUserProfile().email ?? ''),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                height: 150,
                child: PageView(
                  controller: _controller,
                  onPageChanged: (int index) {
                    ref
                        .read(homeScreenBannerDotsProvider.notifier)
                        .changeIndex(index);
                  },
                  children: [
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.pink,
                          image: DecorationImage(
                              image: AssetImage('assets/images/reading.png'))),
                    ),
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 74, 136, 61),
                          image: DecorationImage(
                              image: AssetImage('assets/images/reading.png'))),
                    ),
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 87, 56, 202),
                          image: DecorationImage(
                              image: AssetImage('assets/images/reading.png'))),
                    ),
                  ],
                ),
              ),
            ),
            DotsIndicator(
              dotsCount: 3,
              position: ref.watch(homeScreenBannerDotsProvider),
              decorator: DotsDecorator(
                color: Colors.black87, // Inactive color
                activeColor: Colors.redAccent,
              ),
            ),
            //All Text
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Choice Your Course'), Text('See All')],
            ),
            SizedBox(
              width: 10,
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 50,
                  height: 30,
                  color: Colors.blue,
                  child: Text(
                    'All',
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  width: 50,
                  height: 30,
                  color: Colors.white,
                  child: Text(
                    'Popular',
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  width: 50,
                  height: 30,
                  color: Colors.white,
                  child: Text(
                    'Newest',
                  ),
                ),
              ],
            ),
            GridView.builder(
                physics: ScrollPhysics(),
                itemCount: 5,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 100,
                    color: Colors.green,
                  );
                })
          ],
        ),
      ),
    );
  }
}
