import 'dart:async';
import 'package:flutter/material.dart';
import 'package:portfolio/core/res/images/app_images.dart';

class AutoScrollSlider extends StatefulWidget {
  final List images;
  final bool isMobile;
  final bool isTablet;

  const AutoScrollSlider({
    super.key,
    required this.images,
    required this.isMobile,
    required this.isTablet,
  });
  @override
  _AutoScrollSliderState createState() => _AutoScrollSliderState();
}

class _AutoScrollSliderState extends State<AutoScrollSlider> {
  // final PageController _pageController = PageController();
  final PageController _pageController = PageController(viewportFraction: 0.95);
  Timer? _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
      final nextpage = (_currentPage + 1) % widget.images.length;
      await _pageController
          .animateToPage(
        nextpage,
        duration: const Duration(milliseconds: 600),
        curve: Curves.decelerate,
      )
          .then((_) {
        if (mounted) {
          setState(() {
            _currentPage = nextpage;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 5,
          bottom: 5,
          left: 5,
          right: 5,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.images.length,
              onPageChanged: (index) {
                if (mounted) setState(() => _currentPage = index);
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 3, left: 3),
                  child: Image.asset(
                    widget.images[index],
                    cacheWidth: (MediaQuery.of(context).size.width * 2).toInt(),
                    cacheHeight:
                        (MediaQuery.of(context).size.height * 2).toInt(),
                    fit: BoxFit.fill,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 30,
                      color: Colors.grey[300],
                      child: const Icon(Icons.image, size: 20),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Positioned.fill(
          child: Image.asset(
            phoneCover,
            fit: BoxFit.contain,
            cacheWidth: (MediaQuery.of(context).size.width * 2).toInt(),
            errorBuilder: (context, error, stackTrace) => Container(
              height: 30,
              color: Colors.grey[300],
              child: const Icon(Icons.image, size: 20),
            ),
          ),
        ),
      ],
    );
  }
}
