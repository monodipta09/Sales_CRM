// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
//
// class SearchController extends GetxController {
//   var searchResults = <FileItemNew>[].obs;
//   var query = ''.obs;
//   final TextEditingController searchController = TextEditingController();
//
//   @override
//   void onInit() {
//     super.onInit();
//     searchController.addListener(_onQueryChanged);
//   }
//
//   @override
//   void onClose() {
//     searchController.removeListener(_onQueryChanged);
//     searchController.dispose();
//     super.onClose();
//   }
//
//   void _onQueryChanged() {
//     query.value = searchController.text;
//   }
//
//   void performSearch(String query, List<FileItemNew> items) {
//     final results = onSearch(query, items); // You can pass this function from the UI
//     searchResults.value = results;
//   }
// }
