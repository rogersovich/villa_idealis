// ignore_for_file: library_private_types_in_public_api

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:villa_idealis/src/core/models/villa_models.dart';

import '../../services/villa_service.dart';
import '../widgets/shimmer_detail_villa_widget.dart';
import '../widgets/villa_detail_widget.dart';
import '../widgets/villa_galleries_widget.dart';

class VillaPages extends StatefulWidget {
  final String id;

  const VillaPages({Key? key, required this.id}) : super(key: key);

  @override
  _VillaPagesState createState() => _VillaPagesState();
}

class _VillaPagesState extends State<VillaPages> {
  Dio dio = Dio();
  late Future<VillaResponse> _villaFuture;

  @override
  void initState() {
    super.initState();
    VillaService villaService = VillaService();
    _villaFuture = villaService.fetchVilla(widget.id);
  }

  Future<void> _handleRefresh() async {
    VillaService villaService = VillaService();
    setState(() {
      //todo Reassign the futures to trigger fetching data again
      _villaFuture = villaService.fetchVilla(widget.id);
    });
    //? You may want to wait for both futures to complete before completing the refresh
    await Future.wait([_villaFuture]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _handleRefresh,
          child: SingleChildScrollView(
            child: FutureBuilder<VillaResponse>(
                future: _villaFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return buildShimmerDetailVillaEffect(); // Loading state
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}'); // Error state
                  } else if (snapshot.hasData) {
                    VillaResponse villa = snapshot.data!;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        VillaGalleriesWidget(
                          galleries: villa.data!.galleries,
                        ),
                        VillaDetailWidget(
                          villa: villa,
                        )
                      ],
                    );
                  } else {
                    return const Text('Unknown error');
                  }
                }),
          ),
        ),
      ),
    );
  }
}
