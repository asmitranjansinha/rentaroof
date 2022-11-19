import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Elements/apartment_item.dart';
import '../Elements/drawer.dart';
import '../Elements/footer_item.dart';
import '../Utils/common.dart';
import '../Utils/iamge_constants.dart';
import '../Utils/style.dart';

class PropertyList extends StatefulWidget {
  const PropertyList({Key? key}) : super(key: key);

  @override
  State<PropertyList> createState() => _PropertyListState();
}

class _PropertyListState extends State<PropertyList> {
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
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 0.5, color: greyColor.withOpacity(0.50)),
                      borderRadius: BorderRadius.circular(15)),
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  child: Image.asset(ImageConstants.manuBar)),
            ),
            widthSizedBox(10),
            SvgPicture.asset(
              appIcon,
              height: 30,
            ),
            Expanded(
                child: Container(
              alignment: Alignment.center,
              child: Text("Property list", style: mainHeadingTS),
            ))
          ],
        ),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 0),
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: SvgPicture.asset(notification),
          ),
          widthSizedBox(18),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: CustomScrollView(
              primary: true,
              shrinkWrap: false,
              slivers: <Widget>[
                SliverAppBar(
                  backgroundColor: whiteColor,
                  expandedHeight: 100,
                  elevation: 0,
                  leading: heightSizedBox(0.0),
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    background: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        heightSizedBox(20.0),
                        Container(
                          height: 55,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          margin: const EdgeInsets.symmetric(horizontal: 18),
                          decoration: BoxDecoration(
                            color: lightGreyColor,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: InkWell(
                            child: Row(
                              children: [
                                SvgPicture.asset(search),
                                widthSizedBox(15),
                                Expanded(
                                  child: Text(
                                    "Search cities, localities, etc.",
                                    style: TextStyle(
                                        fontSize: 14.0, color: greyColor),
                                  ),
                                ),
                                Container(
                                    height: 22, width: 1, color: greyColor),
                                widthSizedBox(15),
                                SvgPicture.asset(filter),
                              ],
                            ),
                          ),
                        ),
                        heightSizedBox(20.0)
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Wrap(
                    runSpacing: 10,
                    children: [
                      Column(
                        children: List.generate(5, (index) {
                          return ApartmentItem(isPage: 1, i: index);
                        }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: FooterItem(),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 80, right: 25),
              child: FloatingActionButton(
                backgroundColor: whiteColor,
                elevation: 10,
                onPressed: () {},
                child: SvgPicture.asset(
                  search2,
                  height: 100,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
