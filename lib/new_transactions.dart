// import 'package:flutter/material.dart';

// class NewTransaction extends StatelessWidget {
//   const NewTransaction({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     void newTransaction() {
//       showDialog(
//           barrierDismissible: false,
//           context: context,
//           builder: (BuildContext context) {
//             return StatefulBuilder(
//               builder: (BuildContext context, setState) {
//                 return AlertDialog(
//                   title: Text('N E W  T R A N S A C T I O N'),
//                   content: SingleChildScrollView(
//                     child: Column(
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Text('Expense'),
//                             Switch(
//                               value: _isIncome,
//                               onChanged: (newValue) {
//                                 setState(() {
//                                   _isIncome = newValue;
//                                 });
//                               },
//                             ),
//                             Text('Income'),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 5,
//                         ),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: Form(
//                                 key: _formKey,
//                                 child: TextFormField(
//                                   decoration: InputDecoration(
//                                     border: OutlineInputBorder(),
//                                     hintText: 'Amount?',
//                                   ),
//                                   validator: (text) {
//                                     if (text == null || text.isEmpty) {
//                                       return 'Enter an amount';
//                                     }
//                                     return null;
//                                   },
//                                   controller: _textcontrollerAMOUNT,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 5,
//                         ),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: TextField(
//                                 decoration: InputDecoration(
//                                   border: OutlineInputBorder(),
//                                   hintText: 'For what?',
//                                 ),
//                                 controller: _textcontrollerITEM,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   actions: <Widget>[
//                     MaterialButton(
//                       color: Colors.grey[600],
//                       child:
//                           Text('Cancel', style: TextStyle(color: Colors.white)),
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                     ),
//                     MaterialButton(
//                       color: Colors.grey[600],
//                       child:
//                           Text('Enter', style: TextStyle(color: Colors.white)),
//                       onPressed: () {
//                         if (_formKey.currentState!.validate()) {
//                           enterTransaction();
//                           Navigator.of(context).pop();
//                         }
//                       },
//                     )
//                   ],
//                 );
//               },
//             );
//           });
//     }
//     return Container();
//   }
// }
//
