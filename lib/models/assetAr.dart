import 'package:vively/models/asset.dart';
import 'package:vively/models/owner.dart';

final List<Asset> myAssetsAr = [
  Asset(
    id: '1',
    isCoOwned: true,
    name: 'فيلا مارينا',
    type: 'المنازل',
    location: 'نخلة جميرا، دبي',
    image: 'assets/images/villa1.jpg',
    price: 5000000,
    ownersCount: 4,
    sharePrice: 1250000,
    description: 'فيلا فاخرة مكونة من 5 غرف نوم مع وصول خاص إلى الشاطئ',
    features: ['مسبح خاص', 'وصول إلى الشاطئ', 'منزل ذكي', 'مفروشة'],
    owners: [
      Owner(
        id: '1',
        name: 'أنت',
        ownership: 0.25,
        schedules: [
          Schedule(
            startDate: DateTime.now().add(const Duration(days: 91)),
            endDate: DateTime.now().add(const Duration(days: 120)),
            status: 'القادمة',
          ),
        ],
      ),
      Owner(
        id: '2',
        name: 'محمد القاسمي',
        ownership: 0.25,
        schedules: [
          Schedule(
            startDate: DateTime.now(),
            endDate: DateTime.now().add(const Duration(days: 30)),
            status: 'الحالية',
          ),
        ],
      ),
      Owner(
        id: '3',
        name: 'سارة المكتوم',
        ownership: 0.25,
        schedules: [
          Schedule(
            startDate: DateTime.now().add(const Duration(days: 31)),
            endDate: DateTime.now().add(const Duration(days: 60)),
            status: 'القادمة',
          ),
        ],
      ),
      Owner(
        id: '4',
        name: 'عبد الله الفلاسي',
        ownership: 0.25,
        schedules: [
          Schedule(
            startDate: DateTime.now().add(const Duration(days: 61)),
            endDate: DateTime.now().add(const Duration(days: 90)),
            status: 'القادمة',
          ),
        ],
      ),
    ],
    rules: [
      'الحد الأقصى للإقامة: 8 أشخاص',
      'لا يسمح بالحيوانات الأليفة',
      'يمنع التدخين داخل المنزل',
      'ساعات الهدوء: 10 مساءً - 8 صباحاً',
      'لا حفلات أو فعاليات بدون موافقة مسبقة',
      'ساعات المسبح: 6 صباحاً - 10 مساءً',
    ],
    specifications: {
      'الحجم': '8500 قدم مربع',
      'عدد الغرف': '5',
      'الحمامات': '6',
      'مواقف السيارات': '3 سيارات',
      'المساحة': '10000 قدم مربع',
      'سنة البناء': '2021',
    },
    currentSchedule: Schedule(
      startDate: DateTime.now(),
      endDate: DateTime.now().add(const Duration(days: 30)),
      status: 'الحالية',
    ),
  ),
  Asset(
    isCoOwned: true,
    id: '2',
    name: 'بورشه 911 GT3',
    type: 'السيارات',
    location: 'وسط مدينة دبي',
    image: 'assets/images/car1.jpg',
    price: 600000,
    ownersCount: 3,
    sharePrice: 200000,
    description: 'موديل 2023، باقة سباق',
    features: [
      'وضع السباق',
      'ألياف الكربون',
      'جاهزة للمسارات',
      'ناقل حركة PDK'
    ],
    owners: [
      Owner(
        id: '5',
        name: 'أنت',
        ownership: 0.34,
        schedules: [
          Schedule(
            startDate: DateTime.now(),
            endDate: DateTime.now().add(const Duration(days: 10)),
            status: 'الحالية',
          ),
        ],
      ),
      Owner(
        id: '6',
        name: 'راشد الحبتور',
        ownership: 0.33,
        schedules: [
          Schedule(
            startDate: DateTime.now().add(const Duration(days: 11)),
            endDate: DateTime.now().add(const Duration(days: 20)),
            status: 'القادمة',
          ),
        ],
      ),
      Owner(
        id: '7',
        name: 'عمر الفطيم',
        ownership: 0.33,
        schedules: [
          Schedule(
            startDate: DateTime.now().add(const Duration(days: 21)),
            endDate: DateTime.now().add(const Duration(days: 30)),
            status: 'القادمة',
          ),
        ],
      ),
    ],
    rules: [
      'يمنع التدخين في السيارة',
      'لا أيام مضمار دون إشعار مسبق',
      'يجب الالتزام بجدول الصيانة المنتظم',
      'الحد الأقصى 2000 كم شهريًا',
      'نوع الوقود: بنزين 98 الممتاز',
    ],
    specifications: {
      'المحرك': '4.0L Flat-6',
      'القوة': '503 حصان',
      '0-100': '3.4 ثانية',
      'السرعة القصوى': '318 كم/س',
      'الوزن': '1435 كجم',
      'السنة': '2023',
    },
    currentSchedule: Schedule(
      startDate: DateTime.now(),
      endDate: DateTime.now().add(const Duration(days: 10)),
      status: 'الحالية',
    ),
  ),
  Asset(
    id: '3',
    name: 'جناح مكتبي',
    type: 'المكاتب',
    location: 'مركز دبي المالي العالمي، دبي',
    image: 'assets/images/office1.jpg',
    price: 2000000,
    ownersCount: 4,
    sharePrice: 500000,
    description: 'مساحة مكتبية فاخرة في مركز دبي المالي العالمي',
    features: ['غرف اجتماعات', 'وصول 24/7', 'مواقف سيارات', 'خدمة استقبال'],
    owners: [
      Owner(
        id: '8',
        name: 'دبي فنتشرز ذ.م.م',
        ownership: 0.40,
        schedules: [
          Schedule(
            startDate: DateTime.now(),
            endDate: DateTime.now().add(const Duration(days: 90)),
            status: 'الحالية',
          ),
        ],
      ),
      Owner(
        id: '9',
        name: 'جلوبال تريدنج كو',
        ownership: 0.30,
        schedules: [
          Schedule(
            startDate: DateTime.now().add(const Duration(days: 91)),
            endDate: DateTime.now().add(const Duration(days: 180)),
            status: 'القادمة',
          ),
        ],
      ),
      Owner(
        id: '10',
        name: 'تك سوليوشنز ذ.م.م',
        ownership: 0.30,
        schedules: [
          Schedule(
            startDate: DateTime.now().add(const Duration(days: 181)),
            endDate: DateTime.now().add(const Duration(days: 270)),
            status: 'القادمة',
          ),
        ],
      ),
    ],
    rules: [
      'ساعات العمل: 8 صباحًا - 8 مساءً',
      'تسجيل الزوار مطلوب',
      'يجب حجز غرف الاجتماعات مسبقًا',
      'لا تعديلات دون موافقة',
      'يجب إبقاء المساحات المشتركة نظيفة',
    ],
    specifications: {
      'الحجم': '2500 قدم مربع',
      'محطات العمل': '20',
      'غرف الاجتماعات': '2',
      'أماكن الوقوف': '4',
      'الطابق': '15',
    },
    currentSchedule: Schedule(
      startDate: DateTime.now(),
      endDate: DateTime.now().add(const Duration(days: 90)),
      status: 'الحالية',
    ),
  ),
];

