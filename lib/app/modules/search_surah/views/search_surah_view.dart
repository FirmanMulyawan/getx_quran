import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/search_surah_controller.dart';

class SearchSurahView extends GetView<SearchSurahController> {
  const SearchSurahView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SearchSurahView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SearchSurahView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
