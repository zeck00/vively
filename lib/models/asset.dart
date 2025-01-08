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
  });
}

// Sample data
final List<Asset> myAssets = [
  Asset(
    id: '1',
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
        name: 'Ahmed Hassan',
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
        id: '2',
        name: 'Sarah Smith',
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
        id: '3',
        name: 'Adam Roland',
        ownership: 0.25,
        schedules: [
          Schedule(
            startDate: DateTime.now().add(const Duration(days: 61)),
            endDate: DateTime.now().add(const Duration(days: 90)),
            status: 'upcoming',
          ),
        ],
      ),
      Owner(
        id: '4',
        name: 'John Doe',
        ownership: 0.25,
        schedules: [
          Schedule(
            startDate: DateTime.now().add(const Duration(days: 91)),
            endDate: DateTime.now().add(const Duration(days: 120)),
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
    id: '2',
    name: 'Porsche 911 GT3',
    type: 'cars',
    location: 'Dubai Marina',
    image: 'assets/images/car1.jpg',
    price: 600000,
    ownersCount: 3,
    sharePrice: 200000,
    description: '2023 Model, Racing Package',
    features: ['Sport Mode', 'Carbon Fiber', 'Track Ready', 'PDK Transmission'],
    owners: [
      Owner(
        id: '5',
        name: 'James Wilson',
        ownership: 0.34,
        schedules: [
          Schedule(
            startDate: DateTime.now().subtract(const Duration(days: 5)),
            endDate: DateTime.now().add(const Duration(days: 5)),
            status: 'current',
          ),
        ],
      ),
      Owner(
        id: '6',
        name: 'Michael Chen',
        ownership: 0.33,
        schedules: [
          Schedule(
            startDate: DateTime.now().add(const Duration(days: 6)),
            endDate: DateTime.now().add(const Duration(days: 16)),
            status: 'upcoming',
          ),
        ],
      ),
      Owner(
        id: '7',
        name: 'Ali Hassan',
        ownership: 0.33,
        schedules: [
          Schedule(
            startDate: DateTime.now().add(const Duration(days: 17)),
            endDate: DateTime.now().add(const Duration(days: 27)),
            status: 'upcoming',
          ),
        ],
      ),
    ],
    rules: [
      'Professional driver required for track days',
      'Regular maintenance schedule must be followed',
      'No smoking in the car',
      'Fuel premium grade only',
      'Maximum 2,000 km per month',
    ],
    specifications: {
      'Engine': '4.0L Flat-6',
      'Power': '503 HP',
      '0-100': '3.4 sec',
      'Top Speed': '318 km/h',
      'Weight': '1,435 kg',
    },
    currentSchedule: Schedule(
      startDate: DateTime.now().subtract(const Duration(days: 5)),
      endDate: DateTime.now().add(const Duration(days: 5)),
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
        id: '11',
        name: 'Mohammed Al Rashid',
        ownership: 0.20,
        schedules: [
          Schedule(
            startDate: DateTime.now().subtract(const Duration(days: 15)),
            endDate: DateTime.now().add(const Duration(days: 15)),
            status: 'current',
            isExtensionRequested: true,
          ),
        ],
      ),
      Owner(
        id: '12',
        name: 'Emily Chen',
        ownership: 0.20,
        schedules: [
          Schedule(
            startDate: DateTime.now().add(const Duration(days: 16)),
            endDate: DateTime.now().add(const Duration(days: 45)),
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
      'No pets allowed',
      'Life jackets must be worn during water activities',
    ],
    specifications: {
      'Length': '85 ft',
      'Cabins': '4',
      'Capacity': '12',
      'Crew': '4',
      'Speed': '25 knots',
      'Range': '400 nm',
    },
    currentSchedule: Schedule(
      startDate: DateTime.now().subtract(const Duration(days: 15)),
      endDate: DateTime.now().add(const Duration(days: 15)),
      status: 'current',
    ),
  ),
  Asset(
    id: '5',
    name: 'Private Jet Share',
    type: 'aircraft',
    location: 'Al Maktoum International',
    image: 'assets/images/jet1.jpg',
    price: 15000000,
    ownersCount: 10,
    sharePrice: 1500000,
    description: 'Citation X+ with worldwide access',
    features: [
      'Global Access',
      'Dedicated Crew',
      'Flexible Schedule',
      'Catering'
    ],
    owners: [
      Owner(
        id: '13',
        name: 'Royal Group',
        ownership: 0.30,
        schedules: [
          Schedule(
            startDate: DateTime.now(),
            endDate: DateTime.now().add(const Duration(days: 30)),
            status: 'current',
          ),
        ],
      ),
      Owner(
        id: '14',
        name: 'Elite Aviation LLC',
        ownership: 0.20,
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
      'Minimum 48-hour notice required',
      'Maximum 8 passengers',
      'Pets must be pre-approved',
      'Smoking not allowed',
      'Catering requests 24 hours in advance',
    ],
    specifications: {
      'Model': 'Citation X+',
      'Range': '3,700 nm',
      'Speed': 'Mach 0.935',
      'Passengers': '8',
      'Crew': '2',
      'Year': '2020',
    },
    currentSchedule: Schedule(
      startDate: DateTime.now(),
      endDate: DateTime.now().add(const Duration(days: 30)),
      status: 'current',
    ),
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
