import 'package:flutter/material.dart';
import 'package:medosedo_ecommerce/data/model/response/message_model.dart';
import 'package:medosedo_ecommerce/helper/date_converter.dart';
import 'package:medosedo_ecommerce/provider/chat_provider.dart';
import 'package:medosedo_ecommerce/utill/color_resources.dart';
import 'package:medosedo_ecommerce/utill/custom_themes.dart';
import 'package:medosedo_ecommerce/utill/dimensions.dart';
import 'package:medosedo_ecommerce/provider/splash_provider.dart';
import 'package:medosedo_ecommerce/view/basewidget/custom_image.dart';
import 'package:provider/provider.dart';

class MessageBubble extends StatelessWidget {
  final Message message;
  MessageBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    bool isMe = message.sentByCustomer == 1;
    String dateTime =
        DateConverter.localDateToIsoStringAMPM(message.createdAt!);
    String baseUrl =
        Provider.of<ChatProvider>(context, listen: false).userTypeIndex == 0
            ? Provider.of<SplashProvider>(context, listen: false)
                .baseUrls
                .shopImageUrl
            : Provider.of<SplashProvider>(context, listen: false)
                .baseUrls
                .deliveryManImage;
    String? image =
        Provider.of<ChatProvider>(context, listen: false).userTypeIndex == 0
            ? message.sellerInfo != null
                ? message.sellerInfo?.shops![0].image
                : ''
            : message.deliveryManId.image;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        isMe
            ? SizedBox.shrink()
            : InkWell(
                onTap: () {},
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: ClipRRect(
                    child: CustomImage(
                      placeholder: 'assets/images/upload_image.png',
                      fit: BoxFit.cover,
                      width: 40,
                      height: 40,
                      image: '$baseUrl/$image',
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
        Flexible(
          child: Container(
            margin: isMe
                ? EdgeInsets.fromLTRB(50, 4, 7, 4)
                : EdgeInsets.fromLTRB(7, 4, 50, 4),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: isMe ? Radius.circular(10) : Radius.circular(0),
                  bottomRight: isMe ? Radius.circular(0) : Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: isMe
                    ? ColorResources.getImageBg(context)
                    : Theme.of(context).highlightColor),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              !isMe
                  ? Text(dateTime,
                      style: titilliumRegular.copyWith(
                        fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                        color: ColorResources.getHint(context),
                      ))
                  : SizedBox.shrink(),
              message.message != null
                  ? Text(message.message ?? '',
                      textAlign: TextAlign.justify,
                      style: titilliumRegular.copyWith(
                          fontSize: Dimensions.FONT_SIZE_SMALL))
                  : SizedBox.shrink(),
              //chat.image != null ? Image.file(chat.image) : SizedBox.shrink(),
            ]),
          ),
        ),
      ],
    );
  }
}
