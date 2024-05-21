import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../screens/cart_list_screen.dart';
import '../utils/show_image.dart';

class BackgroundImage extends StatelessWidget {
  final double opacity;

  const BackgroundImage({
    super.key,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(
          Colors.white.withOpacity(opacity),
          BlendMode.srcATop,
        ),
        child: Image.asset(
          'assets/images/back.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class CartButton extends StatelessWidget {
  final int totalItems;

  const CartButton({
    super.key,
    required this.totalItems,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CartListScreen()),
        );
      },
      child: Stack(
        children: [
          const Icon(Icons.shopping_cart),
          if (totalItems > 0)
            Positioned(
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                constraints: const BoxConstraints(
                  minWidth: 16,
                  minHeight: 16,
                ),
                child: Text(
                  '$totalItems',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class ImageCarousel extends StatelessWidget {
  final List<String> imageUrls;
  final String itemName;

  const ImageCarousel({
    super.key,
    required this.imageUrls,
    required this.itemName,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
      items: imageUrls.map((imageUrl) {
        int imageIndex = imageUrls.indexOf(imageUrl);
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () => showImageGallery(context, imageUrls, imageIndex, itemName),
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(imageUrl, fit: BoxFit.cover),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}