final List<Asset> feedAssetsAr = [
  Asset(
    id: '4',
    name: 'يخت سيرينيتي',
    type: 'اليخوت',
    location: 'مرسى دبي',
    image: 'assets/images/yacht1.jpg',
    price: 8000000,
    ownersCount: 8,
    sharePrice: 1000000,
    description: 'يخت فاخر بطول 85 قدم مع طاقم خدمة كامل',
    features: ['طاقم متوفر', 'مطبخ كامل', '4 كبائن', 'دراجات مائية'],
    owners: [
      Owner(
        id: '8',
        name: 'نادي دبي البحري',
        ownership: 0.40,
        schedules: [
          Schedule(
            startDate: DateTime.now(),
            endDate: DateTime.now().add(const Duration(days: 30)),
            status: 'الحالية',
          ),
        ],
      ),
      Owner(
        id: '9',
        name: 'أحمد الرستماني',
        ownership: 0.30,
        schedules: [
          Schedule(
            startDate: DateTime.now().add(const Duration(days: 31)),
            endDate: DateTime.now().add(const Duration(days: 60)),
            status: 'القادمة',
          ),
        ],
      ),
    ],
    rules: [
      'يتطلب طاقم محترف',
      'الحد الأقصى للركاب: 12',
      'يتطلب التأمين',
      'الحد الأدنى للحجز: 3 أيام',
      'لا يسمح بالحيوانات الأليفة دون موافقة مسبقة',
    ],
    specifications: {
      'الطول': '85 قدم',
      'الكبائن': '4',
      'السعة': '12',
      'الطاقم': '4',
      'سنة البناء': '2021',
      'السرعة': '25 عقدة',
    },
  ),
  Asset(
    id: '5',
    name: 'فيراري SF90',
    type: 'السيارات',
    location: 'سيتي ووك، دبي',
    image: 'assets/images/car2.jpg',
    price: 2000000,
    ownersCount: 4,
    sharePrice: 500000,
    description: 'سيارة رياضية هجينة مع حزمة المسار',
    features: ['1000 حصان', 'طاقة هجينة', 'حزمة كربونية', 'نظام تتبع'],
    owners: [
      Owner(
        id: '10',
        name: 'نادي دبي للسيارات الفاخرة',
        ownership: 0.50,
        schedules: [
          Schedule(
            startDate: DateTime.now(),
            endDate: DateTime.now().add(const Duration(days: 15)),
            status: 'الحالية',
          ),
        ],
      ),
    ],
    rules: [
      'للسائقين المتمرسين فقط',
      'إمكانية المشاركة في أيام المسار',
      'الصيانة الشهرية مطلوبة',
      'الحد الأقصى 1500 كم شهريًا',
      'محطة شحن متوفرة',
    ],
    specifications: {
      'المحرك': 'V8 + 3 كهربائية',
      'القوة': '1000 حصان',
      '0-100': '2.5 ثانية',
      'السرعة القصوى': '340 كم/س',
      'المدى': '25 كم (كهربائية)',
      'السنة': '2023',
    },
  ),
  Asset(
    id: '6',
    name: 'فيلا عطلات',
    type: 'المنازل',
    location: 'المالديف',
    image: 'assets/images/villa2.jpg',
    price: 4000000,
    ownersCount: 6,
    sharePrice: 666666,
    description: 'فيلا فوق الماء مع مسبح خاص',
    features: [
      'إطلالة على المحيط',
      'خدمة الخادم الشخصي',
      'دخول إلى المنتجع',
      'مسبح خاص'
    ],
    owners: [
      Owner(
        id: '15',
        name: 'ديفيد طومسون',
        ownership: 0.25,
        schedules: [
          Schedule(
            startDate: DateTime.now(),
            endDate: DateTime.now().add(const Duration(days: 60)),
            status: 'الحالية',
          ),
        ],
      ),
      Owner(
        id: '16',
        name: 'ليزا وانج',
        ownership: 0.25,
        schedules: [
          Schedule(
            startDate: DateTime.now().add(const Duration(days: 61)),
            endDate: DateTime.now().add(const Duration(days: 120)),
            status: 'القادمة',
          ),
        ],
      ),
    ],
    rules: [
      'الحد الأقصى: 6 ضيوف',
      'يمنع التدخين داخل الفيلا',
      'خدمة الخادم الشخصي متوفرة على مدار الساعة',
      'الحجز المسبق مطلوب للأنشطة',
      'موعد تسجيل الدخول: 2 ظهرًا، موعد تسجيل الخروج: 12 ظهرًا',
    ],
    specifications: {
      'الحجم': '3200 قدم مربع',
      'غرف النوم': '3',
      'الحمامات': '3',
      'المسبح': 'خاص',
      'الإطلالة': 'المحيط',
      'سنة البناء': '2022',
    },
    currentSchedule: Schedule(
      startDate: DateTime.now(),
      endDate: DateTime.now().add(const Duration(days: 60)),
      status: 'الحالية',
    ),
  ),
];
