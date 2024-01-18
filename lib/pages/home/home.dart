import 'package:flutter/material.dart';
//cards
import './components/CardReleP.dart';
import 'components/cardRele.dart';
import './components/cardIfControl.dart';
//controllers
import '../../controller/devicesController.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});
  @override
  State<MyHome> createState() => _MyHome();
}

class _MyHome extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 85,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              ">>>",
              style: TextStyle(
                color: Color.fromRGBO(212, 205, 166, 1),
              ),
            ),
            Image.asset(
              "assets/images/logo.png",
              width: 50,
            ),
            const Icon(
              Icons.notifications,
              size: 35,
              color: Color.fromRGBO(212, 205, 166, 1),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsetsDirectional.only(bottom: 10),
              height: 35,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(
                          width: 1,
                          color: Color.fromRGBO(212, 205, 166, 1),
                        )),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 9.0, vertical: 3),
                      child: Text("Todos",
                          style: TextStyle(
                            color: Color.fromRGBO(212, 205, 166, 1),
                          )),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: DevicesController.instance.devlist.length,
                itemBuilder: (BuildContext context, int index) {
                  switch (DevicesController.instance.devlist[index].type) {
                    case 'rele':
                      return CardRele(
                          DevicesController.instance.devlist[index].id,
                          DevicesController.instance.devlist[index].nome);
                    case 'rele_pulse':
                      return CardRelePulse(
                          DevicesController.instance.devlist[index].id,
                          DevicesController.instance.devlist[index].nome);
                    case 'ifControl':
                      return CardIfControl(
                        DevicesController.instance.devlist[index].id,
                        DevicesController.instance.devlist[index].nome,
                        DevicesController.instance.devlist[index].model,
                      );

                    case 'espace':
                      return Container(
                        height: 50,
                      );
                    default:
                      return (const Text("desconhecido"));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
