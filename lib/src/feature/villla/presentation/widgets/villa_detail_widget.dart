import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:villa_idealis/src/core/models/villa_models.dart';

import '../../../../../size_config.dart';
import '../../../../core/constant/color_constant.dart';
import '../../../../core/constant/style_constant.dart';
import '../../../../core/utils/button_util.dart';
import '../../../../core/utils/text_util.dart';
import 'modal_all_facility_widget.dart';

class VillaDetailWidget extends StatefulWidget {
  final VillaResponse villa; // Adjust the type according to your data model

  const VillaDetailWidget({Key? key, required this.villa}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _VillaDetailWidgetState createState() => _VillaDetailWidgetState();
}

class _VillaDetailWidgetState extends State<VillaDetailWidget> {
  @override
  Widget build(BuildContext context) {
    final double fontSizeTextIcon = getProportionateScreenWidth(context, 12);
    final double fontSizeIcon = getProportionateScreenWidth(context, 20);

    Future<void> launchInBrowser(String phoneNumber) async {
      const message = 'Halo, Saya Customer Idealis!\n'
          'ingin membooking villa apakah masih ada ?';

      final whatsappUrl = Uri.parse(
          'https://wa.me/$phoneNumber/?text=${Uri.encodeComponent(message)}');

      if (!await launchUrl(
        whatsappUrl,
        mode: LaunchMode.platformDefault,
      )) {
        throw Exception('Could not launch');
      }
    }

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(context, 14),
          vertical: getProportionateScreenWidth(context, 12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //todo Interesting Points
          buildTextCustom(context, 'Yang menarik dari tempat ini',
              weight: 'w700', fontSize: 16),
          SizedBox(height: getProportionateScreenWidth(context, 20)),
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.pin_drop_rounded,
                    size: getProportionateScreenWidth(context, 26),
                    color: kPrimaryColor,
                  ),
                  SizedBox(width: getProportionateScreenWidth(context, 20)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTextCustom(context, 'Lokasi Strategis',
                          fontSize: 14),
                      SizedBox(height: getProportionateScreenWidth(context, 4)),
                      RichText(
                        text: TextSpan(
                            text:
                                "90% tamu mengklaim pemandangannya sangat \nindah",
                            style: TextStyle(
                                height: 1.3,
                                fontSize:
                                    getProportionateScreenWidth(context, 13),
                                color: Colors.black.withOpacity(0.5))),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: getProportionateScreenWidth(context, 20)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.sunny,
                    size: getProportionateScreenWidth(context, 26),
                    color: kPrimaryColor,
                  ),
                  SizedBox(width: getProportionateScreenWidth(context, 20)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTextCustom(context, 'Fasilitas Lengkap',
                          fontSize: 14),
                      SizedBox(height: getProportionateScreenWidth(context, 4)),
                      RichText(
                        text: TextSpan(
                            text: "Fasilitas di villa ini sangat lah lengkap",
                            style: TextStyle(
                                height: 1.3,
                                fontSize:
                                    getProportionateScreenWidth(context, 13),
                                color: Colors.black.withOpacity(0.5))),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: getProportionateScreenWidth(context, 20)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.pool_rounded,
                    size: getProportionateScreenWidth(context, 26),
                    color: kPrimaryColor,
                  ),
                  SizedBox(width: getProportionateScreenWidth(context, 20)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTextCustom(context, 'Private Pool', fontSize: 14),
                      SizedBox(height: getProportionateScreenWidth(context, 4)),
                      RichText(
                        text: TextSpan(
                            text:
                                "Terdapat kolam renang privat yang bisa Anda \npakai",
                            style: TextStyle(
                                height: 1.3,
                                fontSize:
                                    getProportionateScreenWidth(context, 13),
                                color: Colors.black.withOpacity(0.5))),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenWidth(context, 20)),
          //todo Description
          buildTextCustom(context, 'Tentang villa ini',
              weight: 'w700', fontSize: 16),
          SizedBox(height: getProportionateScreenWidth(context, 10)),
          RichText(
              text: TextSpan(
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: getProportionateScreenWidth(context, 13)),
                  children: [
                TextSpan(
                    text: "${widget.villa.data!.description}\n\n",
                    style: const TextStyle(
                      height: 1.3,
                    )),
              ])),
          SizedBox(height: getProportionateScreenWidth(context, 20)),
          //todo List Fasilitas
          buildTextCustom(context, 'Fasilitas yang di tawarkan',
              weight: 'w700', fontSize: 16),
          SizedBox(height: getProportionateScreenWidth(context, 10)),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of icons per row
                crossAxisSpacing: 8.0, // Spacing horizontally
                mainAxisSpacing: 0.0, // Spacing vertically
                childAspectRatio: 5),
            itemCount: widget.villa.data!.facility.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(context, 2)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(getIconData(widget.villa.data!.facility[index].icon!),
                        size: fontSizeIcon, color: kPrimaryColor),
                    const SizedBox(width: 10.0),
                    Text(
                      "${widget.villa.data!.facility[index].value != null && widget.villa.data!.facility[index].value != '0' ? '${widget.villa.data!.facility[index].value} ' : ''}${widget.villa.data!.facility[index].title}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: fontSizeTextIcon,
                        color: Colors.black54,
                      ),
                    )
                  ],
                ),
              );
            },
          ),
          SizedBox(height: getProportionateScreenWidth(context, 5)),
          buildOutlinedButton(
            context,
            "Lihat semua fasilitas",
            onPressed: () => {
              showModalBottomSheet<void>(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return DraggableBottomSheet(
                    facilities: widget.villa.data!.facility,
                  );
                },
              )
            },
            width: double.infinity,
            height: 34,
            fontSize: 12,
          ),
          SizedBox(height: getProportionateScreenWidth(context, 20)),
          Card(
            elevation: 0,
            color: kWhiteColor,
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  getProportionateScreenWidth(context, 4)),
              side: BorderSide(
                color: Colors.grey.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(getProportionateScreenWidth(context, 12)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildTextCustom(
                          context, widget.villa.data!.subCategory!.title!,
                          fontSize: 14, weight: 'w700'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.confirmation_num_rounded,
                            color: kPrimaryColor,
                            size: getProportionateScreenWidth(context, 18),
                          ),
                          SizedBox(
                              width: getProportionateScreenWidth(context, 8)),
                          buildTextCustom(context, widget.villa.data!.code!,
                              fontSize: 12)
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: getProportionateScreenWidth(context, 12)),
                  RichText(
                    text: TextSpan(
                        text:
                            "Booking villa ini sekarang !!! \nAnda bisa membooking villa ini dengan menekan 'Chat Sekarang' di bawah ini",
                        style: TextStyle(
                            height: 1.3,
                            fontSize: getProportionateScreenWidth(context, 13),
                            color: Colors.black.withOpacity(0.5))),
                  ),
                  SizedBox(height: getProportionateScreenWidth(context, 16)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildTextCustom(context, 'Chat to Whatsapp',
                          fontSize: 12,
                          weight: 'w500',
                          color: Colors.black.withOpacity(0.7)),
                      buildTextCustom(
                        context,
                        widget.villa.data!.whatsappNumber!,
                        fontSize: 12,
                        color: kPrimaryColor,
                      )
                    ],
                  ),
                  SizedBox(height: getProportionateScreenWidth(context, 10)),
                  buildElevatedButton(context, "Chat Sekarang",
                      onPressed: () =>
                          {launchInBrowser(widget.villa.data!.whatsappNumber!)},
                      width: double.infinity,
                      height: 34,
                      icon: Icons.chat_rounded,
                      fontSize: 13)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
