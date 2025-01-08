class Owner {
  final String id;
  final String name;
  final double ownership;
  final List<Schedule> schedules;

  Owner({
    required this.id,
    required this.name,
    required this.ownership,
    required this.schedules,
  });
}

class Schedule {
  final DateTime startDate;
  final DateTime endDate;
  final String status; // current, upcoming, completed
  final bool isExtensionRequested;

  Schedule({
    required this.startDate,
    required this.endDate,
    required this.status,
    this.isExtensionRequested = false,
  });
}
