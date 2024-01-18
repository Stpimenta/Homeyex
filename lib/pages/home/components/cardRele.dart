// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../../repository/wsconnection.dart';
import 'package:get/get.dart';
import 'dart:async';

//model e controller
class ReleSwitchController extends GetxController {
  var stateswitch = false.obs;
  String data = 'timeout';
  //arrumar depois o sistema de reconexao e tirar essas recursividades.
  void onstateswitch(bool value, id) async {
    data;
    if (value) {
      data = await Ws.ws.sendMenssage(id, "o", "true");
      if (data.contains("0")) {
        stateswitch.value = true;
      }
    } else {
      data = await Ws.ws.sendMenssage(id, "f", "true");
      if (data.contains("1")) {
        stateswitch.value = false;
      }
    }
  }

  void initializeData(String id) async {
    data = await Ws.ws.sendMenssage(id, 's', 'true');
    stateswitch.value = data.contains('0');

    while (data == "timeout") {
      data = await Ws.ws.sendMenssage(id, 's', 'true');
      stateswitch.value = data.contains('0');
    }
  }
}

class CardRele extends StatefulWidget {
  final String id;
  final String nome;
  //final ReleSwitchController = Get.put(ReleSwitchController()); compartilha o estado
  final ReleSwitchController controller =
      ReleSwitchController(); //cria o estado para cada um

  CardRele(this.id, this.nome, {super.key});

  @override
  State<CardRele> createState() => _CardReleState();
}

class _CardReleState extends State<CardRele> {
  @override
  void initState() {
    super.initState();
    widget.controller.initializeData(widget.id);
    Timer.periodic(const Duration(seconds: 6), (timer) {
      widget.controller.initializeData(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      // shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(15),
      //     side: const BorderSide(color: Colors.black, width: 1)),
      child: SizedBox(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Expanded(
                  flex: 1,
                  child: Center(
                    child: Icon(
                      Icons.electrical_services,
                      size: 35,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Text(
                      widget.nome,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Center(
                        child: Obx(() => Switch(
                              value: widget.controller.stateswitch.value,
                              onChanged: (value) {
                                widget.controller
                                    .onstateswitch(value, widget.id);
                              },
                            ))))
              ],
            ),
          )),
    );
  }
}
