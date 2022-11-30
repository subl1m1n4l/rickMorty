// ignore_for_file: non_constant_identifier_names, unnecessary_new, unnecessary_null_comparison

import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/models/Rick_Morty.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

// ignore: use_key_in_widget_constructors
class ContadorPage extends StatefulWidget {
  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() {
    return _ContadorPageState();
  }
}

class _ContadorPageState extends State<ContadorPage> {
  // ignore: prefer_const_constructors,  unused_field
  final _estiloTexto = new TextStyle(fontSize: 25);
  // ignore: unused_field, prefer_final_fields
  int _conteo = 10;

  Rick_Morty rick_morty = new Rick_Morty();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            // ignore: prefer_const_constructors
            title: Text('Titulo'),
            centerTitle: true,
            elevation: 1.13,
            titleTextStyle: const TextStyle(fontSize: 16, fontFamily: ''),
            actions: <Widget>[_crearBotonres(context)],
            // ignore: prefer_const_constructors
            flexibleSpace: FlexibleSpaceBar(stretchModes: const <StretchMode>[
              StretchMode.zoomBackground,
              StretchMode.blurBackground,
              StretchMode.fadeTitle
            ])),
        // ignore: prefer_const_constructors
        body: Center(
            child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          reverse: false,
          dragStartBehavior: DragStartBehavior.start,
          // ignore: sort_child_properties_last
          children: RetornAImagenes(),
        )));
  }

  List<Widget> RetornAImagenes() {
    // ignore: deprecated_member_use, prefer_collection_literals
    List<Widget> data = <Widget>[];
    if (rick_morty.results == null) {
      // ignore: prefer_const_constructors
      data.add(Text(
        'Presione el boton mas para traer los Usuarios',
        // ignore: prefer_const_constructors
        style: TextStyle(fontSize: 25, fontFamily: 'Arial', color: Colors.blue),
      ));
      return data;
    } else {
      rick_morty.results?.forEach((element) {
        //data.add(Image.network(element.image.toString()));
        data.add(IconButton(
          icon: Image.network(element.image.toString()),
          iconSize: 50,
          onPressed: () {
            // ignore: avoid_print
            print(element.name.toString());
          },
        ));

        data.add(Text(
          element.name.toString(),
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 26.0, fontFamily: 'Arial'),
        ));
      });

      return data;
    }
  }

  int cantidadDatos(value) {
    if (value == null) {
      return 1;
    } else {
      return value;
    }
  }

  // ignore: unused_element
  Widget _crearBotonres(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(
            onPressed: (() async {
              var result = await ConsultarRickAndMorty();
              if (result.isNotEmpty) {
                setState(() {
                  // ignore: avoid_print

                  Map<String, dynamic> userMap = jsonDecode(result);
                  rick_morty = Rick_Morty.fromJson(userMap);
                });
              }
            }),
            // ignore: prefer_const_constructors
            child: Icon(Icons.add)),
        // ignore: prefer_const_constructors
        SizedBox(
          width: 5.0,
        ),
        FloatingActionButton(
            onPressed: (() async {
              // ignore: unused_local_variable
              String? url = rick_morty.info?.prev.toString();
              if (url != null) {
                if (url.isNotEmpty) {
                  var result = await ConsultarRickAndMortyNext(url);
                  setState(() {
                    Map<String, dynamic> userMap = jsonDecode(result);
                    rick_morty = Rick_Morty.fromJson(userMap);
                  });
                }
              }
            }),
            // ignore: prefer_const_constructors
            child: Icon(Icons.arrow_circle_left_outlined)),
        // ignore: prefer_const_constructors
        SizedBox(
          width: 5.0,
        ),
        FloatingActionButton(
            onPressed: (() async {
              // ignore: unused_local_variable
              String? url = rick_morty.info?.next.toString();
              if (url != null) {
                if (url != "") {
                  var result = await ConsultarRickAndMortyNext(url);
                  setState(() {
                    if (result.isNotEmpty) {
                      Map<String, dynamic> userMap = jsonDecode(result);
                      rick_morty = Rick_Morty.fromJson(userMap);
                    }
                  });
                }
              }
            }),
            // ignore: prefer_const_constructors
            child: Icon(Icons.arrow_circle_right_outlined)),
        // ignore: prefer_const_constructors
        SizedBox(
          width: 5.0,
        ),
        FloatingActionButton(
            onPressed: (() {
              setState(() {
                rick_morty = new Rick_Morty();
              });
            }),
            // ignore: prefer_const_constructors
            child: Icon(Icons.account_box_outlined)),
        // ignore: prefer_const_constructors
        SizedBox(
          width: 5.0,
        ),
      ],
    );
  }

  Future<String> ConsultarRickAndMortyNext(String ulr) async {
    var client = http.Client();
    try {
      var resultUrl = Uri.parse(ulr);
      var response = await client.get(resultUrl);
      if (response.statusCode == 200) {
        return response.body.toString();
      }
    } catch (e) {
      client.close();
    }

    return "";
  }

  Future<String> ConsultarRickAndMorty() async {
    var client = http.Client();
    try {
      // ignore: unused_local_variable
      String baseUrl = "rickandmortyapi.com";
      // ignore: unused_local_variable
      String characters = "api/character";
      // ignore: unused_local_variable
      String episodes = "api/episode";
      // ignore: unused_local_variable
      String locations = "api/location";

      var url = Uri.https(baseUrl, characters);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return response.body.toString();
      }
    } catch (e) {
      client.close();
    }

    return "";
  }
}
