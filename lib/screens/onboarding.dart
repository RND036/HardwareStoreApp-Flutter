import 'package:flutter/material.dart';
import 'package:hardware_store/widgets/onboarding_widget.dart';


class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {

  // controller for the page view 

  final PageController _pageController = PageController();
  int _activePage = 0; // currently active page

// navigate with the pages in the onboarding 

  void onNextPage() {
    if (_activePage < _pages.length - 1) {
      _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }
   // navigate to the last page
  void onSkip() {
    _pageController.animateToPage(
      _pages.length - 1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  // pages in onboarding 

  final List<Map<String, dynamic>> _pages = [
    {
      'color': '#17B169',
      'title': 'Your Trusted Hardware Partner',
      'lottie': 'assets/Lottie/welcome.json',
      'description': " At Tech. we bring you a comprehensive selection of high-quality tools and materials. With a focus on excellence and reliability, we support your projects from start to finish.",
      'skip': true
    },
    {
      'color': '#00A86B',
      'title': 'Support When You Need It',
      'lottie': 'assets/Lottie/support.json',
      'description': 'Our expert support team is available around the clock to provide assistance. From product inquiries to order issues, we are here to ensure your experience with us is smooth and satisfying.',
      'skip': true
    },
    {
      'color': '#03C03C',
      'title': ' Ready, Set, Build!',
      'lottie': 'assets/Lottie/start.json',
      'description': 'Dive into our vast inventory and enjoy exclusive deals just for you. Sign up, browse our products, and start your next project with everything you need. Click "Get Started" to embark on your building adventure!',
      'skip': false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          // to display the onboarding pages 

          PageView.builder(
            controller: _pageController,
            itemCount: _pages.length,
            onPageChanged: (int page) {
              setState(() {
                _activePage = page;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              final page = _pages[index];
              return OnboardingWidget( // calling to onboarding widget
                color: page['color'],
                title: page['title'],
                description: page['description'],
                lottie: page['lottie'],
                skip: page['skip'],
                onTab: onNextPage,
                onSkip: onSkip,
                index: index,
              );
            }
          ),

          // indicators for the pages 

          Positioned(
            top: MediaQuery.of(context).size.height / 1.75,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildIndicator(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
// indicators for the pages

  List<Widget> _buildIndicator() {
    final indicators = <Widget>[];
    for (var i = 0; i < _pages.length; i++) {
      if (_activePage == i) {
        indicators.add(_indicatorsTrue());
      } else {
        indicators.add(_indicatorsFalse());
      }
    }
    return indicators;
  }
  //active indicator

  Widget _indicatorsTrue() {
    String color;
    if (_activePage == 0) {
      color = '#17B169';
    } else if (_activePage == 1) {
      color = '#00A86B';
    } else {
      color = '#03C03C';
    }
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 6,
      width: 42,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: hexToColor(color),
      ),
    );
  }
//inactive indicator

  Widget _indicatorsFalse() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 8,
      width: 8,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey.shade100,
      ),
    );
  }
}


// use hexa colors
Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex));
  return Color(int.parse(hex.substring(1), radix: 16) + (hex.length == 7 ? 0xFF000000 : 0x00000000));
}
