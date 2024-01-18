// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../pages/ifControl/controller/if_remote_controller.dart';

class CardIfControl extends StatefulWidget {
  final String id;
  final String nome;
  final String? model;

  const CardIfControl(this.id, this.nome, this.model, {super.key});

  @override
  State<CardIfControl> createState() => _CardIfControlState();
}

class _CardIfControlState extends State<CardIfControl> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTapUp: (_) => Get.toNamed('/IfControl',
          arguments: [widget.id, widget.nome, widget.model]),
      child: Card(
        elevation: 0,
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
                        Icons.settings_remote_rounded,
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
                        child: IconButton(
                          icon: const Icon(
                            Icons.power_settings_new,
                            size: 35,
                          ),
                          onPressed: () {
                            WsRemoteController.remotecommand
                                .ifsendmessage(widget.id, 'projector', 'power');
                          },
                        ),
                      )
                      // Icon(
                      //   Icons.power_settings_new,
                      //   size: 35,
                      ) // )
                ],
              ),
            )),
      ),
    );
  }
}
