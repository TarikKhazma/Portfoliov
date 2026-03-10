import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ImageCard extends StatelessWidget {
  final String image;

  const ImageCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return newMethod().animate().fadeIn(duration: 300.ms).slideY(begin: 0.1, end: 0);
  }

  Container newMethod() {
    return Container(
    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        image,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Container(
          height: 150,
          color: Colors.grey[300],
          child: const Icon(Icons.image, size: 50),
        ),
      ),
    ),
  );
  }
}

class InfiniteScrollColumn extends StatefulWidget {
  final List items;

  const InfiniteScrollColumn({super.key, required this.items});

  @override
  State<InfiniteScrollColumn> createState() => _InfiniteScrollColumnState();
}

class _InfiniteScrollColumnState extends State<InfiniteScrollColumn> {
  late ScrollController _scrollController;
  bool _isScrolling = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAutoScroll();
    });
  }

  void _startAutoScroll() {
    Future.delayed(const Duration(seconds: 3), () {
      if (_isScrolling && _scrollController.hasClients) {
        _scrollController
            .animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(seconds: widget.items.length * 10),
          curve: Curves.linear,
        )
            .then((_) {
          if (_scrollController.hasClients) {
            _scrollController.jumpTo(0);
            _startAutoScroll();
          }
        });
      } else {
        _startAutoScroll();
      }
    });
  }

  @override
  void dispose() {
    _isScrolling = false;
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.items.length * 3,
      itemBuilder: (context, index) {
        final item = widget.items[index % widget.items.length];
        return ImageCard(image: item['image']);
      },
    );
  }
}
