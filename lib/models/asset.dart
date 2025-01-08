import 'package:vively/models/owner.dart';

class Asset {
  final String id;
  final String name;
  final String type;
  final String location;
  final String image;
  final double price;
  final int ownersCount;
  final double sharePrice;
  final String description;
  final List<String> features;
  final List<Owner> owners;
  final List<String> rules;
  final Map<String, String> specifications;
  final Schedule? currentSchedule;
  final bool isCoOwned;

  Asset({
    required this.id,
    required this.name,
    required this.type,
    required this.location,
    required this.image,
    required this.price,
    required this.ownersCount,
    required this.sharePrice,
    required this.description,
    required this.features,
    this.owners = const [],
    this.rules = const [],
    this.specifications = const {},
    this.currentSchedule,
    this.isCoOwned = false,
  });
}

// Sample data
final List<Asset> myAssets = [
  Asset(
    id: '1',
    isCoOwned: true,
    name: 'Villa Marina',
    type: 'homes',
    location: 'Palm Jumeirah, Dubai',
    image: 'assets/images/villa1.jpg',
    price: 5000000,
    ownersCount: 4,
    sharePrice: 1250000,
    description: 'Luxury 5-bedroom villa with private beach access',
    features: ['Private Pool', 'Beach Access', 'Smart Home', 'Furnished'],
    owners: [
      Owner(
        id: '1',
        name: 'You',
        ownership: 0.25,
        schedules: [
          Schedule(
            startDate: DateTime.now().add(const Duration(days: 91)),
            endDate: DateTime.now().add(const Duration(days: 120)),
            status: 'upcoming',
          ),
        ],
      ),
      Owner(
        id: '2',
        name: 'Mohammed Al Qasimi',
        ownership: 0.25,
        schedules: [
          Schedule(
            startDate: DateTime.now(),
            endDate: DateTime.now().add(const Duration(days: 30)),
            status: 'current',
          ),
        ],
      ),
      Owner(
        id: '3',
        name: 'Sarah Al Maktoum',
        ownership: 0.25,
        schedules: [
          Schedule(
            startDate: DateTime.now().add(const Duration(days: 31)),
            endDate: DateTime.now().add(const Duration(days: 60)),
            status: 'upcoming',
          ),
        ],
      ),
      Owner(
        id: '4',
        name: 'Abdullah Al Falasi',
        ownership: 0.25,
        schedules: [
          Schedule(
            startDate: DateTime.now().add(const Duration(days: 61)),
            endDate: DateTime.now().add(const Duration(days: 90)),
            status: 'upcoming',
          ),
        ],
      ),
    ],
    rules: [
      'Maximum occupancy: 8 people',
      'No pets allowed',
      'No smoking indoors',
      'Quiet hours: 10 PM - 8 AM',
      'No parties or events without prior approval',
      'Pool hours: 6 AM - 10 PM',
    ],
    specifications: {
      'Size': '8,500 sq ft',
      'Bedrooms': '5',
      'Bathrooms': '6',
      'Parking': '3 cars',
      'Plot': '10,000 sq ft',
      'Built': '2021',
    },
    currentSchedule: Schedule(
      startDate: DateTime.now(),
      endDate: DateTime.now().add(const Duration(days: 30)),
      status: 'current',
    ),
  ),
  Asset(
    isCoOwned: true,
    id: '2',
    name: 'Porsche 911 GT3',
    type: 'cars',
    location: 'Downtown Dubai',
    image: 'assets/images/car1.jpg',
    price: 600000,
    ownersCount: 3,
    sharePrice: 200000,
    description: '2023 Model, Racing Package',
    features: ['Sport Mode', 'Carbon Fiber', 'Track Ready', 'PDK Transmission'],
    owners: [
      Owner(
        id: '5',
        name: 'You',
        ownership: 0.34,
        schedules: [
          Schedule(
            startDate: DateTime.now(),
            endDate: DateTime.now().add(const Duration(days: 10)),
            status: 'current',
          ),
        ],
      ),
      Owner(
        id: '6',
        name: 'Rashid Al Habtoor',
        ownership: 0.33,
        schedules: [
          Schedule(
            startDate: DateTime.now().add(const Duration(days: 11)),
            endDate: DateTime.now().add(const Duration(days: 20)),
            status: 'upcoming',
          ),
        ],
      ),
      Owner(
        id: '7',
        name: 'Omar Al Futtaim',
        ownership: 0.33,
        schedules: [
          Schedule(
            startDate: DateTime.now().add(const Duration(days: 21)),
            endDate: DateTime.now().add(const Duration(days: 30)),
            status: 'upcoming',
          ),
        ],
      ),
    ],
    rules: [
      'No smoking in the car',
      'No track days without prior notice',
      'Regular maintenance schedule must be followed',
      'Maximum 2,000 km per month',
      'Fuel: Premium 98 only',
    ],
    specifications: {
      'Engine': '4.0L Flat-6',
      'Power': '503 HP',
      '0-100': '3.4 sec',
      'Top Speed': '318 km/h',
      'Weight': '1,435 kg',
      'Year': '2023',
    },
    currentSchedule: Schedule(
      startDate: DateTime.now(),
      endDate: DateTime.now().add(const Duration(days: 10)),
      status: 'current',
    ),
  ),
  Asset(
    id: '3',
    name: 'Office Suite',
    type: 'offices',
    location: 'DIFC, Dubai',
    image: 'assets/images/office1.jpg',
    price: 2000000,
    ownersCount: 4,
    sharePrice: 500000,
    description: 'Premium office space in DIFC',
    features: ['Meeting Rooms', '24/7 Access', 'Parking', 'Reception Service'],
    owners: [
      Owner(
        id: '8',
        name: 'Dubai Ventures LLC',
        ownership: 0.40,
        schedules: [
          Schedule(
            startDate: DateTime.now(),
            endDate: DateTime.now().add(const Duration(days: 90)),
            status: 'current',
          ),
        ],
      ),
      Owner(
        id: '9',
        name: 'Global Trading Co',
        ownership: 0.30,
        schedules: [
          Schedule(
            startDate: DateTime.now().add(const Duration(days: 91)),
            endDate: DateTime.now().add(const Duration(days: 180)),
            status: 'upcoming',
          ),
        ],
      ),
      Owner(
        id: '10',
        name: 'Tech Solutions FZ',
        ownership: 0.30,
        schedules: [
          Schedule(
            startDate: DateTime.now().add(const Duration(days: 181)),
            endDate: DateTime.now().add(const Duration(days: 270)),
            status: 'upcoming',
          ),
        ],
      ),
    ],
    rules: [
      'Business hours: 8 AM - 8 PM',
      'Visitor registration required',
      'Meeting rooms must be booked in advance',
      'No alterations without approval',
      'Shared spaces must be kept clean',
    ],
    specifications: {
      'Size': '2,500 sq ft',
      'Workstations': '20',
      'Meeting Rooms': '2',
      'Parking Spots': '4',
      'Floor': '15',
    },
    currentSchedule: Schedule(
      startDate: DateTime.now(),
      endDate: DateTime.now().add(const Duration(days: 90)),
      status: 'current',
    ),
  ),
];

