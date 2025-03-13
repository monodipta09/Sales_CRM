import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../controller/search_bar_controller.dart';

class SearchPage extends StatelessWidget {
  // final List<FileItemNew> Function(String query, List<FileItemNew> items) onSearch;

  // const SearchPage({
  //   Key? key,
  //   required this.onSearch,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    // Initialize the controller
    // final SearchController controller = Get.put(SearchController());
    //
    //
    // void _performSearch(String query) {
    //   controller.performSearch(query, allItems);
    // }
    //
    // void _showCupertinoAlert(String message) {
    //   showCupertinoDialog(
    //     context: context,
    //     builder: (BuildContext context) => CupertinoAlertDialog(
    //       content: Text(message),
    //       actions: [
    //         CupertinoDialogAction(
    //           child: const Text('OK'),
    //           onPressed: () => Navigator.of(context).pop(),
    //         )
    //       ],
    //     ),
    //   );
    // }

    // void _onResultTap(FileItemNew item) {
    //   // If it's a folder, navigate to FolderScreenWidget
    //   if (item.isFolder) {
    //     Navigator.of(context).push(
    //       PageRouteBuilder(
    //         pageBuilder: (context, animation, secondaryAnimation) {
    //           return FolderScreenWidget(
    //             fileItems: item.children ?? [],
    //             folderName: item.name,
    //             colorScheme: Theme.of(context).colorScheme,
    //             folderId: item.identifier,
    //           );
    //         },
    //         transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //           const begin = Offset(1.0, 0.0);
    //           const end = Offset.zero;
    //           const curve = Curves.easeInOut;
    //           final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    //           final offsetAnimation = animation.drive(tween);
    //
    //           return SlideTransition(position: offsetAnimation, child: child);
    //         },
    //       ),
    //     );
    //   } else if (item.filePath != null) {
    //     final path = item.filePath!.toLowerCase();
    //     if (path.endsWith(".pdf")) {
    //       Navigator.push(
    //         context,
    //         CupertinoPageRoute(
    //           builder: (context) => PdfViewerPage(
    //             filePath: item.filePath!,
    //             fileName: item.name,
    //           ),
    //         ),
    //       );
    //     } else if (path.endsWith(".txt")) {
    //       Navigator.push(
    //         context,
    //         CupertinoPageRoute(
    //           builder: (context) => TextFileViewerPage(
    //             filePath: item.filePath!,
    //             fileName: item.name,
    //           ),
    //         ),
    //       );
    //     } else if (path.endsWith(".png") || path.endsWith(".jpg")) {
    //       Navigator.push(
    //         context,
    //         CupertinoPageRoute(
    //           builder: (context) => ImageViewerPage(
    //             imagePath: item.filePath!,
    //             fileName: item.name,
    //           ),
    //         ),
    //       );
    //     } else {
    //       _showCupertinoAlert("Unsupported file type");
    //     }
    //   } else {
    //     _showCupertinoAlert("No file path found");
    //   }
    // }

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Padding(
          padding: const EdgeInsets.only(right: 80.0),
          child: Container(
            child: CupertinoSearchTextField(
              controller: _controller,
              // onChanged: _performSearch,
              // onSubmitted: _performSearch,
              placeholder: 'Search all modules',
            ),
          ),
        ),
        trailing: CupertinoButton(
            padding: EdgeInsets.zero,
            child: Text("Cancel"),
            onPressed: () {
              // _controller.clear();
              Get.back();

            },
          ),
      ),
      child: SafeArea(
        child: Center(
          child: Text(
            'Type above to search...',
            style: TextStyle(fontSize: 16),
          ),
        ),
        // child: Obx(() {
        //   return _controller.searchResults.isEmpty
        //       ? const Center(
        //     child: Text(
        //       'Type above to search...',
        //       style: TextStyle(fontSize: 16),
        //     ),
        //   )
        //       : ListView.builder(
        //     itemCount: controller.searchResults.length,
        //     itemBuilder: (context, index) {
        //       final item = controller.searchResults[index];
        //       return CupertinoButton(
        //         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        //         onPressed: () => _onResultTap(item),
        //         child: Row(
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           children: [
        //             const Icon(CupertinoIcons.doc_text),
        //             const SizedBox(width: 12),
        //             Expanded(
        //               child: Text(
        //                 item.name,
        //                 style: const TextStyle(fontSize: 16),
        //               ),
        //             ),
        //           ],
        //         ),
        //       );
        //     },
        //   );
        // }),
      ),
    );
  }
}
