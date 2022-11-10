import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../Utils/common.dart';
import '../Utils/style.dart';

class ApartmentItem2 extends StatelessWidget {
  final int? i;
  const ApartmentItem2({Key? key, this.i}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.fill,
                  imageUrl: "https://picsum.photos/id/237/200/300",
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: greyColor,
                    highlightColor: Colors.grey.shade700,
                    child: const SizedBox(height: double.infinity),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Container(
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: whiteColor),
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  child: Image.asset(
                    i == 0
                        ? "assets/NImages/save_fill.png"
                        : "assets/NImages/save.png",
                    height: 20,
                    fit: BoxFit.fill,
                  )),
            ],
          ),
          heightSizedBox(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Apartment",
                style: headingTS,
              ),
              Text(
                "\$2200/month",
                style: mainHeadingTS,
              ),
            ],
          ),
          heightSizedBox(8),
          row("40820 Newzealand, CA", "assets/NImages/location.png"),
          heightSizedBox(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              row("3 Beds", "assets/NImages/bath.png"),
              row("2 Baths", "assets/NImages/bath.png"),
              row("1500 SQFT", "assets/NImages/square_fit.png"),
            ],
          )
        ],
      ),
    );
  }

  Widget row(String t, String i) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(i, height: 16, fit: BoxFit.fill),
        widthSizedBox(8),
        Text(t, style: greyST, maxLines: 1),
      ],
    );
  }
}
