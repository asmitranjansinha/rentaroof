import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

import '../utils/common.dart';
import '../utils/iamge_constants.dart';
import '../utils/style.dart';

class ChatDetails extends StatefulWidget {
  const ChatDetails({Key? key}) : super(key: key);

  @override
  State<ChatDetails> createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: CachedNetworkImage(
                height: 45,
                width: 45,
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
            widthSizedBox(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("ST GEORGE", style: mainHeadingTS),
                Text("Online", style: subTitleST),
              ],
            ),
          ],
        ),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            child: SvgPicture.asset(notification),
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 65),
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              reverse: true,
              children: List.generate(12, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Column(
                    crossAxisAlignment: index.isEven
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.end,
                    children: [
                      index.isEven ? peerCard() : myCard(),
                      heightSizedBox(5),
                      const Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Text("09 : 32", style: TextStyle(fontSize: 10)),
                      )
                    ],
                  ),
                );
              }),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Container(
                      decoration: shadowDecoration.copyWith(
                          borderRadius: BorderRadius.circular(25)),
                      child: TextFormField(
                        decoration: inputDecoration(
                          context,
                          hint: "John",
                          prefixIcon: Container(
                            padding: const EdgeInsets.only(left: 15, right: 10),
                            height: 25,
                            child: Image.asset(
                              ImageConstants.emoji,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  widthSizedBox(15),
                  SvgPicture.asset(
                    send,
                    height: 80,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  InputDecoration inputDecoration(BuildContext context,
      {Widget? prefixIcon, String? hint, suffixIcon}) {
    return InputDecoration(
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      hintText: hint,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      suffixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
      prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: const BorderSide(width: 0, style: BorderStyle.none),
      ),
      filled: true,
      fillColor: whiteColor,
    );
  }

  Widget myCard() {
    return Container(
      decoration: shadowDecoration.copyWith(
          color: primaryBlueColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          )),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Text("Lorem ipsum dolor sit amet.",
          style: TextStyle(color: whiteColor)),
    );
  }

  Widget peerCard() {
    return Container(
      decoration: shadowDecoration.copyWith(
          // color: whi,
          borderRadius: const BorderRadius.only(
        topRight: Radius.circular(12),
        bottomRight: Radius.circular(12),
        bottomLeft: Radius.circular(12),
      )),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Text("Lorem ipsum dolor sit amet.",
          style: TextStyle(color: blackColor.withOpacity(0.8))),
    );
  }
}
