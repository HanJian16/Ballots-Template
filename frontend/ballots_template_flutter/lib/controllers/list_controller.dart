import 'package:ballots_template_flutter/utils/homescreen_datalist.dart';
import 'package:get/get.dart';

class ListController extends GetxController {
  //* Lista de datos con estado de selección
  var listTileData = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    //* Inicializar los datos
    listTileData.value = getListTileData();
  }

  //* Actualizar el estado de selección
  void toggleSelection(int index, bool? value) {
    if (index >= 0 && index < listTileData.length) {
      listTileData[index]['selected'] = value;
      listTileData.refresh(); // Actualizar la lista
    }
  }

  //* Obtener solo los elementos seleccionados
  List<Map<String, dynamic>> getSelectedItems() {
    return listTileData.where((item) => item['selected'] == true).toList();
  }

  void updateSelection(int index, bool? value) {
    //* Verifica que el índice sea válido
    if (index >= 0 && index < listTileData.length) {
      //* Actualiza el ítem en la lista
      listTileData[index]['selected'] = value;
      //* Notifica a los observadores de la actualización
      update();
    }
  }
}
