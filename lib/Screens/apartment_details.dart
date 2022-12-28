import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../Elements/buttons.dart';
import '../Utils/common.dart';
import '../Utils/iamge_constants.dart';
import '../Utils/style.dart';

class ApartmentDetails extends StatefulWidget {
  const ApartmentDetails({Key? key}) : super(key: key);

  @override
  State<ApartmentDetails> createState() => _ApartmentDetailsState();
}

class _ApartmentDetailsState extends State<ApartmentDetails> {
  List<String> list = [
    "http://thehousedesignhub.com/wp-content/uploads/2021/02/52AE-1024x576.jpg",
    "http://thehousedesignhub.com/wp-content/uploads/2021/01/19E-1024x768.jpg",
    "http://thehousedesignhub.com/wp-content/uploads/2021/01/16E-1024x768.jpg",
    "https://api.makemyhouse.com/public/Media/rimage/500?objkey=completed-project/1611339563_254.jpg&watermark=false",
    "https://dhomez.com/wp-content/uploads/2021/11/Modern-house-design-with-best-exterior.jpg",
    "https://dhomez.com/wp-content/uploads/2021/11/Modern-house-design-with-best-exterior.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            InkWell(
              onTap: () => navigationPop(context),
              borderRadius: BorderRadius.circular(15),
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 0.5, color: greyColor.withOpacity(0.50)),
                      borderRadius: BorderRadius.circular(15)),
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  child: Image.asset(ImageConstants.back)),
            ),
            widthSizedBox(10),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Details",
                  style: mainHeadingTS,
                ),
              ),
            ),
          ],
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
                border:
                    Border.all(width: 0.5, color: greyColor.withOpacity(0.50)),
                borderRadius: BorderRadius.circular(15)),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
            child: Image.asset(
              ImageConstants.bookmarkFill,
              // height: 25,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              height: 250,
              width: 300,
              fit: BoxFit.fill,
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
          heightSizedBox(20.0),
          Row(
            children: List.generate(5, (index) {
              double width = (getWidth(context) - 40) / 5;
              return Padding(
                padding: EdgeInsets.only(left: index != 0 ? 10 : 0),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        height: width - 8,
                        width: width - 8,
                        imageUrl: list[index],
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: greyColor,
                          highlightColor: Colors.grey.shade700,
                          child: const SizedBox(height: double.infinity),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    if (index == 4)
                      InkWell(
                        child: Container(
                          height: width - 8,
                          width: width - 8,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Text(
                            '25+',
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            style: TextStyle(fontSize: 14, color: whiteColor),
                          ),
                        ),
                      ),
                  ],
                ),
              );
            }),
          ),
          heightSizedBox(25),
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
          heightSizedBox(10),
          row("40820 Newzealand, CA", ImageConstants.location),
          heightSizedBox(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              row("3 Beds", ImageConstants.bed),
              row("2 Baths", ImageConstants.bath),
              row("1500 SQFT", ImageConstants.area),
            ],
          ),
          heightSizedBox(25),
          row2("Property code : ", "RARP-0877240"),
          heightSizedBox(10),
          row2("Buit Up Area :", "1000.00 sqft"),
          heightSizedBox(10),
          row2("Property Type :", "apartment"),
          heightSizedBox(25),
          Text("Description", style: headingTS),
          heightSizedBox(10),
          Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing eli sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud odo consequat. Duis aute irure dolor in reprehenderit magna aliqua. Ut enim ad minim veniam, quis nostrud odo consequat. Duis aute irure dolor in reprehenderit nt in culpa qui as officia deserunt mollit ",
              style: greyST),
          heightSizedBox(25),
          BigButton(color: primaryYellowColor, onTap: () {}, title: "Rent Now")
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

  Widget row2(String t, String s) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(t, style: headingTS, maxLines: 1),
        widthSizedBox(8),
        Text(s, style: greyST, maxLines: 1),
      ],
    );
  }
}