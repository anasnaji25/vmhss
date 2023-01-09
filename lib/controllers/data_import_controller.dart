import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class DataImportController extends GetxController {
  RxBool isLoading = false.obs;

  readExcel() async {
    FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
      allowMultiple: false,
    );

    isLoading(true);

    /// file might be picked

    if (pickedFile != null) {
      var bytes = pickedFile.files.single.bytes;
      var excel = Excel.decodeBytes(bytes!);
      for (var table in excel.tables.keys) {
        print(table); //sheet Name
        print(excel.tables[table]!.maxCols);
        print(excel.tables[table]!.maxRows);
        for (var row in excel.tables[table]!.rows) {
          print("$row");
        }
      }
    }

    isLoading(false);
    update();
  }
}
