import 'package:chat_app/src/models/mensajes_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:chat_app/src/global/environment.dart';
import 'package:chat_app/src/services/auth_service.dart';
import 'package:chat_app/src/models/usuario.dart';

class ChatService with ChangeNotifier {
  Usuario? usuarioPara;

  Future<List<Mensaje>> getChat(String usuarioID) async {
    final resp = await http
        .get(Uri.parse('${Environment.apiUrl}/mensajes/$usuarioID'), headers: {
      'Content-Type': 'application/json',
      'x-token': await AuthService.getToken(),
    });
    final mensajesResp = mensajesResponseFromJson(resp.body);

    return mensajesResp.mensajes;
  }
}
