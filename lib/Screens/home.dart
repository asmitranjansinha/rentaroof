import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rentaroof/Screens/add_property.dart';
import 'package:rentaroof/Screens/property_list.dart';

import '../Elements/apartment_item.dart';
import '../Elements/drawer.dart';
import '../Elements/flter.dart';
import '../Elements/heading_row.dart';
import '../Elements/image_slider.dart';
import '../Elements/propert_item.dart';
import '../Elements/top_vising_item.dart';
import '../Utils/common.dart';
import '../Utils/iamge_constants.dart';
import '../Utils/style.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> list = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRz1pMGjF_axBgdKiDS4pX1R6NjczOtXVwS2jmX0yaHhrNT_3IRkj_yVv5C3uZlAr6kaU&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSM79NAcJXr-PBiJzGBcoVrn5BYd1CYyoG6_axBGy-wj8s8ESxyHvJMD2H5WlmKdu7zZy4&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR87QDckjdpSUSi5ZpZP8sT_dK_bPl87uXv6641LW74Yhz5FmGX5L7vezUI8RbwiUHp7j8&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTza0-iHyksnA-MSw-cX80SL9Xg7Q94e9-Tfln1fWysBg2IR2fr6uIKb0TsFSAgyeaPdEc&usqp=CAU",
  ];

  List<String> categoryList = [
    "Apartment",
    "Town House",
    "3 BHK Apartment",
    "Vila",
  ];
  late String selectedCategory;

  @override
  void initState() {
    super.initState();
    selectedCategory = categoryList[0];
  }

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
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 3),
                  child: SvgPicture.asset(menu)),
            ),
            widthSizedBox(10),
            SvgPicture.asset(
              appIcon,
              height: 30,
            ),
          ],
        ),
        actions: [
          InkWell(
            onTap: () => navigationPush(context, const AddProperty()),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 0.5, color: greyColor.withOpacity(0.50)),
                  borderRadius: BorderRadius.circular(15)),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  Image.asset(ImageConstants.building,
                      height: 16, fit: BoxFit.fill),
                  widthSizedBox(8),
                  Text(
                    "List Your Property",
                    style: TextStyle(color: primaryBlueColor, fontSize: 12),
                  )
                ],
              ),
            ),
          ),
          widthSizedBox(8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 0),
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: SvgPicture.asset(notification),
          ),
          widthSizedBox(18),
        ],
      ),
      body: CustomScrollView(
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
                              style:
                                  TextStyle(fontSize: 14.0, color: greyColor),
                            ),
                          ),
                          Container(height: 22, width: 1, color: greyColor),
                          widthSizedBox(15),
                          InkWell(
                            onTap: () => filterBottomSheet(context),
                            child: SvgPicture.asset(filter),
                          ),
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
              runSpacing: 0,
              children: [
                BannerSlider(imageList: list),
                heightSizedBox2(25),
                SizedBox(
                  height: 40,
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    scrollDirection: Axis.horizontal,
                    children: List.generate(categoryList.length, (index) {
                      String category = categoryList[index];
                      return InkWell(
                        onTap: () =>
                            setState(() => selectedCategory = category),
                        child: Container(
                          decoration: selectedCategory == category
                              ? BoxDecoration(
                                  color: lightblueColor,
                                  border: Border.all(
                                      width: 0.7, color: primaryBlueColor),
                                  borderRadius: BorderRadius.circular(8))
                              : null,
                          padding: selectedCategory == category
                              ? const EdgeInsets.symmetric(horizontal: 13)
                              : EdgeInsets.only(
                                  left: categoryList.indexOf(category) != 0
                                      ? 13
                                      : 0,
                                ),
                          margin: categoryList.indexOf(selectedCategory) > 0 &&
                                  selectedCategory == category
                              ? const EdgeInsets.only(left: 13)
                              : null,
                          alignment: Alignment.center,
                          child: Text(
                            category,
                            style: selectedCategory == category
                                ? TextStyle(
                                    color: primaryBlueColor,
                                    fontWeight: FontWeight.w600)
                                : TextStyle(color: greyColor),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                heightSizedBox2(25),
                HeadingRow(
                  title: "New Listed Properties",
                  subTitle: "Lorem ipsum dolor sit amet,  adipiscing elit...",
                  onTap: () => navigationPush(context, const PropertyList()),
                ),
                heightSizedBox2(15),
                SizedBox(
                  height: 350,
                  child: ListView(
                    padding: const EdgeInsets.only(left: 15),
                    scrollDirection: Axis.horizontal,
                    children: List.generate(3, (index) {
                      return ApartmentItem(i: index);
                    }),
                  ),
                ),
                heightSizedBox2(25),
                HeadingRow(
                  title: "Curated properties for you",
                  subTitle: "Lorem ipsum dolor sit amet,  adipiscing elit...",
                  onTap: () {},
                ),
                SizedBox(
                  height: 215,
                  child: ListView(
                    padding: const EdgeInsets.only(bottom: 20),
                    scrollDirection: Axis.horizontal,
                    children: List.generate(3, (index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            top: 15, right: 15, left: index == 0 ? 15 : 0),
                        child: const PropertyItem(),
                      );
                    }),
                  ),
                ),
                heightSizedBox2(15),
                HeadingRow(
                  title: "Top Visited Houses",
                  subTitle: "Lorem ipsum dolor sit amet,  adipiscing elit...",
                  onTap: () {},
                ),
                heightSizedBox2(15),
                SizedBox(
                  height: 70,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 15),
                    children: List.generate(3, (index) {
                      return const Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: TopVisitingItem(),
                      );
                    }),
                  ),
                ),
                heightSizedBox2(40),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void filterBottomSheet(context) async {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: whiteColor,
      context: context,
      builder: (builder) => const FilterBottomSheet(),
    ).then((value) {
      if (value == 1) {
        // model.getMyFilterOrders(context);
      }
    });
  }
}
