import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rentaroof/views/apartment_details.dart';
import 'package:rentaroof/utils/iamge_constants.dart';
import 'package:shimmer/shimmer.dart';

import '../utils/common.dart';
import '../utils/style.dart';

class ApartmentItem extends StatelessWidget {
  final int? i;
  final int? isPage;

  const ApartmentItem({Key? key, this.i, this.isPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigationPush(context, const ApartmentDetails()),
      child: Container(
        height: 350,
        width: isPage == 1 ? double.infinity : 300,
        margin: EdgeInsets.only(right: 20, left: isPage == 1 ? 20 : 0),
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
                    width: isPage == 1 ? double.infinity : 300,
                    fit: BoxFit.fill,
                    imageUrl:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpIFYgXTa_FZMQhQKVXw2KN5aE6Ng7IwDjX5g2cQVdgQ&s",
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: greyColor,
                      highlightColor: Colors.grey.shade700,
                      child: const SizedBox(height: double.infinity),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: whiteColor),
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    child: Image.asset(
                      i == 0
                          ? ImageConstants.bookmarkFill
                          : ImageConstants.bookmark,
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
            row("40820 Newzealand, CA", ImageConstants.location),
            heightSizedBox(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                row("3 Beds", ImageConstants.bed),
                row("2 Baths", ImageConstants.bath),
                row("1500 SQFT", ImageConstants.area),
              ],
            )
          ],
        ),
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
