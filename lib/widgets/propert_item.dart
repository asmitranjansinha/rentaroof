import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../utils/common.dart';
import '../utils/style.dart';

class PropertyItem extends StatelessWidget {
  const PropertyItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 155,
        decoration: boxDecoration,
        padding: const EdgeInsets.all(6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                  imageUrl:
                      "http://thehousedesignhub.com/wp-content/uploads/2021/02/46E-1024x768.jpg",
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: greyColor,
                    highlightColor: Colors.grey.shade700,
                    child: const SizedBox(height: double.infinity),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            heightSizedBox(7.0),
            Text(
              "Furnished Homes",
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              maxLines: 1,
              style: headingTS,
            ),
            heightSizedBox(7.0),
            Text(
              "800 Properties",
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              maxLines: 1,
              style: subTitleST,
            ),
            heightSizedBox(2.0),
          ],
        ),
      ),
    );
  }
}
