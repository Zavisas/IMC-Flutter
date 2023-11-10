// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';


class IMCTableScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tabela IMC'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Tabela de Classificação IMC',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              DataTable(
                columns: [
                  DataColumn(label: Text('IMC')),
                  DataColumn(label: Text('Classificação')),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('Abaixo de 18.5')),
                    DataCell(Text('Abaixo do Peso')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('18.5 - 24.9')),
                    DataCell(Text('Peso Normal')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('25.0 - 29.9')),
                    DataCell(Text('Sobrepeso')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('30.0 - 34.9')),
                    DataCell(Text('Obesidade Grau 1')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('35.0 - 39.9')),
                    DataCell(Text('Obesidade Grau 2')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('40.0 e acima')),
                    DataCell(Text('Obesidade Grau 3')),
                  ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

