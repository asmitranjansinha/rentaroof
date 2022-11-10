import 'package:flutter/material.dart';

import '../Elements/buttons.dart';
import '../Elements/footer_item.dart';
import '../Utils/common.dart';
import '../Utils/iamge_constants.dart';
import '../Utils/style.dart';

class AddRentDetails extends StatefulWidget {
  const AddRentDetails({Key? key}) : super(key: key);

  @override
  State<AddRentDetails> createState() => _AddRentDetailsState();
}

class _AddRentDetailsState extends State<AddRentDetails> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController referralCodeController = TextEditingController();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> propertyList = ["Yes", "No "];
  List<String> paymentList = ["UPI", "NET BANKING "];
  String? property, address, payment;
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
                  "Add Rent Details",
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
            padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 0),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            child: Image.asset(ImageConstants.bell),
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
                Text("Rent Amount", style: headingTS),
                heightSizedBox(5.0),
                TextFormField(
                  controller: nameController,
                  decoration: inputDecoration(context, hint: "Rs. 2000"),
                ),
                heightSizedBox(getHeight(context) * 0.03),
                Text("Select Month *", style: headingTS),
                heightSizedBox(5.0),
                TextFormField(
                  controller: emailController,
                  decoration: inputDecoration(context, hint: "2 Months"),
                ),
                heightSizedBox(getHeight(context) * 0.03),
                Text("Monthly Maintence ( if any)", style: headingTS),
                heightSizedBox(5.0),
                InputDecorator(
                  decoration: inputDecoration(context, hint: "Select"),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      style: const TextStyle(color: Colors.black),
                      value: property,
                      isDense: true,
                      hint: const Text('Select'),
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
                const Divider(),
                heightSizedBox(getHeight(context) * 0.03),
                Text("Owner Full Name*", style: headingTS),
                heightSizedBox(5.0),
                TextFormField(
                  controller: mobileController,
                  decoration: inputDecoration(context, hint: "Tridev"),
                ),
                heightSizedBox(getHeight(context) * 0.03),
                Text("Owner Mobile No*", style: headingTS),
                heightSizedBox(5.0),
                TextFormField(
                  controller: mobileController,
                  decoration: inputDecoration(context, hint: "+1 2565 6565 56"),
                ),
                heightSizedBox(getHeight(context) * 0.03),
                Text("Owner Email*", style: headingTS),
                heightSizedBox(5.0),
                TextFormField(
                  controller: mobileController,
                  decoration:
                      inputDecoration(context, hint: "Tridev@gmail.com"),
                ),
                heightSizedBox(getHeight(context) * 0.03),
                Text("Owner is in same address*", style: headingTS),
                heightSizedBox(5.0),
                InputDecorator(
                  decoration: inputDecoration(context, hint: "Select"),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      style: const TextStyle(color: Colors.black),
                      value: address,
                      isDense: true,
                      hint: const Text('Select'),
                      icon: Icon(
                        Icons.keyboard_arrow_down, // Add this
                        color: greyColor, // Add this
                      ),
                      onChanged: (String? v) => setState(() => address = v),
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
                const Divider(),
                heightSizedBox(getHeight(context) * 0.03),
                Text("payment Type", style: headingTS),
                heightSizedBox(5.0),
                InputDecorator(
                  decoration: inputDecoration(context, hint: "Select"),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      style: const TextStyle(color: Colors.black),
                      value: payment,
                      isDense: true,
                      hint: const Text('Select'),
                      icon: Icon(
                        Icons.keyboard_arrow_down, // Add this
                        color: greyColor, // Add this
                      ),
                      onChanged: (String? v) => setState(() => payment = v),
                      items: paymentList.map((item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                heightSizedBox(getHeight(context) * 0.03),
                Text("UPI Id", style: headingTS),
                heightSizedBox(5.0),
                TextFormField(
                  controller: mobileController,
                  decoration: inputDecoration(context, hint: "Trded@xyz"),
                ),
                heightSizedBox(getHeight(context) * 0.03),
                BigButton(onTap: () {}, title: "Submit"),
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
