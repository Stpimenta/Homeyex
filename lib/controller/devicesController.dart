// ignore_for_file: file_names

import '../model/model.dart';

//lista do servidor // deve ir para o model gerenciar
List _devicesApi = [
  {
    'nome': 'Pc',
    'id': 'esp01_power_pc',
    'type': 'rele_pulse',
  },
  {
    'nome': 'Luz quarto',
    'id': 'esp01_luz_quarto_if',
    'type': 'rele',
  },
  {
    'nome': 'Luz banheiro',
    'id': 'esp01_luz_banheiro',
    'type': 'rele',
  },
  {
    'nome': 'Mini luz banheiro',
    'id': 'esp01_luz_banheiro_descanso',
    'type': 'rele',
  },
  {
    'nome': 'Projetor controle',
    'id': 'esp01_luz_quarto_if',
    'type': 'ifControl',
    'model': 'projector',
  },
  {
    'nome': 'Controle Haroku',
    'id': 'esp01_luz_quarto_if',
    'type': 'ifControl',
    'model': 'haroku',
  },
  {
    'nome': 'espace',
    'id': 'espace',
    'type': 'espace',
  },
];

class DevicesController {
  final List<Devices> _devicesList = [];

  //construtor privado classe singleton
  DevicesController._() {
    //faço uma lista de dispositivos vindo da minh api
    for (var position in _devicesApi) {
      Devices devices = Devices(
          position['nome'], position['id'], position['type'],
          model: position['model']);
      _devicesList.add(devices);
    }
  }

  //instancia de acesso
  static final DevicesController _instance = DevicesController._();

  //metodo publico
  static DevicesController get instance {
    return _instance;
  }

  // //getters
  // // Getter para o tipo de dispositivo
  // String deviceType(int index) {
  //   return _devicesList[index].type;
  // }

  // // Setter para o tipo de dispositivo
  // void setDeviceType(int index, String typeDevice) {
  //   _devicesList[index].type = typeDevice;
  // }

  //retorno a lista
  List<Devices> get devlist {
    return _devicesList;
  }
}
