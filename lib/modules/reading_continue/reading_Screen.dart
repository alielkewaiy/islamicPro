import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

import '../../shared/network/local/cache_helper.dart';

class ReadingScreen extends StatefulWidget {
  int defautPage = 0;

  ReadingScreen(this.defautPage);

  @override
  State<ReadingScreen> createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  @override
  void initState() {
    super.initState();
//Portrait mode only
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  dispose() {
//on dispose allow full orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  Completer<PDFViewController> _pdfViewController =
      Completer<PDFViewController>();

  StreamController<String> _pageCountController = StreamController<String>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PDF(
        fitPolicy: FitPolicy.WIDTH,
        defaultPage: widget.defautPage,
        autoSpacing: false,
        pageFling: false,
        pageSnap: false,
        fitEachPage: false,
        onPageChanged: (int? current, int? total) {
          CacheHelper.saveData(key: 'pageNumber', value: current);
        },
        onViewCreated: (PDFViewController pdfViewController) async {
          _pdfViewController.complete(pdfViewController);
          int currentPage = await pdfViewController.getCurrentPage() ?? 0;
          int? pageCount = await pdfViewController.getPageCount();
          _pageCountController.add('${currentPage + 1} - $pageCount');
        },
      ).fromAsset('assets/pdf/quran.pdf'),
    );
  }

  Widget bottomSheetBuildItem() => Container(
        width: double.infinity,
        height: 200,
        color: Colors.black38,
      );
}
