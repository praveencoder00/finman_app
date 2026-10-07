class Expense {
  final int? id;
  final String title;
  final double amount;
  final String category;
  final String type;
  final String paymentMode;
  final DateTime date;
  final String? note;

  Expense({
    this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.type,
    required this.paymentMode,
    required this.date,
    this.note,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'category': category,
      'type': type,
      'payment_mode': paymentMode,
      'date': date.toIso8601String(),
      'note': note,
    };
  }

  factory Expense.fromMap(Map<String, dynamic> map) {
    return Expense(
      id: map['id'],
      title: map['title'],
      amount: map['amount'],
      category: map['category'],
      type: map['type'],
      paymentMode: map['payment_mode'],
      date: DateTime.parse(map['date']),
      note: map['note'],
    );
  }
}