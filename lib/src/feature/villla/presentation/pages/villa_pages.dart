import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:villa_idealis/size_config.dart';
import 'package:villa_idealis/src/core/constant/color_constant.dart';
import 'package:villa_idealis/src/core/utils/button_util.dart';
import 'package:villa_idealis/src/core/utils/text_util.dart';

import '../../../home/data/models/facility_models.dart';
import '../widgets/villa_image_carousel_widget.dart';

class VillaPages extends StatefulWidget {
  const VillaPages({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _VillaPagesState createState() => _VillaPagesState();
}

class _VillaPagesState extends State<VillaPages> {
  // bool _hasCallSupport = false;
  // Future<void>? _launched;
  // String _phone = '089627210822';

  // @override
  // void initState() {
  //   super.initState();
  //   // Check for phone call support.
  //   canLaunchUrl(Uri(scheme: 'tel', path: '123')).then((bool result) {
  //     setState(() {
  //       _hasCallSupport = result;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final List<ListFacilities> listFacility = [
      ListFacilities(icon: Icons.people_outline, title: '7 Orang'),
      ListFacilities(icon: Icons.bed_outlined, title: '4 Kamar'),
      ListFacilities(icon: Icons.pool_outlined, title: 'Kolam Renang'),
      ListFacilities(icon: Icons.wifi, title: 'Wifi'),
    ];
    final double fontSizeTextIcon = getProportionateScreenWidth(context, 12);
    final double fontSizeIcon = getProportionateScreenWidth(context, 20);

    Future<void> launchInBrowser() async {
      const phoneNumber = '6289627210822';
      const message = 'Hello, this is a template message!\n'
          'This is a new line.\n'
          'Another line here.';

      final whatsappUrl = Uri.parse(
          'https://wa.me/$phoneNumber/?text=${Uri.encodeComponent(message)}');
      if (!await launchUrl(
        whatsappUrl,
        mode: LaunchMode.platformDefault,
      )) {
        throw Exception('Could not launch');
      }
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  const VillaImageCarouselWidget(),
                  Positioned(
                    top: getProportionateScreenWidth(context, 10),
                    left: getProportionateScreenWidth(context, 18),
                    child: Container(
                      width: 40,
                      height: 34.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: kWhiteColor,
                          size: 16,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    top: getProportionateScreenWidth(context, 10),
                    right: getProportionateScreenWidth(context, 10),
                    child: Row(
                      children: [
                        Container(
                          width: 34.0,
                          height: 34.0,
                          margin: const EdgeInsets.only(right: 8.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.withOpacity(0.6),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.share_rounded,
                              color: kWhiteColor,
                              size: 16,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        // Add more icons here as needed
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(context, 14),
                    vertical: getProportionateScreenWidth(context, 12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //todo Interesting Points
                    buildTextCustom(context, 'Yang menarik dari tempat ini',
                        weight: 'w600', fontSize: 16),
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
                            SizedBox(
                                width:
                                    getProportionateScreenWidth(context, 20)),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                buildTextCustom(context, 'Lokasi Strategis',
                                    fontSize: 14),
                                SizedBox(
                                    height: getProportionateScreenWidth(
                                        context, 4)),
                                RichText(
                                  text: TextSpan(
                                      text:
                                          "90% tamu memberikan bintang 5 dan sangat suka...",
                                      style: TextStyle(
                                          height: 1.3,
                                          fontSize: getProportionateScreenWidth(
                                              context, 13),
                                          color:
                                              Colors.black.withOpacity(0.5))),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                            height: getProportionateScreenWidth(context, 20)),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.sunny,
                              size: getProportionateScreenWidth(context, 26),
                              color: kPrimaryColor,
                            ),
                            SizedBox(
                                width:
                                    getProportionateScreenWidth(context, 20)),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                buildTextCustom(context, 'Lokasi Strategis',
                                    fontSize: 14),
                                SizedBox(
                                    height: getProportionateScreenWidth(
                                        context, 4)),
                                RichText(
                                  text: TextSpan(
                                      text:
                                          "90% tamu memberikan bintang 5 dan sangat suka...",
                                      style: TextStyle(
                                          height: 1.3,
                                          fontSize: getProportionateScreenWidth(
                                              context, 13),
                                          color:
                                              Colors.black.withOpacity(0.5))),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                            height: getProportionateScreenWidth(context, 20)),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.pool_rounded,
                              size: getProportionateScreenWidth(context, 26),
                              color: kPrimaryColor,
                            ),
                            SizedBox(
                                width:
                                    getProportionateScreenWidth(context, 20)),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                buildTextCustom(context, 'Lokasi Strategis',
                                    fontSize: 14),
                                SizedBox(
                                    height: getProportionateScreenWidth(
                                        context, 4)),
                                RichText(
                                  text: TextSpan(
                                      text:
                                          "90% tamu memberikan bintang 5 dan sangat suka...",
                                      style: TextStyle(
                                          height: 1.3,
                                          fontSize: getProportionateScreenWidth(
                                              context, 13),
                                          color:
                                              Colors.black.withOpacity(0.5))),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: getProportionateScreenWidth(context, 20)),
                    //todo Description
                    buildTextCustom(context, 'Tentang Mawar 1',
                        weight: 'w600', fontSize: 16),
                    SizedBox(height: getProportionateScreenWidth(context, 10)),
                    RichText(
                        text: TextSpan(
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontSize:
                                    getProportionateScreenWidth(context, 13)),
                            children: const [
                          TextSpan(
                              text:
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard\n\n",
                              style: TextStyle(
                                height: 1.3,
                              )),
                          TextSpan(
                              text:
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard\n\n",
                              style: TextStyle(
                                height: 1.3,
                              )),
                          TextSpan(
                              text:
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard",
                              style: TextStyle(
                                height: 1.3,
                              )),
                        ])),
                    SizedBox(height: getProportionateScreenWidth(context, 20)),
                    //todo List Fasilitas
                    buildTextCustom(context, 'Fasilitas yang di tawarkan',
                        weight: 'w600', fontSize: 16),
                    SizedBox(height: getProportionateScreenWidth(context, 10)),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // Number of icons per row
                              crossAxisSpacing: 8.0, // Spacing horizontally
                              mainAxisSpacing: 0.0, // Spacing vertically
                              childAspectRatio: 5),
                      itemCount: listFacility.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  getProportionateScreenWidth(context, 2)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(listFacility[index].icon,
                                  size: fontSizeIcon, color: kPrimaryColor),
                              const SizedBox(width: 10.0),
                              Text(
                                listFacility[index].title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: fontSizeTextIcon,
                                    color: Colors.black54),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    SizedBox(height: getProportionateScreenWidth(context, 5)),
                    buildOutlinedButton(context, "Lihat semua fasilitas",
                        onPressed: () => {},
                        width: double.infinity,
                        height: 34),
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
                        padding: EdgeInsets.all(
                            getProportionateScreenWidth(context, 12)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                buildTextCustom(context, 'Mawar 1',
                                    fontSize: 14, weight: 'w500'),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.confirmation_num_rounded,
                                      color: kPrimaryColor,
                                      size: getProportionateScreenWidth(
                                          context, 18),
                                    ),
                                    SizedBox(
                                        width: getProportionateScreenWidth(
                                            context,
                                            8)), // Add some spacing between the icon and text
                                    buildTextCustom(context, 'CBM-DA001',
                                        fontSize: 12)
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                                height:
                                    getProportionateScreenWidth(context, 12)),
                            RichText(
                              text: TextSpan(
                                  text:
                                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard",
                                  style: TextStyle(
                                      height: 1.3,
                                      fontSize: getProportionateScreenWidth(
                                          context, 13),
                                      color: Colors.black.withOpacity(0.5))),
                            ),
                            SizedBox(
                                height:
                                    getProportionateScreenWidth(context, 16)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                buildTextCustom(context, 'Chat to Whatsapp',
                                    fontSize: 12,
                                    weight: 'w500',
                                    color: Colors.black.withOpacity(0.7)),
                                buildTextCustom(
                                  context,
                                  '08937812892',
                                  fontSize: 12,
                                  color: kPrimaryColor,
                                )
                              ],
                            ),
                            SizedBox(
                                height:
                                    getProportionateScreenWidth(context, 10)),
                            buildElevatedButton(context, "Chat Sekarang",
                                onPressed: () => {launchInBrowser()},
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
