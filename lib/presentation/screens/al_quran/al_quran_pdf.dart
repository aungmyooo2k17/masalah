import 'dart:io';

import 'package:download_assets/download_assets.dart';
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
  DownloadAssetsController downloadAssetsController =
      DownloadAssetsController();
  String message = 'Press the download button to start the download';
  bool downloaded = false;
  PdfViewerController _pdfViewerController = PdfViewerController();

  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  bool isPageBookmark = false;
  int currentBookmarkPage = 0;
  ValueNotifier currentPage = ValueNotifier(0);

  @override
  void initState() {
    _pdfViewerController = PdfViewerController();
    super.initState();
    _init();
  }

  Future _init() async {
    await downloadAssetsController.init();
    downloaded = await downloadAssetsController.assetsDirAlreadyExists();
    _downloadAssets();
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
      body: downloaded
          ? Container(
              height: MediaQuery.of(context).size.height,
              child: SfPdfViewer.file(
                File('${downloadAssetsController.assetsDir}/quran.pdf'),
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
            )
          : Center(
              child: Text(message),
            ),
    );
  }

  @override
  void dispose() {
    currentPage.dispose();
    _pdfViewerController.dispose();
    super.dispose();
  }

  Future _refresh() async {
    await downloadAssetsController.clearAssets();
    await _downloadAssets();
  }

  Future _downloadAssets() async {
    final assetsDownloaded =
        await downloadAssetsController.assetsFileExists("quran.pdf");

    if (assetsDownloaded) {
      setState(() {
        message = 'Click in refresh button to force download';
        print(message);
      });
      return;
    }

    try {
      await downloadAssetsController.startDownload(
        assetsUrl: 'https://aungmyooo2k17.github.io/assets/quran.pdf.zip',
        onProgress: (progressValue) {
          downloaded = false;
          setState(() {
            if (progressValue < 100) {
              message = 'Downloading - ${progressValue.toStringAsFixed(2)}';
              // print(message);
            } else {
              message =
                  'Download completed\nClick in refresh button to force download';
              // print(message);
              downloaded = true;
            }
          });
        },
      );
    } on DownloadAssetsException catch (e) {
      print(e.toString());
      setState(() {
        downloaded = false;
        message = 'Error: ${e.toString()}';
      });
    }
  }
}
