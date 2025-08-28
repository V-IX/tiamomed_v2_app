class ClientCertificate {
  ClientCertificate({
    required this.id,
    required this.validDate,
    required this.initialBalance,
    required this.currentBalance,
    required this.certificateUrl,
  });

  final String id;
  final String validDate;
  final String initialBalance;
  final String currentBalance;
  final String certificateUrl;

  static ClientCertificate fake() => ClientCertificate(
        id: '12345',
        validDate: '2023-12-31',
        initialBalance: '1000',
        currentBalance: '500',
        certificateUrl: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.cybersport.ru%2Ftags%2Fcosplay%2Fdvach-tian-kosplei-na-alisu-iz-beskonechnogo-leta&psig=AOvVaw0ewc2oM_NINUFHj1jRT_Fr&ust=1756471002263000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCJjyrMTCrY8DFQAAAAAdAAAAABAK',
      );

}
