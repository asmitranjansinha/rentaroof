import 'package:flutter/material.dart';

import '../utils/common.dart';
import '../utils/style.dart';

// ignore: must_be_immutable
class DropDownBtn extends StatefulWidget {
  String? hint;
  dynamic listData;

  String? currentItem;
  String? labelText;
  double? vertical;
  double? iconSize;
  double? horizontal;
  TextEditingController? listController = TextEditingController();
  dynamic onChanged;

  String? Function(dynamic)? formValidator;

  DropDownBtn(
      {Key? key,
      this.labelText,
      this.hint,
      this.listData,
      this.vertical,
      this.horizontal,
      this.iconSize,
      this.listController,
      this.formValidator,
      this.currentItem,
      this.onChanged})
      : super(key: key);

  @override
  State<DropDownBtn> createState() => _DropDownBtnState();
}

class _DropDownBtnState extends State<DropDownBtn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.labelText != null
            ? Text(widget.labelText!, style: headingTS)
            : heightSizedBox(0.0),
        DropdownButtonHideUnderline(
          child: DropdownButtonFormField<dynamic>(
              dropdownColor: whiteColor,
              value: widget.currentItem,
              validator: widget.formValidator,
              icon: Icon(
                Icons.arrow_drop_down,
                size: widget.iconSize ?? 18,
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              iconSize: 18,
              elevation: 1,
              style: const TextStyle(fontSize: 15.0, color: Colors.black87),
              onChanged: widget.onChanged ??
                  (dynamic newValue) {
                    FocusScope.of(context).requestFocus(FocusNode());
                    setState(() {
                      widget.currentItem = newValue;
                    });
                  },
              items: widget.listData.map<DropdownMenuItem>((dynamic value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value, style: greyST),
                );
              }).toList(),
              hint: Text(
                widget.hint ?? '',
              ),
              decoration: InputDecoration(
                focusColor: Colors.black,
                hoverColor: Colors.black,
                labelStyle: headingTS,
                contentPadding: EdgeInsets.symmetric(
                    vertical: widget.vertical ?? 5.0,
                    horizontal: widget.horizontal ?? 0),
                isDense: true,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: primaryBlueColor, width: 1.0),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
                border: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0)),
                suffixIconConstraints:
                    const BoxConstraints(minWidth: 0, minHeight: 0),
              )),
        ),
      ],
    );
  }
}
