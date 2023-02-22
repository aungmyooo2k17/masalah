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
        title: "Manzil",
        enableBackBtn: true,
        textColor: AppColors.primaryText,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SfPdfViewer.asset(
          'assets/pdf/manzil.pdf',
          pageLayoutMode: PdfPageLayoutMode.single,
          scrollDirection: PdfScrollDirection.horizontal,
          key: _pdfViewerKey,
          controller: _pdfViewerController,
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
