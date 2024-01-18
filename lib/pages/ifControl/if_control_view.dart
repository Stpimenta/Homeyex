import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeyex/pages/ifControl/controller/if_remote_controller.dart';

class IfControlView extends StatelessWidget {
  IfControlView({super.key});
  final String model = Get.arguments[2];
  final String nome = Get.arguments[1];
  final String id = Get.arguments[0];
  @override
  Widget build(BuildContext context) {
    if (model == 'projector') {
      return ProjectorControl(
        type: model,
        nome: nome,
        id: id,
      );
    }
    if (model == 'haroku') {
      return HarokuControl(
        type: model,
        nome: nome,
        id: id,
      );
    }

    return const Text('desconhecido');
  }
}

//controle do projetor
class ProjectorControl extends StatefulWidget {
  final String type;
  final String nome;
  final String id;
  const ProjectorControl(
      {super.key, required this.type, required this.nome, required this.id});
  @override
  State<ProjectorControl> createState() => _ProjectorControlViewState();
}

class _ProjectorControlViewState extends State<ProjectorControl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.nome),
            const Icon(
              Icons.edit_square,
              size: 30,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      WsRemoteController.remotecommand
                          .ifsendmessage(widget.id, widget.type, 'power');
                    },
                    icon: const Icon(
                      Icons.power_settings_new,
                      size: 40,
                    )),
                IconButton(
                    onPressed: () {
                      WsRemoteController.remotecommand
                          .ifsendmessage(widget.id, widget.type, 'volup');
                    },
                    icon: const Icon(
                      Icons.volume_up,
                      size: 40,
                    )),
                IconButton(
                    onPressed: () {
                      WsRemoteController.remotecommand
                          .ifsendmessage(widget.id, widget.type, 'voldow');
                    },
                    icon: const Icon(
                      Icons.volume_down,
                      size: 40,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      WsRemoteController.remotecommand
                          .ifsendmessage(widget.id, widget.type, 'up');
                    },
                    icon: const Icon(
                      Icons.expand_less,
                      size: 50,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      WsRemoteController.remotecommand
                          .ifsendmessage(widget.id, widget.type, 'left');
                    },
                    icon: const Icon(
                      Icons.chevron_left,
                      size: 50,
                    )),
                IconButton(
                    onPressed: () {
                      WsRemoteController.remotecommand
                          .ifsendmessage(widget.id, widget.type, 'enter');
                    },
                    icon: const Icon(
                      Icons.adjust,
                      size: 40,
                    )),
                IconButton(
                    onPressed: () {
                      WsRemoteController.remotecommand
                          .ifsendmessage(widget.id, widget.type, 'rigth');
                    },
                    icon: const Icon(
                      Icons.navigate_next,
                      size: 50,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      WsRemoteController.remotecommand
                          .ifsendmessage(widget.id, widget.type, 'dow');
                    },
                    icon: const Icon(
                      Icons.expand_more,
                      size: 50,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      WsRemoteController.remotecommand
                          .ifsendmessage(widget.id, widget.type, 'return');
                    },
                    icon: const Icon(
                      Icons.replay,
                      size: 40,
                    )),
                IconButton(
                    onPressed: () {
                      WsRemoteController.remotecommand
                          .ifsendmessage(widget.id, widget.type, 'menu');
                    },
                    icon: const Icon(
                      Icons.list,
                      size: 40,
                    )),
                IconButton(
                    onPressed: () {
                      WsRemoteController.remotecommand
                          .ifsendmessage(widget.id, widget.type, 'mute');
                    },
                    icon: const Icon(
                      Icons.volume_off,
                      size: 40,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          WsRemoteController.remotecommand
                              .ifsendmessage(widget.id, widget.type, 'hdmi1');
                        },
                        icon: const Icon(
                          Icons.settings_input_hdmi,
                          size: 40,
                        )),
                    const Text('hdmi 1'),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          WsRemoteController.remotecommand
                              .ifsendmessage(widget.id, widget.type, 'hdmi2');
                        },
                        icon: const Icon(
                          Icons.settings_input_hdmi,
                          size: 40,
                        )),
                    const Text('hdmi 2'),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          WsRemoteController.remotecommand
                              .ifsendmessage(widget.id, widget.type, 'hdmi3');
                        },
                        icon: const Icon(
                          Icons.settings_input_hdmi,
                          size: 40,
                        )),
                    const Text('hdmi 3'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HarokuControl extends StatefulWidget {
  final String type;
  final String nome;
  final String id;
  const HarokuControl(
      {super.key, required this.type, required this.nome, required this.id});
  @override
  State<HarokuControl> createState() => _HarokuControlViewState();
}

class _HarokuControlViewState extends State<HarokuControl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.nome),
            const Icon(
              Icons.edit_square,
              size: 30,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      WsRemoteController.remotecommand
                          .ifsendmessage(widget.id, widget.type, 'back');
                    },
                    icon: const Icon(
                      Icons.keyboard_backspace,
                      size: 45,
                    )),
                IconButton(
                    onPressed: () {
                      WsRemoteController.remotecommand
                          .ifsendmessage(widget.id, widget.type, 'home');
                    },
                    icon: const Icon(
                      Icons.home,
                      size: 45,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      WsRemoteController.remotecommand
                          .ifsendmessage(widget.id, widget.type, 'up');
                    },
                    icon: const Icon(
                      Icons.expand_less,
                      size: 50,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      WsRemoteController.remotecommand
                          .ifsendmessage(widget.id, widget.type, 'left');
                    },
                    icon: const Icon(
                      Icons.chevron_left,
                      size: 50,
                    )),
                IconButton(
                    onPressed: () {
                      WsRemoteController.remotecommand
                          .ifsendmessage(widget.id, widget.type, 'enter');
                    },
                    icon: const Icon(
                      Icons.adjust,
                      size: 40,
                    )),
                IconButton(
                    onPressed: () {
                      WsRemoteController.remotecommand
                          .ifsendmessage(widget.id, widget.type, 'rigth');
                    },
                    icon: const Icon(
                      Icons.navigate_next,
                      size: 50,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      WsRemoteController.remotecommand
                          .ifsendmessage(widget.id, widget.type, 'dow');
                    },
                    icon: const Icon(
                      Icons.expand_more,
                      size: 50,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      WsRemoteController.remotecommand
                          .ifsendmessage(widget.id, widget.type, 'return');
                    },
                    icon: const Icon(
                      Icons.replay,
                      size: 40,
                    )),
                IconButton(
                    onPressed: () {
                      WsRemoteController.remotecommand
                          .ifsendmessage(widget.id, widget.type, 'asterisk');
                    },
                    icon: const Icon(
                      Icons.emergency,
                      size: 40,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      WsRemoteController.remotecommand.ifsendmessage(
                          widget.id, widget.type, 'advancedleft');
                    },
                    icon: const Icon(
                      Icons.fast_rewind,
                      size: 40,
                    )),
                IconButton(
                    onPressed: () {
                      WsRemoteController.remotecommand
                          .ifsendmessage(widget.id, widget.type, 'play');
                    },
                    icon: const Icon(
                      Icons.play_arrow,
                      size: 40,
                    )),
                IconButton(
                    onPressed: () {
                      WsRemoteController.remotecommand.ifsendmessage(
                          widget.id, widget.type, 'advancedrigth');
                    },
                    icon: const Icon(
                      Icons.fast_forward,
                      size: 40,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
