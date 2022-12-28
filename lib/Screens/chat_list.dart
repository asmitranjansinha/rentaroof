import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rentaroof/Screens/chat_details.dart';
import 'package:shimmer/shimmer.dart';

import '../Elements/drawer.dart';
import '../Utils/common.dart';
import '../Utils/iamge_constants.dart';
import '../Utils/style.dart';

class ChatList extends StatefulWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: whiteColor,
      drawer: const DrawerWidget(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            InkWell(
              onTap: () => scaffoldKey.currentState?.openDrawer(),
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 3),
                  child: SvgPicture.asset(menu)),
            ),
            // InkWell(
            //   onTap: () => navigationPop(context),
            //   child: Container(
            //       decoration: BoxDecoration(
            //           border: Border.all(
            //               width: 0.5, color: greyColor.withOpacity(0.50)),
            //           borderRadius: BorderRadius.circular(15)),
            //       padding:
            //           const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            //       child: Image.asset(ImageConstants.back)),
            // ),
            widthSizedBox(10),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Chat",
                  style: mainHeadingTS,
                ),
              ),
            ),
          ],
        ),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 0),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            child: SvgPicture.asset(notification),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: List.generate(10, (index) {
          return Column(
            children: [
              InkWell(
                onTap: () => navigationPush(context, const ChatDetails()),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: CachedNetworkImage(
                        height: 65,
                        width: 65,
                        fit: BoxFit.fill,
                        imageUrl:
                            "https://www.mobisafar.com/images/testimonial/dummy-profile.png",
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: greyColor,
                          highlightColor: Colors.grey.shade700,
                          child: const SizedBox(height: double.infinity),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    widthSizedBox(10),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("St george st george", style: mainHeadingTS),
                              heightSizedBox(7),
                              Text("I love them!", style: greyST),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("09 : 38", style: greyST),
                              heightSizedBox(0),
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: primaryBlueColor),
                                padding: const EdgeInsets.all(7),
                                child: Text("8",
                                    style: TextStyle(color: whiteColor)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 25,
              )
            ],
          );
        }),
      ),
    );
  }
}
