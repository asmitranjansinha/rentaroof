import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rentaroof/Utils/style.dart';
import 'package:shimmer/shimmer.dart';

import '../Utils/common.dart';

class TopVisitingItem extends StatelessWidget {
  const TopVisitingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              height: 70,
              width: 70,
              imageUrl:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpIFYgXTa_FZMQhQKVXw2KN5aE6Ng7IwDjX5g2cQVdgQ&s",
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: greyColor,
                highlightColor: Colors.grey.shade700,
                child: const SizedBox(height: double.infinity),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          widthSizedBox(7.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Furnished Homes",
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                maxLines: 1,
                style: headingTS,
              ),
              heightSizedBox(12.0),
              const Text(
                "\$2200/month",
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                maxLines: 1,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
