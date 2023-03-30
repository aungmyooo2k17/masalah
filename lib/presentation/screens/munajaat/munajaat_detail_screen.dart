import 'dart:io';

import 'package:download_assets/download_assets.dart';
import 'package:flutter/material.dart';
import 'package:masalah/util/share_preference_util.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../common/constants/color_constant.dart';
import '../../reusable_widget/app_bar.dart';

class MunajaatDetailPdf extends StatefulWidget {
  const MunajaatDetailPdf({
    Key? key,
    required this.toPage,
  }) : super(key: key);

  final int toPage;

  @override
  State<MunajaatDetailPdf> createState() => _MunajaatDetailPdfState();
}

class _MunajaatDetailPdfState extends State<MunajaatDetailPdf> {
  PdfViewerController _pdfViewerController = PdfViewerController();
  DownloadAssetsController downloadAssetsController =
      DownloadAssetsController();
  String message = 'Press the download button to start the download';
  bool downloaded = false;

  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

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
    return Scaffold(
      appBar: AppTopBar(
        title: "Munajaat",
        enableBackBtn: true,
        textColor: AppColors.primaryText,
        moreActions: [],
      ),
      body: downloaded
          ? Container(
              height: MediaQuery.of(context).size.height,
              child: SfPdfViewer.file(
                File('${downloadAssetsController.assetsDir}/munajaat.pdf'),
                pageLayoutMode: PdfPageLayoutMode.single,
                scrollDirection: PdfScrollDirection.horizontal,
                key: _pdfViewerKey,
                controller: _pdfViewerController,
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
    _pdfViewerController.dispose();
    super.dispose();
  }

  Future _refresh() async {
    await downloadAssetsController.clearAssets();
    await _downloadAssets();
  }

  Future _downloadAssets() async {
    final assetsDownloaded =
        await downloadAssetsController.assetsFileExists("munajaat.pdf");

    if (await File('${downloadAssetsController.assetsDir}/munajaat.pdf').exists()) {
      setState(() {
        message = 'Click in refresh button to force download';
        print(message);
      });
      return;
    }

    try {
      await downloadAssetsController.startDownload(
        assetsUrl: 'https://aungmyooo2k17.github.io/assets/munajaat.pdf.zip',
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
