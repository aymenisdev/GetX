import 'dart:async';
import 'user.dart';
import 'package:flutter/material.dart';

class UserBlock {
  final List<User> _userList = [
    User(
        1,
        'aymen',
        'https://imgs.search.brave.com/LLCvzB2Q64IPjfejHupazEKsRTqOaU41R1jTV_G1z-Q/rs:fit:708:225:1/g:ce/aHR0cHM6Ly90c2U0/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC5U/SnhwdDhSbkdUazIz/c09kdmQxbUZnSGFF/OSZwaWQ9QXBp',
        3000.00),
    User(
        2,
        'Rimaz',
        'https://imgs.search.brave.com/58Zw5rV0ku4_boGMCBgtYbOkJeECi5_ZKloAvEBdrU4/rs:fit:474:225:1/g:ce/aHR0cHM6Ly90c2Uy/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC5q/cnl1VWdJSFdMLTFG/VkQyd3c4b1dnSGFI/YSZwaWQ9QXBp',
        2600.00),
    User(
        3,
        'Ramy',
        'https://imgs.search.brave.com/bCLLW1OkaqrjGqHh64YsfNgnBRJScB35PDnr_V_hr9c/rs:fit:713:225:1/g:ce/aHR0cHM6Ly90c2U0/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC5Y/U1pBRm0tNUpJN25y/aURMd1pxUlFRSGFF/NyZwaWQ9QXBp',
        2200.00),
    User(
        4,
        'Rania',
        'https://imgs.search.brave.com/SVaNMbZJs6FPIV69vagzklW1Ne_URfwzOZPJaJuz4cw/rs:fit:355:225:1/g:ce/aHR0cHM6Ly90c2U0/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC5E/Qm5LX2s0QnpuaDUt/SVlpcmRONGdBSGFK/NCZwaWQ9QXBp',
        1800.00)
  ];

// 1- Stream Controllers
  final _userListStreamController = StreamController<List<User>>();
  final _userSalaryIncStreamController = StreamController<User>();
  final _userSalaryDecStreamController = StreamController<User>();

//  2- Sream and sink
  Stream<List<User>> get UserListStream => _userListStreamController.stream;
  StreamSink<List<User>> get UserListSink => _userListStreamController.sink;
  StreamSink<User> get UserSalaryInc => _userSalaryIncStreamController.sink;
  StreamSink<User> get UserSalaryDec => _userSalaryDecStreamController.sink;

  // 3- constracter => add data and listen to changes
  UserBlock() {
    _userListStreamController.add(_userList);
    _userSalaryIncStreamController.stream.listen(_incSalary);
    _userSalaryDecStreamController.stream.listen(_decSalary);
  }

// 4- core Functions
  _incSalary(User user) {
    _userList[user.id - 1].salary = user.salary + 100;
    UserListSink.add(_userList);
  }

  _decSalary(User user) {
    _userList[user.id - 1].salary = user.salary - 100;
    UserListSink.add(_userList);
  }

// 5- close bloc
  void dispose() {
    _userListStreamController.close();
    _userSalaryIncStreamController.close();
    _userSalaryDecStreamController.close();
  }
}
