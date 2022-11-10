import 'package:flutter/material.dart';

import '../Elements/buttons.dart';
import '../Elements/drawer.dart';
import '../Elements/footer_item.dart';
import '../Utils/common.dart';
import '../Utils/iamge_constants.dart';
import '../Utils/style.dart';

class ContactSupport extends StatefulWidget {
  const ContactSupport({Key? key}) : super(key: key);

  @override
  State<ContactSupport> createState() => _ContactSupportState();
}

class _ContactSupportState extends State<ContactSupport> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: whiteColor,
        drawer: const DrawerWidget(),
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 12),
                    child: Image.asset(ImageConstants.back)),
              ),
              widthSizedBox(15),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Contact Support",
                    style: mainHeadingTS,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 0.5, color: greyColor.withOpacity(0.50)),
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
              child: Column(
                children: [
                  heightSizedBox(5.0),
                  Container(
                    decoration: BoxDecoration(
                        color: middle2GreyColor,
                        borderRadius: BorderRadius.circular(8)),
                    height: 50,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: TabBar(
                      labelColor: primaryBlueColor,
                      unselectedLabelColor: greyColor,
                      indicator: boxDecoration,
                      tabs: const [
                        Tab(child: Text('Create Support Ticket')),
                        Tab(child: Text('Ticket History')),
                      ],
                    ),
                  ),
                  const Expanded(
                    child: TabBarView(
                      children: [
                        CreateSupportTicket(),
                        TicketHistory(),
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
          ],
        ),
      ),
    );
  }
}

class CreateSupportTicket extends StatefulWidget {
  const CreateSupportTicket({Key? key}) : super(key: key);

  @override
  State<CreateSupportTicket> createState() => _CreateSupportTicketState();
}

class _CreateSupportTicketState extends State<CreateSupportTicket> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController referralCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        heightSizedBox(getHeight(context) * 0.03),
        Text("Name", style: headingTS),
        heightSizedBox(5.0),
        TextFormField(
          controller: nameController,
          decoration: inputDecoration(context, hint: "John Martin "),
        ),
        heightSizedBox(getHeight(context) * 0.03),
        Text("Email", style: headingTS),
        heightSizedBox(5.0),
        TextFormField(
          controller: emailController,
          decoration: inputDecoration(context, hint: "aaa@gmail.com"),
        ),
        heightSizedBox(getHeight(context) * 0.03),
        Text("Mobile", style: headingTS),
        heightSizedBox(5.0),
        TextFormField(
          controller: mobileController,
          decoration: inputDecoration(context, hint: "+1 256 2656 152"),
        ),
        heightSizedBox(getHeight(context) * 0.03),
        Text("Subject", style: headingTS),
        heightSizedBox(5.0),
        TextFormField(
          controller: mobileController,
          decoration: inputDecoration(context, hint: ""),
        ),
        heightSizedBox(getHeight(context) * 0.03),
        Text("Details", style: headingTS),
        heightSizedBox(5.0),
        TextFormField(
          controller: mobileController,
          decoration: inputDecoration(context, hint: ""),
        ),
        heightSizedBox(getHeight(context) * 0.03),
        BigButton(onTap: () {}, title: "Submit Complain"),
        heightSizedBox(35),
      ],
    );
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
}

class TicketHistory extends StatefulWidget {
  const TicketHistory({Key? key}) : super(key: key);

  @override
  State<TicketHistory> createState() => _TicketHistoryState();
}

class _TicketHistoryState extends State<TicketHistory> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: getHeight(context) * 0.03,
      ),
      children: List.generate(5, (index) {
        return Container(
          decoration: BoxDecoration(
              color: middle2GreyColor, borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          margin: const EdgeInsets.only(bottom: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Test", style: mainHeadingTS),
                  const Text("22 October 2022 | 09 : 38",
                      style: TextStyle(fontSize: 14)),
                ],
              ),
              heightSizedBox(10),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                style: greyST,
              )
            ],
          ),
        );
      }),
    );
  }
}
