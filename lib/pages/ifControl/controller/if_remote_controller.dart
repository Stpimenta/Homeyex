import '../model/model.dart';
import '../../../repository/wsconnection.dart';

ModelControl datacontrol = ModelControl();

class WsRemoteController {
  String _modelo = '';
  // ignore: prefer_typing_uninitialized_variables, non_constant_identifier_names
  late var _control_comands;

  static final _instance = WsRemoteController();

  static WsRemoteController get remotecommand {
    return _instance;
  }

  ifsendmessage(id, model, comand) async {
    if (model == _modelo) {
      Ws.ws.sendMenssage(id, 'i,${_control_comands[comand]}', 'false');
    } else {
      _modelo = model;
      _control_comands = datacontrol.listcontrol(model);

      Ws.ws.sendMenssage(id, 'i,${_control_comands[comand]}', 'false');
    }
  }
}
