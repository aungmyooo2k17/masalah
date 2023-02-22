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

  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  void initState() {
    _pdfViewerController = PdfViewerController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar(
        title: "Quran",
        enableBackBtn: true,
        textColor: AppColors.primaryText,
        moreActions: [],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SfPdfViewer.asset(
          'assets/pdf/munajaat.pdf',
          pageLayoutMode: PdfPageLayoutMode.single,
          scrollDirection: PdfScrollDirection.horizontal,
          key: _pdfViewerKey,
          controller: _pdfViewerController,
          onDocumentLoaded: (details) {
            _pdfViewerController.jumpToPage(widget.toPage);
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pdfViewerController.dispose();
    super.dispose();
  }
}
