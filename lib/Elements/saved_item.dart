import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../Utils/common.dart';
import '../Utils/iamge_constants.dart';
import '../Utils/style.dart';

class SavedItem extends StatelessWidget {
  final int? i;
  const SavedItem({Key? key, this.i}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        // width: 155,
        decoration: boxDecoration,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Column(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              height: double.infinity,
                              width: double.infinity,
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
                            width: 95,
                            height: 30,
                            margin: const EdgeInsets.all(10),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryYellowColor,
                                  padding: EdgeInsets.zero),
                              onPressed: () {},
                              child: Text(
                                "Apartment",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: whiteColor,
                                  fontSize: 16,
                                ),
                              ),
                            ), /*BigButton(
                                onTap: () {},
                                title: "Apartment",
                                color: primaryYellowColor)*/
                          ),
                        ],
                      ),
                    ),
                    heightSizedBox(7.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "\$2,200",
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              maxLines: 1,
                              style: headingTS,
                            ),
                            widthSizedBox(5.0),
                            Text(
                              "Per Month",
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              maxLines: 1,
                              style: TextStyle(color: greyColor, fontSize: 10),
                            ),
                          ],
                        ),
                        Image.asset(
                          /* i == 0
                        ?*/
                          ImageConstants
                              .bookmarkFill /*: ImageConstants.bookmark*/,
                          height: 18,
                          fit: BoxFit.fill,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // heightSizedBox(0),
            const Divider(height: 1),
            heightSizedBox(10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  row("3 Beds", ImageConstants.bed),
                  row("2 Baths", ImageConstants.bath),
                  row("1500 SQFT", ImageConstants.area),
                ],
              ),
            ),
            heightSizedBox(10.0),
          ],
        ),
      ),
    );
  }

  Widget row(String t, String i) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(i, height: 10, fit: BoxFit.fill),
        widthSizedBox(2),
        Text(t, style: TextStyle(color: greyColor, fontSize: 10), maxLines: 1),
      ],
    );
  }
}
