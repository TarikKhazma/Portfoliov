

  import 'package:flutter/material.dart';

Padding imageClip(String image, double width, double height) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.asset(
          width: width,
          height: height,
          image,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(
            height: 30,
            color: Colors.grey[300],
            child: const Icon(Icons.image, size: 20),
          ),
        ),
      ),
    );
  }