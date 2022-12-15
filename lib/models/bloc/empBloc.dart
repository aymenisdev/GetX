import 'dart:async';
import 'emp.dart';
import 'package:flutter/material.dart';

class EmpBlock {
  final List<Emp> _empList = [
    Emp(
        1,
        'aymen',
        'https://imgs.search.brave.com/LLCvzB2Q64IPjfejHupazEKsRTqOaU41R1jTV_G1z-Q/rs:fit:708:225:1/g:ce/aHR0cHM6Ly90c2U0/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC5U/SnhwdDhSbkdUazIz/c09kdmQxbUZnSGFF/OSZwaWQ9QXBp',
        3000.00),
    Emp(
        2,
        'Rimaz',
        'https://imgs.search.brave.com/58Zw5rV0ku4_boGMCBgtYbOkJeECi5_ZKloAvEBdrU4/rs:fit:474:225:1/g:ce/aHR0cHM6Ly90c2Uy/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC5q/cnl1VWdJSFdMLTFG/VkQyd3c4b1dnSGFI/YSZwaWQ9QXBp',
        2600.00),
    Emp(
        3,
        'Ramy',
        'https://imgs.search.brave.com/bCLLW1OkaqrjGqHh64YsfNgnBRJScB35PDnr_V_hr9c/rs:fit:713:225:1/g:ce/aHR0cHM6Ly90c2U0/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC5Y/U1pBRm0tNUpJN25y/aURMd1pxUlFRSGFF/NyZwaWQ9QXBp',
        2200.00),
    Emp(
        4,
        'Rania',
        'https://imgs.search.brave.com/SVaNMbZJs6FPIV69vagzklW1Ne_URfwzOZPJaJuz4cw/rs:fit:355:225:1/g:ce/aHR0cHM6Ly90c2U0/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC5E/Qm5LX2s0QnpuaDUt/SVlpcmRONGdBSGFK/NCZwaWQ9QXBp',
        1800.00)
  ];

  final List<Emp> _empList2 = [
    Emp(
        4,
        'Rania',
        'https://imgs.search.brave.com/SVaNMbZJs6FPIV69vagzklW1Ne_URfwzOZPJaJuz4cw/rs:fit:355:225:1/g:ce/aHR0cHM6Ly90c2U0/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC5E/Qm5LX2s0QnpuaDUt/SVlpcmRONGdBSGFK/NCZwaWQ9QXBp',
        1800.00),
    Emp(
        3,
        'Ramy',
        'https://imgs.search.brave.com/bCLLW1OkaqrjGqHh64YsfNgnBRJScB35PDnr_V_hr9c/rs:fit:713:225:1/g:ce/aHR0cHM6Ly90c2U0/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC5Y/U1pBRm0tNUpJN25y/aURMd1pxUlFRSGFF/NyZwaWQ9QXBp',
        2200.00),
    Emp(
        2,
        'Rimaz',
        'https://imgs.search.brave.com/58Zw5rV0ku4_boGMCBgtYbOkJeECi5_ZKloAvEBdrU4/rs:fit:474:225:1/g:ce/aHR0cHM6Ly90c2Uy/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC5q/cnl1VWdJSFdMLTFG/VkQyd3c4b1dnSGFI/YSZwaWQ9QXBp',
        2600.00),
    Emp(
        1,
        'aymen',
        'https://imgs.search.brave.com/LLCvzB2Q64IPjfejHupazEKsRTqOaU41R1jTV_G1z-Q/rs:fit:708:225:1/g:ce/aHR0cHM6Ly90c2U0/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC5U/SnhwdDhSbkdUazIz/c09kdmQxbUZnSGFF/OSZwaWQ9QXBp',
        3000.00)
  ];

// 1- Stream Controllers
  final _empListStreamController = StreamController<List<Emp>>();
  final _empSalaryIncStreamController = StreamController<Emp>();
  final _empSalaryDecStreamController = StreamController<Emp>();
  final _empSalarySortStreamController = StreamController<Emp>();

//  2- Sream and sink
  Stream<List<Emp>> get empListStream => _empListStreamController.stream;
  StreamSink<List<Emp>> get empListSink => _empListStreamController.sink;
  StreamSink<Emp> get empSalaryInc => _empSalaryIncStreamController.sink;
  StreamSink<Emp> get empSalaryDec => _empSalaryDecStreamController.sink;
  StreamSink<Emp> get empSalarySort => _empSalarySortStreamController.sink;

  // 3- constracter => add data and listen to changes
  EmpBlock() {
    _empListStreamController.add(_empList);
    _empSalaryIncStreamController.stream.listen(_incSalary);
    _empSalaryDecStreamController.stream.listen(_decSalary);
    _empSalarySortStreamController.stream.listen(_sortSalary);
  }

// 4- core Functions
  _sortSalary(Emp emp) {
    empListSink.add(_empList2);
  }

  _incSalary(Emp emp) {
    _empList[emp.id - 1].salary = emp.salary + 100;
    empListSink.add(_empList);
  }

  _decSalary(Emp emp) {
    _empList[emp.id - 1].salary = emp.salary - 100;
    empListSink.add(_empList);
  }

// 5- close bloc
  void dispose() {
    _empListStreamController.close();
    _empSalaryIncStreamController.close();
    _empSalaryDecStreamController.close();
    _empSalarySortStreamController.close();
  }
}
