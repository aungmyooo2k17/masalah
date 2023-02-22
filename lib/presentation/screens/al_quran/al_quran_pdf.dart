import 'package:flutter/material.dart';
import 'package:masalah/util/share_preference_util.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../common/constants/color_constant.dart';
import '../../reusable_widget/app_bar.dart';

class AlQuranPdf extends StatefulWidget {
  const AlQuranPdf({
    Key? key,
    required this.toPage,
  }) : super(key: key);

  final int toPage;

  @override
  State<AlQuranPdf> createState() => _AlQuranPdfState();
}

class _AlQuranPdfState extends State<AlQuranPdf> {
  PdfViewerController _pdfViewerController = PdfViewerController();

  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  bool isPageBookmark = false;
  int currentBookmarkPage = 0;
  ValueNotifier currentPage = ValueNotifier(0);

  @override
  void initState() {
    _pdfViewerController = PdfViewerController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SharedPreferenceUtil().getQuranPage().then((value) {
      currentBookmarkPage = value;
    });
    return Scaffold(
      appBar: AppTopBar(
        title: "Quran",
        enableBackBtn: true,
        textColor: AppColors.primaryText,
        moreActions: [
          IconButton(
            icon: Icon(
              Icons.bookmark_outline,
              color: AppColors.primaryText,
            ),
            onPressed: () async {
              _pdfViewerController
                  .jumpToPage(await SharedPreferenceUtil().getQuranPage());
            },
          ),
          ValueListenableBuilder(
            valueListenable: currentPage,
            builder: (context, value, child) {
              return IconButton(
                icon: Icon(
                  value == currentBookmarkPage && value != 0
                      ? Icons.favorite
                      : Icons.favorite_outline,
                  color: value == currentBookmarkPage && value != 0
                      ? Colors.red
                      : AppColors.primaryText,
                ),
                onPressed: () async {
                  currentBookmarkPage = await SharedPreferenceUtil()
                      .setQuranPage(_pdfViewerController.pageNumber);
                  setState(() {});
                  _pdfViewerController.jumpToPage(currentBookmarkPage);
                },
              );
            },
            child: Container(),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SfPdfViewer.asset(
          'assets/pdf/quran.pdf',
          pageLayoutMode: PdfPageLayoutMode.single,
          scrollDirection: PdfScrollDirection.horizontal,
          key: _pdfViewerKey,
          controller: _pdfViewerController,
          onPageChanged: (details) {
            currentPage.value = _pdfViewerController.pageNumber;
          },
          onDocumentLoaded: (details) {
            _pdfViewerController.jumpToPage(widget.toPage);
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    currentPage.dispose();
    _pdfViewerController.dispose();
    super.dispose();
  }
}
