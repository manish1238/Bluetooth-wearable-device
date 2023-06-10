// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_blue/flutter_blue.dart';
//
// const int TYPE_SERVER = 0;
// const int TYPE_SERVICE = 1;
// const int TYPE_CHARACTERISTIC = 2;
// const int TYPE_DESCRIPTOR = 3;
//
// const int FLAG_BROADCAST = 0x00000001;
// const int FLAG_READ = 0x00000002;
// const int FLAG_WRITE_NO_RESPONSE = 0x00000004;
// const int FLAG_WRITE = 0x00000008;
// const int FLAG_NOTIFY = 0x00000010;
// const int FLAG_INDICATE = 0x00000020;
// const int FLAG_AUTH_SIGNED_WRITE = 0x00000040;
// const int FLAG_RELIABLE_WRITE = 0x00000080;
// const int FLAG_WRITABLE_AUXILIARIES = 0x00000100;
//
// const String AFON_TECH_SERVICE_UUID = "0000AABB-CC7A-482A-984A-7F2ED5B3E58F";
// const String AFON_TECH_WRITE_CHAR_UUID = "0000AACC-8E22-4541-9D4C-21EDAE82ED19";
// const String AFON_TECH_NOTIFY_CHAR_UUID =
//     "0000AADD-8E22-4541-9D4C-21EDAE82ED19";
// const String AFON_TECH_NOTIFY_DESC_UUID =
//     "00002902-0000-1000-8000-00805F9B34FB";
//
// class ServerDefinition {
//   String serverId;
//   String name;
//   int rssi;
//   int txPower;
//   String serviceUuids;
//   String servicesWithData;
//   String solicitedServiceUuids;
//   int manufacturerCompanyId;
//   String manufacturerCompanyData;
//   bool isConnectable;
//   bool isScanResponse;
//
//   ServerDefinition({
//     required this.serverId,
//     required this.name,
//     required this.rssi,
//     required this.txPower,
//     required this.serviceUuids,
//     required this.servicesWithData,
//     required this.solicitedServiceUuids,
//     required this.manufacturerCompanyId,
//     required this.manufacturerCompanyData,
//     required this.isConnectable,
//     required this.isScanResponse,
//   });
// }
//
// class DescriptorDefinition {
//   String descriptorId;
//   String name;
//
//   DescriptorDefinition({
//     required this.descriptorId,
//     required this.name,
//   });
// }
//
// class CharacteristicDefinition {
//   String characteristicId;
//   String name;
//
//   CharacteristicDefinition({
//     required this.characteristicId,
//     required this.name,
//   });
// }
//
// class ServiceDefinition {
//   String serviceId;
//   String name;
//
//   ServiceDefinition({
//     required this.serviceId,
//     required this.name,
//   });
// }
//
// class FormClientBLE extends StatefulWidget {
//   // final WindowsPDCMimic myParentForm;
//
//   const FormClientBLE({
//     Key? key,
//     // required this.myParentForm
//   }) : super(key: key);
//
//   @override
//   _FormClientBLEState createState() => _FormClientBLEState();
// }
//
// class _FormClientBLEState extends State<FormClientBLE> {
//   FlutterBlue flutterBlue = FlutterBlue.instance;
//   List<ServerDefinition> serverList = [];
//   List<Service> serviceList = [];
//   Service? afonCommsService;
//   // Characteristic? afonWriteCharacteristic;
//   // Characteristic? afonNotifyCharacteristic;
//   // Descriptor? afonNotifyDescriptor;
//   int connectedServer = 0;
//   bool reConnect = false;
//   bool clickParentButton = false;
//   bool attemptingConnect = false;
//
//   @override
//   void initState() {
//     super.initState();
//     // Start scanning on initialization
//
//     startScanning();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     throw UnimplementedError();
//   }
//
//   void startScanning() {
//     List<BluetoothDevice> serverList = [];
//
//     FlutterBlue flutterBlue = FlutterBlue.instance;
//     flutterBlue.startScan(timeout: Duration(seconds: 4));
//
//     flutterBlue.scanResults.listen((results) {
//       for (ScanResult result in results) {
//         BluetoothDevice server = result.device;
//
//         if (!serverList.contains(server)) {
//           serverList.add(server);
//           print('Device Name: ${server.name}, ID: ${server.id}');
//         }
//       }
//     });
//   }
// }
