enum BonusesType { accrual, deduction, burned }

class ClientBonusesHistoryItem {
  ClientBonusesHistoryItem({
    required this.id,
    required this.date,
    required this.type,
    required this.title,
    required this.count,
  });

  final String id;
  final String date;
  final BonusesType type;
  final String title;
  final int count;

  static List<ClientBonusesHistoryItem> fakeList = [
    ClientBonusesHistoryItem(
      id: '1',
      date: '2023-10-26',
      type: BonusesType.accrual,
      title: 'Welcome Bonus',
      count: 100,
    ),
    ClientBonusesHistoryItem(
      id: '2',
      date: '2023-10-27',
      type: BonusesType.deduction,
      title: 'Redeemed for Discount',
      count: 50,
    ),
    ClientBonusesHistoryItem(
      id: '3',
      date: '2023-10-28',
      type: BonusesType.burned,
      title: 'Purchase Bonus',
      count: 25,
    ),
    ClientBonusesHistoryItem(
      id: '4',
      date: '2023-10-29',
      type: BonusesType.accrual,
      title: 'Referral Bonus',
      count: 75,
    ),
  ];
}
