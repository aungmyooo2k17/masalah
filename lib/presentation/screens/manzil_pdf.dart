import 'dart:io';

import 'package:download_assets/download_assets.dart';
import 'package:flutter/material.dart';
import 'package:masalah/util/share_preference_util.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../common/constants/color_constant.dart';
import '../reusable_widget/app_bar.dart';

class ManzilPdf extends StatefulWidget {
  const ManzilPdf({
    Key? key,
  }) : super(key: key);

  @override
  State<ManzilPdf> createState() => _ManzilPdfState();
}

class _ManzilPdfState extends State<ManzilPdf> {
  DownloadAssetsController downloadAssetsController =
      DownloadAssetsController();
  String message = 'Press the download button to start the download';
  bool downloaded = false;

  PdfViewerController _pdfViewerController = PdfViewerController();

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
        title: "Manzil",
        enableBackBtn: true,
        textColor: AppColors.primaryText,
      ),
      body: downloaded
          ? Container(
              height: MediaQuery.of(context).size.height,
              child: SfPdfViewer.file(
                File('${downloadAssetsController.assetsDir}/manzil.pdf'),
                pageLayoutMode: PdfPageLayoutMode.single,
                scrollDirection: PdfScrollDirection.horizontal,
                key: _pdfViewerKey,
                controller: _pdfViewerController,
              ),
            )
          : Center(
              child: Text(
                message,
              ),
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
        await downloadAssetsController.assetsDirAlreadyExists();

    if (assetsDownloaded) {
      setState(() {
        message = 'Click in refresh button to force download';
        print(message);
      });
      return;
    }

    try {
      await downloadAssetsController.startDownload(
        assetsUrl: 'https://aungmyooo2k17.github.io/assets/manzil.pdf.zip',
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
