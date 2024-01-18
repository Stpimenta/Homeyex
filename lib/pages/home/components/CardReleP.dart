// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../home/myIconsHome.dart';
import '../../../repository/wsconnection.dart';

class CardRelePulse extends StatefulWidget {
  final String id;
  final String nome;
  const CardRelePulse(this.id, this.nome, {super.key});

  @override
  State<CardRelePulse> createState() => _CardReleStatePulse();
}

class _CardReleStatePulse extends State<CardRelePulse> {
  bool switched = false;
  @override
  Widget build(BuildContext context) {
    return Card(
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
                      myIconsHome.pulse,
                      size: 35,
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
                          Icons.near_me,
                          size: 35,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Ws.ws.sendMenssage(widget.id, "p,1000", "true");
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
    );
  }
}