final List<Asset> feedAssets = [
  Asset(
    id: '4',
    name: 'Yacht Serenity',
    type: 'yachts',
    location: 'Dubai Marina',
    image: 'assets/images/yacht1.jpg',
    price: 8000000,
    ownersCount: 8,
    sharePrice: 1000000,
    description: '85ft luxury yacht with full crew service',
    features: ['Crew Included', 'Full Kitchen', '4 Cabins', 'Jet Skis'],
    owners: [
      Owner(
        id: '8',
        name: 'Dubai Marine Club',
        ownership: 0.40,
        schedules: [
          Schedule(
            startDate: DateTime.now(),
            endDate: DateTime.now().add(const Duration(days: 30)),
            status: 'current',
          ),
        ],
      ),
      Owner(
        id: '9',
        name: 'Ahmed Al Rostamani',
        ownership: 0.30,
        schedules: [
          Schedule(
            startDate: DateTime.now().add(const Duration(days: 31)),
            endDate: DateTime.now().add(const Duration(days: 60)),
            status: 'upcoming',
          ),
        ],
      ),
    ],
    rules: [
      'Professional crew required',
      'Maximum 12 passengers',
      'Insurance required',
      'Minimum 3-day booking',
      'No pets without prior approval',
    ],
    specifications: {
      'Length': '85 ft',
      'Cabins': '4',
      'Capacity': '12',
      'Crew': '4',
      'Built': '2021',
      'Speed': '25 knots',
    },
  ),
  Asset(
    id: '5',
    name: 'Ferrari SF90',
    type: 'cars',
    location: 'City Walk, Dubai',
    image: 'assets/images/car2.jpg',
    price: 2000000,
    ownersCount: 4,
    sharePrice: 500000,
    description: 'Hybrid supercar with track package',
    features: ['1000 HP', 'Hybrid Power', 'Carbon Package', 'Track Telemetry'],
    owners: [
      Owner(
        id: '10',
        name: 'Dubai Supercar Club',
        ownership: 0.50,
        schedules: [
          Schedule(
            startDate: DateTime.now(),
            endDate: DateTime.now().add(const Duration(days: 15)),
            status: 'current',
          ),
        ],
      ),
    ],
    rules: [
      'Experienced drivers only',
      'Track day participation available',
      'Monthly maintenance required',
      'Maximum 1,500 km per month',
      'Charging station provided',
    ],
    specifications: {
      'Engine': 'V8 + 3 Electric',
      'Power': '1000 HP',
      '0-100': '2.5 sec',
      'Top Speed': '340 km/h',
      'Range': '25km (Electric)',
      'Year': '2023',
    },
  ),
  Asset(
    id: '6',
    name: 'Vacation Villa',
    type: 'homes',
    location: 'Maldives',
    image: 'assets/images/villa2.jpg',
    price: 4000000,
    ownersCount: 6,
    sharePrice: 666666,
    description: 'Overwater villa with private pool',
    features: ['Ocean View', 'Butler Service', 'Resort Access', 'Private Pool'],
    owners: [
      Owner(
        id: '15',
        name: 'David Thompson',
        ownership: 0.25,
        schedules: [
          Schedule(
            startDate: DateTime.now(),
            endDate: DateTime.now().add(const Duration(days: 60)),
            status: 'current',
          ),
        ],
      ),
      Owner(
        id: '16',
        name: 'Lisa Wang',
        ownership: 0.25,
        schedules: [
          Schedule(
            startDate: DateTime.now().add(const Duration(days: 61)),
            endDate: DateTime.now().add(const Duration(days: 120)),
            status: 'upcoming',
          ),
        ],
      ),
    ],
    rules: [
      'Maximum 6 guests',
      'No smoking indoors',
      'Butler service 24/7',
      'Advance booking required for activities',
      'Check-in: 2 PM, Check-out: 12 PM',
    ],
    specifications: {
      'Size': '3,200 sq ft',
      'Bedrooms': '3',
      'Bathrooms': '3',
      'Pool': 'Private',
      'View': 'Ocean',
      'Built': '2022',
    },
    currentSchedule: Schedule(
      startDate: DateTime.now(),
      endDate: DateTime.now().add(const Duration(days: 60)),
      status: 'current',
    ),
  ),
];
