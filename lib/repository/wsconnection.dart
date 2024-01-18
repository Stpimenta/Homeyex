import 'dart:async';
import 'package:web_socket_channel/io.dart';

// void main() async {
//   List devices = [
//     {
//       'nome': 'espcasa',
//     }
//   ];

//   print(devices[0]['nome']);
// }

class Ws {
  final String _url = 'ws://18.231.164.109:4000';
  late IOWebSocketChannel _channel;

  //singleton
  Ws._();
  static final Ws _ws = Ws._();
  static Ws get ws {
    return _ws;
  }

  //gegerencia o retorno
  Future? _getMenssage(String user) {
    var promisse = Completer<String>();
    _channel.stream.listen((event) {
      if (event.contains('resposta de $user')) {
        List<String> tratemento = event.split(':');
        promisse.complete(tratemento[1]);
        _channel.sink.close();
      }

      if (event.contains('verifique a conexão')) {
        promisse.complete("Erro");
      }
    });
    return promisse.future
        .timeout(const Duration(seconds: 6), onTimeout: () => "timeout");
  }

  // envia  a mensagem
  Future sendMenssage(String device, String message, String response) async {
    _channel = IOWebSocketChannel.connect(
      Uri.parse(_url),
    );
    String json =
        '{"category": "$device", "metod":"publish","menssage":"$message", "response":"$response"}';

    _channel.sink.add(json);

    if (response == 'true') {
      return await (_getMenssage(device));
    }
  }
}
