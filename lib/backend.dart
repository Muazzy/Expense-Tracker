// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/foundation.dart';
import 'package:gsheets/gsheets.dart';

const credentials = r'''
{
  "type": "service_account",
  "project_id": "expense-331920",
  "private_key_id": "5620ba27e1b2c82404708e688099c199fd4fa059",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCAhDqCqD5GLFlx\nLDHyAveLfV+5KW/cTFvTfxeJoJZ/w4O5i47GTcDEj1oNztasu5kJfo85UY2IHjnq\nvxRQ1vhwE7PUpVlIenDAMTir6kP38BS5ZPubHazS8M9NOTwwUmHIV0ZcaALagcvg\nRDiqu332rdyArgjcITJHVYUPPAeF5ElBQFdrzPuZ6zuCkAUBa4NcCu102QxZ31w8\n0VrokWHGxnWDh8mfsq43M/kOzO1dFAG6UdEAR5hRxL47Dq6D6l4oV4daTnjC/wWo\nnlJ5jHJu8+usb3T1wwnrTv4vnGltj3yH0d0Mw4ePiMCqkO2peyVlYsazcNZClPZc\njeDLEZChAgMBAAECggEAAnRJUpgwVez6zsmu0P3hQ2jN0Ivekt+NmTP/a4g1bjka\nEtZRT/m+urTi8yn4vnRNLinHG1Y9PI+Y4HdNGyTwejcdcKwb22xaKvNtryvHvUGt\n6vicl51ea5SqyCE1uZWt1XJ5jvdzXCqieEo5O6UduP2gPRVbE4rElT6S+Pk29WW2\nxRFLe7m5W4mMwUWA860VQKpUyuwbIPDNFDVWFVh/KOdfdTfnudL7LoLvJsnNaH64\ngb9WI8uK81g0YezK+xRvOAcDdBWavAigXG9Q7qY0OQkF4ENKLJRZNEEJwHCbEDhP\nYCrtMAucx1xRnHAk0tSnrZ3f0KjpatfoWXEb5Ov4YQKBgQC1nhHho/QgkPCQ9POU\nTaP8nYmttTa57EkX/DNphjnkqZRHZ3sJFH6+FKwc/aqG+nUSLTtm/BHSTIfHKX0l\nBfdOGZbNDAuoDHWJT8Kn8X3V5Oez75IO4PxjpOhK1QdSKIkgUuQj8hPZQfSjoBZy\nHeNHyWOa3mERleFNMRxs+/C4MQKBgQC1JrfP3wmzMEVyAbc5cjTJVVMbRSow32pE\njqtVDjAlcW3My1uxgVVueF2sI+TeGqlvfDXYArlMcJxquO3rDZ50in2j2FgtKnnT\nRHGZ60cIfdOtrYHEB4biJwWQmABd83HY9bihQS6fJX4qGLO4MLxd+cVq4Ivr5UT8\nlEp6GeazcQKBgEGM6dtM98IBTjKjln7CfxugKJ8ftr7oP4F+r3e40JBtfG1BNjES\nyqQEhhJ4o+HP6A1Fchk7hZsnsCH8IYUJYDc6GSms3VAsHwgOV62SBd77nX1eTJM+\nNRop3QWVWe0XYFbgVCN9LhjOK2QbVb6edvfkAiVVeieEtyrLPP1A+aMhAoGAR2Cl\nJqwMZ2WKx3wzlNgSQo5zO5iKIk210qOgkNgRUn+aMwqh65Q5dFjLGAvgnz9EKeB4\nWs/f8WWhzE9nt6lbGTKEhO22+Lz22a7rUCmriIYDxThLnFEW7b9QawPpiRtmbYWM\npUVIuH6Ocsne7qGNZz4GcrFdkKp6/0by/Z99DpECgYEAqks6KnfmTng6z0+OQKJG\nGyzzd8bXqZ8HdpOVgFTQ/LtGaqAQis/sljWrzVfDiPdZ9Ev/wrV2+x9MbYovImrm\neS8ABSqyCIA5qtZ0DBOsdfMGhN2XWNR3OEd6okYeshSrHGTyCEU52BNES+UuP9gB\nSaxP1JJu920P7uXgT2tP/qA=\n-----END PRIVATE KEY-----\n",
  "client_email": "expense-tracker@expense-331920.iam.gserviceaccount.com",
  "client_id": "103767099833903267091",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/expense-tracker%40expense-331920.iam.gserviceaccount.com"
}
 ''';

