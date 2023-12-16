// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../core/constant/color_constant.dart';
import '../../core/models/characters_models.dart';
import '../../core/utils/text_util.dart';

class ExamplePages extends StatefulWidget {
  const ExamplePages({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ExamplePagesState createState() => _ExamplePagesState();
}

class _ExamplePagesState extends State<ExamplePages> {
  Dio dio = Dio();
  // late Future<CharactersReponse> charactersFuture;

  @override
  void initState() {
    super.initState();
  }

  Future<CharactersReponse> fetchData() async {
    try {
      final response =
          await dio.get('https://rickandmortyapi.com/api/character');

      if (response.statusCode == 200) {
        // Parse the JSON response using the CharactersReponse model
        return CharactersReponse.fromJson(response.data);
      } else {
        // If the API returns an error status code, throw an exception
        throw Exception(
            'Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      // Handle errors, including DioError for network-related issues
      throw Exception('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: buildTextCustom(context, 'Home',
            color: kBlackColor, fontSize: 16, weight: 'w600'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => {Navigator.pop(context)},
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<CharactersReponse>(
              future: fetchData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData ||
                    snapshot.data!.results.isEmpty) {
                  return const Center(child: Text('Is empty'));
                } else {
                  CharactersReponse charactersResponse = snapshot.data!;
                  return SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      itemCount: charactersResponse.results.length,
                      itemBuilder: (context, index) {
                        Result character = charactersResponse.results[index];
                        return ListTile(
                          title: Text('Name: ${character.name}'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Status: ${character.status}'),
                              Text('Type: ${character.type}'),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      )),
    );
  }
}
