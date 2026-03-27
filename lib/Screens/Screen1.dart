import 'package:dash/Controllers/Data_Controller.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Screen1 extends StatelessWidget {
  Screen1({super.key});
  final controller = Get.put(TableController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Smart Table"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(() {
          return DataTable2(
            columnSpacing: 12,
            horizontalMargin: 12,
            minWidth: 600,

            columns: const [
              DataColumn2(
                label: Text("ID"),
                size: ColumnSize.S,
              ),
              DataColumn(
                label: Text("Name"),
              ),
              DataColumn(
                label: Text("Email"),
              ),
              DataColumn2(
                label: Text("Age"),
                size: ColumnSize.S,
              ),
            ],

            rows: controller.users.map((user) {
              final isSelected =
              controller.selectedRows.contains(user.id);

              return DataRow(
                selected: isSelected,
                onSelectChanged: (_) =>
                    controller.toggleSelection(user.id),
                cells: [
                  DataCell(Text(user.id.toString())),
                  DataCell(Text(user.name)),
                  DataCell(Text(user.email)),
                  DataCell(Text(user.age.toString())),
                ],
              );
            }).toList(),
          );
        }),
      ),
    );
  }
}