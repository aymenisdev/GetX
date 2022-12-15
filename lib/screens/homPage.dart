import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:myfirstbloc/controllers/homeCtr.dart';
import 'package:myfirstbloc/models/emp/empBloc.dart';
import 'package:myfirstbloc/models/emp/emp.dart';
import 'package:myfirstbloc/screens/photosPage.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final EmpBlock empBloc = EmpBlock();

  @override
  Widget build(BuildContext context) {
    HomePageCtr ctr = Get.put(HomePageCtr());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Salary'),
        actions: [
          Obx(() {
            return IconButton(
                onPressed: () => ctr.changeIconX(), icon: ctr.myIcon.value);
          }),
          GetBuilder<HomePageCtr>(
              init: HomePageCtr(),
              builder: (value) {
                return IconButton(
                    onPressed: () => value.changeIcon(),
                    icon: value.myIcon.value);
              }),
          GetX<HomePageCtr>(
              init: HomePageCtr(),
              builder: (value) {
                return IconButton(
                    onPressed: () => value.changeIconX(),
                    icon: value.myIcon.value);
              }),
        ],
      ),
      body: StreamBuilder<List<Emp>>(
        stream: empBloc.empListStream,
        builder: ((context, snapshot) {
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: ((context, index) {
                return Card(
                  elevation: 5.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () => Get.to(() => PhotosPage(
                              pageName: snapshot.data![index].name,
                              photo: snapshot.data![index].img,
                            )),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            color: Colors.white,
                            child: Image.network(
                              snapshot.data![index].img,
                              height: 70.0,
                              width: 70.0,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          Text(
                            snapshot.data![index].name,
                            style: TextStyle(
                                color: snapshot.data![index].salary < 1000
                                    ? Colors.orange
                                    : snapshot.data![index].salary < 2000
                                        ? Colors.blue
                                        : snapshot.data![index].salary > 3000
                                            ? Colors.red
                                            : Colors.green),
                          ),
                          Text('\$ ${snapshot.data![index].salary.toString()}'),
                        ],
                      ),
                      Spacer(),
                      TextButton(
                          onPressed: () {
                            empBloc.empSalaryDec.add(snapshot.data![index]);
                          },
                          child: const Icon(
                            Icons.remove,
                            color: Colors.red,
                          )),
                      TextButton(
                          onPressed: () {
                            empBloc.empSalaryInc.add(snapshot.data![index]);
                          },
                          child: const Icon(Icons.add, color: Colors.green))
                    ],
                  ),
                );
              }));
        }),
      ),
    );
  }
}
