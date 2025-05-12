import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/user_model.dart';
import '../services/database_service.dart';

class ReadScreen extends StatefulWidget {
  @override
  _ReadScreenState createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
  final DatabaseService _databaseService = DatabaseService();

  String? _accountTypeFilter;
  double? _amountThreshold;
  int? _minVacancies;

  List<UserModel> _applyFilters(List<UserModel> users) {
    return users.where((user) {
      final matchAccount = _accountTypeFilter == null || user.accountType == _accountTypeFilter;
      final matchAmount = _amountThreshold == null || user.amount >= _amountThreshold!;
      final matchVacancies = _minVacancies == null || user.vacancies >= _minVacancies!;
      return matchAccount && matchAmount && matchVacancies;
    }).toList();
  }

  String _generateTicketID(String userId) {
    final hash = userId.codeUnits.fold(0, (prev, e) => prev + e);
    final random = Random(hash);
    return (random.nextInt(900000) + 100000).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Filter row
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              // Account Type Dropdown
              Expanded(
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: 'Account Type'),
                  value: _accountTypeFilter,
                  items: ['PG', 'Flat']
                      .map((type) => DropdownMenuItem(value: type, child: Text(type)))
                      .toList(),
                  onChanged: (val) => setState(() => _accountTypeFilter = val),
                ),
              ),
              SizedBox(width: 10),

              // Min Amount TextField
              Expanded(
                child: TextField(
                  decoration: InputDecoration(labelText: 'Min Amount'),
                  keyboardType: TextInputType.number,
                  onChanged: (val) {
                    setState(() {
                      _amountThreshold = double.tryParse(val);
                    });
                  },
                ),
              ),
              SizedBox(width: 10),

              // Min Vacancies TextField
              Expanded(
                child: TextField(
                  decoration: InputDecoration(labelText: 'Min Vacancies'),
                  keyboardType: TextInputType.number,
                  onChanged: (val) {
                    setState(() {
                      _minVacancies = int.tryParse(val);
                    });
                  },
                ),
              ),
              SizedBox(width: 10),

              // Reset Button
              TextButton(
                onPressed: () {
                  setState(() {
                    _accountTypeFilter = null;
                    _amountThreshold = null;
                    _minVacancies = null;
                  });
                },
                child: Text("Reset"),
              ),
            ],
          ),
        ),

        // User list
        Expanded(
          child: StreamBuilder<List<UserModel>>(
            stream: _databaseService.getUsers(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }

              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No users found'));
              }

              final filteredUsers = _applyFilters(snapshot.data!);

              if (filteredUsers.isEmpty) {
                return Center(child: Text('No users match the filters.'));
              }

              return ListView.builder(
                itemCount: filteredUsers.length,
                itemBuilder: (ctx, index) {
                  final user = filteredUsers[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Community Ticket ID: ${_generateTicketID(user.id)}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 6),
                          Text(
                            user.fullName,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text('Email: ${user.email}'),
                          Text('Phone: ${user.phoneNumber}'),
                          Text('Date: ${DateFormat('dd/MM/yyyy').format(user.dateOfBirth)}'),
                          Text('Address: ${user.address}'),
                          Text('Type: ${user.accountType}'),
                          Text('Amount: ₹${user.amount.toStringAsFixed(2)}'),
                          Text('Vacancies: ${user.vacancies}'),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