const spreadsheetId = '1a4f3HFh-mggbPGc284f5xfsbxEtIa_2WYWdAy5crIqw';
const worksheetName = 'ExpenseTrackerV1';

class BackEnd extends ChangeNotifier {
  BackEnd() {
    init();
  }
  final GSheets gSheets = GSheets(credentials);
  Worksheet? worksheet;

  int noOfTransactions = 0;

  List<List<dynamic>> transactions = [];
  List<List<dynamic>> totalExpense = [];
  List<List<dynamic>> totalIncome = [];

  bool loading = true;

  Future init() async {
    final sprdSheet = await gSheets.spreadsheet(spreadsheetId);
    worksheet = sprdSheet.worksheetByTitle(worksheetName);
    countRows();
    notifyListeners();
  }

  Future countRows() async {
    while (
        (await worksheet!.values.value(column: 3, row: noOfTransactions + 1)) !=
            '') {
      noOfTransactions++;
    }
    loadTransactions();
    notifyListeners();
  }

  Future loadTransactions() async {
    //checking if the worksheet is null then just exiting the function
    if (worksheet == null) return;

    //looping thru each row if the worksheet is not empty
    //and storing transaction name, amount, and expense or income parameter
    for (int i = 1; i < noOfTransactions; i++) {
      final String transactionName =
          await worksheet!.values.value(column: 1, row: i + 1);
      final String transactionAmount =
          await worksheet!.values.value(column: 2, row: i + 1);
      final String transactionType =
          await worksheet!.values.value(column: 3, row: i + 1);

      //checking if our locally created list is updated, if not, we just add those transaction in our list too.
      if (transactions.length < noOfTransactions) {
        transactions.add([
          transactionName,
          transactionAmount,
          transactionType,
        ]);
      }
      updateTotalExpense();
      updateTotalIncome();
    }
    // print(Transactions);
    // this will stop the circular loading indicator
    loading = false;
    notifyListeners();
  }

  Future insertTransaction(String name, String amount, bool isIncome) async {
    if (worksheet == null) return;
    //first updating the number of transactions
    noOfTransactions++;

    //adding the new transaction to the locally created list first then the actual spreadsheet.
    transactions.add([
      name,
      amount,
      isIncome ? 'income' : 'expense',
    ]);
    await worksheet!.values.appendRow([
      name,
      amount,
      isIncome ? 'income' : 'expense',
    ]);
    calculateExpense();
    calculateIncome();
    notifyListeners();
  }

  double calculateIncome() {
    double income = 0;
    for (int i = 0; i < transactions.length; i++) {
      if (transactions[i][2] == 'income') {
        income += double.parse(transactions[i][1]);
      }
    }
    return income;
  }

  double calculateExpense() {
    double expense = 0;
    for (int i = 0; i < transactions.length; i++) {
      if (transactions[i][2] == 'expense') {
        expense += double.parse(transactions[i][1]);
      }
    }
    return expense;
  }

  updateTotalIncome() {
    if (transactions.isEmpty) return;
    totalIncome = [];
    for (int i = 0; i < transactions.length; i++) {
      if (transactions[i][2] == 'income') {
        final String name = transactions[i][0];
        final String amount = transactions[i][1];
        final String transactionType = transactions[i][2];
        totalIncome.add([
          name,
          amount,
          transactionType,
        ]);
      }
    }
    notifyListeners();
  }

  updateTotalExpense() {
    if (transactions.isEmpty) return;
    totalExpense = [];
    for (int i = 0; i < transactions.length; i++) {
      if (transactions[i][2] == 'expense') {
        final String name = transactions[i][0];
        final String amount = transactions[i][1];
        final String transactionType = transactions[i][2];
        totalExpense.add([
          name,
          amount,
          transactionType,
        ]);
      }
    }
    notifyListeners();
  }

  List get expenseList {
    return totalExpense;
  }

  List get incomeList {
    return totalIncome;
  }

  List get transactionList {
    return transactions;
  }
}



// init() async {
// //init gsheets, initializing the instance of gsheets just like i did with sqflite db
//   final gsheets = GSheets(credentials);

//   //note: a spreadsheet can have multiple worksheets

//   // fetching spreadsheet by its id
//   final spreadSheet = await gsheets.spreadsheet(spreadsheetId);

//   //getting worksheet by its title
//   var sheet = spreadSheet.worksheetByTitle('ExpenseTrackerV1');

//   //updating a cell
//   //sheet! (if the sheet actually exits or not, so its a null check)
//   await sheet!.values.insertValue('helloWorld', column: 1, row: 2);
// }
