import 'package:flutter/material.dart';
import 'package:myfirstbloc/models/emp/empBloc.dart';
import 'package:myfirstbloc/models/emp/emp.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final EmpBlock empBloc = EmpBlock();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Employee Salary')),
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
                      ClipRRect(
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
                      const Spacer(),
                      Column(
                        children: [
                          Text(snapshot.data![index].name),
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
