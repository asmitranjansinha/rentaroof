import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rentaroof/views/add_rent_details.dart';

import '../widgets/buttons.dart';
import '../widgets/footer_item.dart';
import '../utils/common.dart';
import '../utils/iamge_constants.dart';
import '../utils/style.dart';

class AddProperty extends StatefulWidget {
  const AddProperty({Key? key}) : super(key: key);

  @override
  State<AddProperty> createState() => _AddPropertyState();
}

class _AddPropertyState extends State<AddProperty> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController referralCodeController = TextEditingController();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> propertyList = [
    "Apartment",
    "Town House",
    "3 BHK Apartment",
    "Vila"
  ];
  String? property;
  int /*age = 10,*/ bed = 1, bath = 1, floors = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            InkWell(
              onTap: () => navigationPop(context),
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 0.5, color: greyColor.withOpacity(0.50)),
                      borderRadius: BorderRadius.circular(15)),
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  child: Image.asset(ImageConstants.back)),
            ),
            widthSizedBox(15),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Add Your Property",
                  style: mainHeadingTS,
                ),
              ),
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
            padding: const EdgeInsets.only(bottom: 50),
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                heightSizedBox(getHeight(context) * 0.03),
                Text("What Type of Property do you Post ?", style: headingTS),
                heightSizedBox(5.0),
                InputDecorator(
                  decoration: inputDecoration(context, hint: "Select property"),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      style: const TextStyle(color: Colors.black),
                      value: property,
                      isDense: true,
                      hint: const Text('Select property'),
                      icon: Icon(
                        Icons.keyboard_arrow_down, // Add this
                        color: greyColor, // Add this
                      ),
                      onChanged: (String? v) => setState(() => property = v),
                      items: propertyList.map((item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                heightSizedBox(getHeight(context) * 0.03),
                Text("Property Location", style: headingTS),
                heightSizedBox(5.0),
                TextFormField(
                  controller: nameController,
                  decoration: inputDecoration(context, hint: "Pune"),
                ),
                heightSizedBox(getHeight(context) * 0.03),
                Text("Super Builtup are(ft)", style: headingTS),
                heightSizedBox(5.0),
                TextFormField(
                  controller: emailController,
                  decoration: inputDecoration(context, hint: "1500 ft"),
                ),
                heightSizedBox(getHeight(context) * 0.03),
                const Divider(),
                heightSizedBox(getHeight(context) * 0.03),
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
                                color: bed == i ? primaryBlueColor : greyColor),
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
                heightSizedBox(getHeight(context) * 0.03),
                const Divider(),
                heightSizedBox(getHeight(context) * 0.03),
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
                                color:
                                    bath == i ? primaryBlueColor : greyColor),
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
                                color: bath == i ? primaryBlueColor : null,
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
                heightSizedBox(getHeight(context) * 0.03),
                const Divider(),
                heightSizedBox(getHeight(context) * 0.03),
                Text("Total Floors", style: headingTS),
                heightSizedBox(10),
                Row(
                  children: List.generate(3, (index) {
                    int i = index + 1;
                    return InkWell(
                      onTap: () => setState(() => floors = i),
                      child: Container(
                        decoration: BoxDecoration(
                            color: floors == i ? lightblueColor : null,
                            border: Border.all(
                                width: 0.7,
                                color:
                                    floors == i ? primaryBlueColor : greyColor),
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
                                ImageConstants.building2,
                                color: floors == i ? primaryBlueColor : null,
                                fit: BoxFit.fill,
                              ),
                            ),
                            widthSizedBox(10),
                            Text(
                              i.toString(),
                              style: floors == i
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
                heightSizedBox(getHeight(context) * 0.03),
                const Divider(),
                heightSizedBox(getHeight(context) * 0.03),
                Text("Furnishing", style: headingTS),
                heightSizedBox(5.0),
                TextFormField(
                  controller: mobileController,
                  decoration: inputDecoration(context, hint: "Furnished"),
                ),
                heightSizedBox(getHeight(context) * 0.03),
                const Divider(),
                heightSizedBox(getHeight(context) * 0.03),
                Text("Title", style: headingTS),
                heightSizedBox(5.0),
                TextFormField(
                  controller: mobileController,
                  decoration: inputDecoration(context, hint: "Lorem"),
                ),
                heightSizedBox(getHeight(context) * 0.03),
                Text("Description *", style: headingTS),
                heightSizedBox(5.0),
                TextFormField(
                  controller: mobileController,
                  decoration: inputDecoration(context, hint: "Lorem"),
                  maxLines: 5,
                ),
                heightSizedBox(getHeight(context) * 0.03),
                Container(
                  decoration: BoxDecoration(
                      color: middle2GreyColor,
                      borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.symmetric(vertical: 35),
                  child: Column(
                    children: [
                      Image.asset(ImageConstants.gallery),
                      Text(
                        "Upload Upto 10 Photos",
                        style: greyST,
                      ),
                    ],
                  ),
                ),
                heightSizedBox(getHeight(context) * 0.03),
                BigButton(
                    onTap: () =>
                        navigationPush(context, const AddRentDetails()),
                    title: "Submit"),
                heightSizedBox(35),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: FooterItem(),
          ),
        ],
      ),
    );
  }
}

InputDecoration inputDecoration(BuildContext context,
    {Widget? prefixIcon, String? hint, suffixIcon}) {
  return InputDecoration(
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
    hintText: hint,
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    suffixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
    prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(width: 0, style: BorderStyle.none),
    ),
    filled: true,
    fillColor: lightGreyColor,
  );
}
