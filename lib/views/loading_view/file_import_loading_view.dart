import 'package:flutter/material.dart';


class FileImportLoadingView extends StatefulWidget {
  const FileImportLoadingView({super.key});

  @override
  State<FileImportLoadingView> createState() => _FileImportLoadingViewState();
}

class _FileImportLoadingViewState extends State<FileImportLoadingView> {


  test(){

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: (){
          return test();
        },
        child: Center(
          child: Image.asset('assets/icons/119376-document-processing.gif'),
        ),
      ),
    );
  }
}