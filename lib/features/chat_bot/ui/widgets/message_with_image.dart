import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageWithImage extends StatelessWidget {
  const MessageWithImage(
      {super.key, required this.message, required this.image,  this.isMe = true});

  final String message;
  final File image;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        child: Container(
          decoration: BoxDecoration(
            color:isMe ? Colors.purple.shade300 : Colors.grey.shade500,
            borderRadius: isMe? BorderRadius.only(
              topLeft: Radius.circular(14.r),
              topRight: Radius.circular(14.r),
              bottomLeft: Radius.circular(14.r),
            ):
            const BorderRadius.only(
              topLeft: Radius.circular(14),
              topRight: Radius.circular(14),
              bottomRight: Radius.circular(14),
            ) 
            ,
          ),
          constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.75),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12.r)),
                  child: Image(
                    height: 170.h,
                    width: MediaQuery.of(context).size.width * 0.73,
                    fit: BoxFit.cover,
                    image: FileImage(image),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: Align(
                    alignment:isMe? Alignment.centerLeft : Alignment.centerRight,
                    child: Text(
                      message,
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
