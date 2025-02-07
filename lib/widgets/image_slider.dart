import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rentaroof/utils/style.dart';
import 'package:shimmer/shimmer.dart';

class BannerSlider extends StatefulWidget {
  final List<String> imageList;

  const BannerSlider({super.key, required this.imageList});

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  @override
  Widget build(BuildContext context) {
    if (widget.imageList.isEmpty) {
      return const SizedBox();
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Stack(
          // alignment: Alignment.bottomCenter,
          children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                height: 160,
                viewportFraction: 1,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    // _current = index;
                  });
                },
              ),
              items: widget.imageList.map((image) {
                return Builder(
                  builder: (BuildContext context) {
                    return Stack(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 2,
                              margin: EdgeInsets.zero,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: CachedNetworkImage(
                                  height: 160,
                                  width: double.infinity,
                                  fit: BoxFit.fill,
                                  imageUrl: image,
                                  placeholder: (context, url) =>
                                      Shimmer.fromColors(
                                    baseColor: greyColor,
                                    highlightColor: Colors.grey.shade700,
                                    child: const SizedBox(height: 160),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 160,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Get your 15%\ncashback",
                                  style: TextStyle(
                                      color: whiteColor, fontSize: 22),
                                ),
                                Text(
                                  "*Expired 20 April 2022",
                                  style: TextStyle(
                                      color: whiteColor, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }).toList(),
            ),

            // Padding(
            //   padding: const EdgeInsets.only(bottom: 8.0),
            //   child: Row(
            //     mainAxisSize: MainAxisSize.min,
            //     children: widget.imageList.map((image) {
            //       return AnimatedContainer(
            //         duration: const Duration(milliseconds: 150),
            //         margin: const EdgeInsets.symmetric(
            //             vertical: 1.0, horizontal: 2.0),
            //         height: 8.0,
            //         width: _current == widget.imageList.indexOf(image)
            //             ? 22.0
            //             : 14.0,
            //         decoration: BoxDecoration(
            //           color: _current == widget.imageList.indexOf(image)
            //               ? const Color.fromRGBO(0, 0, 0, 0.9)
            //               : const Color.fromRGBO(0, 0, 0, 0.4),
            //           borderRadius: const BorderRadius.all(Radius.circular(8)),
            //         ),
            //       );
            //     }).toList(),
            //   ),
            // ),
          ],
        ),
      );
    }
  }
}
