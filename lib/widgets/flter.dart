import 'package:flutter/material.dart';
import 'package:rentaroof/widgets/buttons.dart';
import 'package:rentaroof/utils/iamge_constants.dart';

import '../utils/common.dart';
import '../utils/style.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({Key? key}) : super(key: key);

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  List<String> categoryList = ["Any", "Apartment", "Townhouse", "House"];

  late String selectedCategory;

  @override
  void initState() {
    super.initState();
    selectedCategory = categoryList[0];
  }

  int age = 10, bed = 1, bath = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getHeight(context) * 0.7,
      child: Column(
        children: [
          heightSizedBox(15.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widthSizedBox(20),
                Text('Filter', style: mainHeadingTS),
                InkWell(
                  onTap: () => navigationPop(context),
                  child: Image.asset(ImageConstants.close),
                ),
              ],
            ),
          ),
          heightSizedBox(15.0),
          const Divider(height: 1),
          Expanded(
            child: ListView(
              children: [
                heightSizedBox(15.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      heightSizedBox(10),
                      Text("Property Type", style: headingTS),
                      heightSizedBox(10),
                      SizedBox(
                        height: 35,
                        child: ListView(
                          padding: const EdgeInsets.symmetric(horizontal: 0.0),
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
                                            width: 0.7,
                                            color: primaryBlueColor),
                                        borderRadius: BorderRadius.circular(8))
                                    : null,
                                padding: selectedCategory == category
                                    ? const EdgeInsets.symmetric(horizontal: 13)
                                    : EdgeInsets.only(
                                        left:
                                            categoryList.indexOf(category) != 0
                                                ? 13
                                                : 0,
                                      ),
                                margin: categoryList.indexOf(selectedCategory) >
                                            0 &&
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
                      heightSizedBox(25.0),
                      Text("Price Monthly", style: headingTS),
                      heightSizedBox(0),
                    ],
                  ),
                ),
                Slider(
                  inactiveColor: primaryBlueColor.withOpacity(0.4),
                  activeColor: primaryBlueColor,
                  thumbColor: primaryBlueColor,
                  label: "Select Age",
                  value: age.toDouble(),
                  onChanged: (value) {
                    setState(() {
                      age = value.toInt();
                    });
                  },
                  min: 0,
                  max: 2000,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Min", style: greyST.copyWith(fontSize: 11)),
                              Text("\$1,200",
                                  style: mainHeadingTS.copyWith(fontSize: 12)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("MAx", style: greyST.copyWith(fontSize: 11)),
                              Text("\$3,200",
                                  style: mainHeadingTS.copyWith(fontSize: 12)),
                            ],
                          ),
                        ],
                      ),
                      heightSizedBox(25.0),
                      Text("Bedrooms", style: headingTS),
                      heightSizedBox(10),
                      Row(
                        children: List.generate(4, (index) {
                          int i = index + 1;
                          return InkWell(
                            onTap: () => setState(() => bed = i),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: bed == i ? lightblueColor : null,
                                  border: Border.all(
                                      width: 0.7,
                                      color: bed == i
                                          ? primaryBlueColor
                                          : greyColor),
                                  borderRadius: BorderRadius.circular(8)),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 13, vertical: 10),
                              margin: const EdgeInsets.only(right: 10),
                              alignment: Alignment.center,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                    child: Image.asset(
                                      bed == i
                                          ? ImageConstants.bedBlue
                                          : ImageConstants.bed,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  widthSizedBox(10),
                                  Text(
                                    i.toString(),
                                    style: bed == i
                                        ? TextStyle(
                                            color: primaryBlueColor,
                                            fontWeight: FontWeight.w600)
                                        : TextStyle(color: greyColor),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                      heightSizedBox(25.0),
                      Text("Bathrooms", style: headingTS),
                      heightSizedBox(10),
                      Row(
                        children: List.generate(4, (index) {
                          int i = index + 1;
                          return InkWell(
                            onTap: () => setState(() => bath = i),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: bath == i ? lightblueColor : null,
                                  border: Border.all(
                                      width: 0.7,
                                      color: bath == i
                                          ? primaryBlueColor
                                          : greyColor),
                                  borderRadius: BorderRadius.circular(8)),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 13, vertical: 10),
                              margin: const EdgeInsets.only(right: 10),
                              alignment: Alignment.center,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                    child: Image.asset(
                                      ImageConstants.bath,
                                      color:
                                          bath == i ? primaryBlueColor : null,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  widthSizedBox(10),
                                  Text(
                                    i.toString(),
                                    style: bath == i
                                        ? TextStyle(
                                            color: primaryBlueColor,
                                            fontWeight: FontWeight.w600)
                                        : TextStyle(color: greyColor),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                      heightSizedBox(25),
                      BigButton(
                        color: primaryYellowColor,
                        onTap: () {},
                        title: "Search",
                      )
                    ],
                  ),
                ),
                heightSizedBox(25.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
