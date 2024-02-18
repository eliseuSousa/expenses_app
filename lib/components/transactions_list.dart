import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransictionsList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  TransictionsList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
      height: 650,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'Nenhuma transação cadastrada',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 20),
                Container(
                  height: 400,
                  child: Image.asset(
                    'assets/image/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                final tr = transactions[index];
                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 36,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: FittedBox(
                          child: Container(
                            child: Text(
                              'R\$${tr.value}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'OpenSans',
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      tr.title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    subtitle: Text(
                      DateFormat('d MMM y').format(tr.date),
                    ),
                    trailing: IconButton(
                      onPressed: () => onRemove(tr.id),
                      color: Theme.of(context).colorScheme.primary,
                      icon: const Icon(Icons.delete),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
