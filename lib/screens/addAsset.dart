import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vively/providers/authProvider.dart';
import 'package:vively/screens/login.dart';
import 'package:vively/services/colors.dart';
import 'package:vively/services/fonts.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:vively/services/sizeConfig.dart';
import 'package:vively/widgets/button.dart';
import 'package:vively/utils/flushbar_helper.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class AddAssetScreen extends StatefulWidget {
  const AddAssetScreen({super.key});

  @override
  State<AddAssetScreen> createState() => _AddAssetScreenState();
}

class _AddAssetScreenState extends State<AddAssetScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _locationController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();
  String _selectedType = 'homes';
  final List<String> _features = [];
  bool _isUploading = false;
  File? _selectedImage;
  bool _isImageUploading = false;
  final ImagePicker _picker = ImagePicker();

  final List<String> _assetTypes = ['homes', 'cars', 'yachts', 'offices'];
  final Map<String, List<String>> _typeFeatures = {
    'homes': [
      'Private Pool',
      'Beach Access',
      'Smart Home',
      'Furnished',
      'Garden',
      'Gym',
      'Parking',
      'Security'
    ],
    'cars': [
      'Sport Mode',
      'Carbon Fiber',
      'Track Ready',
      'PDK Transmission',
      'Hybrid',
      'Convertible',
      'Premium Sound',
      'Track Package'
    ],
    'yachts': [
      'Crew Included',
      'Full Kitchen',
      'Multiple Cabins',
      'Jet Skis',
      'Diving Equipment',
      'WiFi',
      'Entertainment System',
      'Stabilizers'
    ],
    'offices': [
      'Meeting Rooms',
      '24/7 Access',
      'Parking',
      'Reception Service',
      'High Speed Internet',
      'Kitchen',
      'Storage',
      'Mail Service'
    ],
  };

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(source: source);
      if (image == null) return;

      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: image.path,
        aspectRatio: const CropAspectRatio(ratioX: 16, ratioY: 9),
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'addAsset.cropImage'.tr(),
            toolbarColor: AppColors.blue,
            toolbarWidgetColor: AppColors.white,
            initAspectRatio: CropAspectRatioPreset.ratio16x9,
            lockAspectRatio: true,
          ),
          IOSUiSettings(
            title: 'addAsset.cropImage'.tr(),
            aspectRatioLockEnabled: true,
            resetAspectRatioEnabled: false,
          ),
        ],
      );

      if (croppedFile != null) {
        setState(() {
          _selectedImage = File(croppedFile.path);
          _simulateImageUpload();
        });
      }
    } catch (e) {
      FlushbarHelper.showError(
        context: context,
        message: 'errors.imagePickFailed'.tr(),
      );
    }
  }

  Future<void> _simulateImageUpload() async {
    setState(() => _isImageUploading = true);
    await Future.delayed(const Duration(seconds: 2));
    setState(() => _isImageUploading = false);
    FlushbarHelper.showSuccess(
      context: context,
      message: 'addAsset.imageUploaded'.tr(),
    );
  }

  void _showImageSourceDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('addAsset.selectSource'.tr()),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_rounded),
              title: Text('addAsset.camera'.tr()),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library_rounded),
              title: Text('addAsset.gallery'.tr()),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageUpload() {
    return GestureDetector(
      onTap: _showImageSourceDialog,
      child: Container(
        height: propHeight(200),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.black.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(propWidth(15)),
        ),
        child: _isImageUploading
            ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircularProgressIndicator(
                      color: AppColors.blue,
                    ),
                    SizedBox(height: propHeight(10)),
                    Text(
                      'addAsset.uploading'.tr(),
                      style: Fonts.bodyText2(context),
                    ),
                  ],
                ),
              )
            : _selectedImage != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(propWidth(15)),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.file(
                          _selectedImage!,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          right: propWidth(10),
                          top: propWidth(10),
                          child: IconButton(
                            icon: const Icon(
                              Icons.edit_rounded,
                              color: AppColors.white,
                            ),
                            onPressed: _showImageSourceDialog,
                            style: IconButton.styleFrom(
                              backgroundColor: AppColors.blue.withOpacity(0.7),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_photo_alternate_rounded,
                        size: propWidth(40),
                        color: AppColors.black.withOpacity(0.5),
                      ),
                      SizedBox(height: propHeight(10)),
                      Text(
                        'addAsset.uploadImage'.tr(),
                        style: Fonts.bodyText2(context),
                      ),
                    ],
                  ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isArabic = context.locale == const Locale('ar');

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.white,
        title: Image.asset(
          isArabic ? 'assets/images/arName.png' : 'assets/images/enName.png',
          width: isArabic ? propWidth(100) : propWidth(90),
          height: isArabic ? propHeight(30) : propHeight(25),
          fit: isArabic ? BoxFit.fitHeight : BoxFit.fitHeight,
          color: AppColors.teal,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined,
                color: AppColors.black),
            onPressed: () {
              // Handle notifications
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout_rounded, color: AppColors.black),
            onPressed: () {
              context.read<AuthProvider>().logout();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(propWidth(20)),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'nav.addAsset'.tr(),
                  style: Fonts.headline1(context),
                ),
                SizedBox(height: propHeight(30)),

                // Asset Image Upload
                _buildImageUpload(),
                SizedBox(height: propHeight(20)),

                // Asset Type Selection
                Text(
                  'addAsset.type'.tr(),
                  style: Fonts.subtitle1(context),
                ),
                SizedBox(height: propHeight(10)),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _assetTypes.map((type) {
                      bool isSelected = type == _selectedType;
                      return Padding(
                        padding: EdgeInsets.only(right: propWidth(10)),
                        child: FilterChip(
                          selected: isSelected,
                          label: Text(
                            'home.filters.$type'.tr(),
                            style: Fonts.chipText(context, isSelected),
                          ),
                          onSelected: (bool selected) {
                            setState(() {
                              _selectedType = type;
                              _features.clear();
                            });
                          },
                          backgroundColor:
                              isSelected ? AppColors.blue : AppColors.white,
                          selectedColor: AppColors.blue,
                          checkmarkColor: AppColors.white,
                          side: BorderSide(
                            color: isSelected
                                ? AppColors.blue
                                : AppColors.black.withOpacity(0.2),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: propHeight(20)),

                // Asset Details Form
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'addAsset.name'.tr(),
                    hintText: 'addAsset.nameHint'.tr(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'errors.requiredField'.tr();
                    }
                    return null;
                  },
                ),
                SizedBox(height: propHeight(15)),

                TextFormField(
                  controller: _locationController,
                  decoration: InputDecoration(
                    labelText: 'addAsset.location'.tr(),
                    hintText: 'addAsset.locationHint'.tr(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'errors.requiredField'.tr();
                    }
                    return null;
                  },
                ),
                SizedBox(height: propHeight(15)),

                TextFormField(
                  controller: _priceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'addAsset.price'.tr(),
                    hintText: 'addAsset.priceHint'.tr(),
                    suffixText: 'AED',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'errors.requiredField'.tr();
                    }
                    if (double.tryParse(value) == null) {
                      return 'errors.invalidNumber'.tr();
                    }
                    final price = double.parse(value);
                    if (price <= 0) {
                      return 'errors.invalidPrice'.tr();
                    }
                    if (price > 1000000000) {
                      // 1 billion AED limit
                      return 'errors.priceTooHigh'.tr();
                    }
                    return null;
                  },
                ),
                SizedBox(height: propHeight(15)),

                TextFormField(
                  controller: _descriptionController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: 'addAsset.description'.tr(),
                    hintText: 'addAsset.descriptionHint'.tr(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'errors.requiredField'.tr();
                    }
                    return null;
                  },
                ),
                SizedBox(height: propHeight(20)),

                // Features Selection
                Text(
                  'addAsset.features'.tr(),
                  style: Fonts.subtitle1(context),
                ),
                SizedBox(height: propHeight(10)),
                Wrap(
                  spacing: propWidth(10),
                  runSpacing: propHeight(10),
                  children: _typeFeatures[_selectedType]!.map((feature) {
                    bool isSelected = _features.contains(feature);
                    return FilterChip(
                      selected: isSelected,
                      label: Text(
                        feature,
                        style: Fonts.chipText(context, isSelected),
                      ),
                      onSelected: (bool selected) {
                        setState(() {
                          if (selected) {
                            _features.add(feature);
                          } else {
                            _features.remove(feature);
                          }
                        });
                      },
                      backgroundColor:
                          isSelected ? AppColors.blue : AppColors.white,
                      selectedColor: AppColors.blue,
                      checkmarkColor: AppColors.white,
                      side: BorderSide(
                        color: isSelected
                            ? AppColors.blue
                            : AppColors.black.withOpacity(0.2),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: propHeight(30)),

                // Submit Button
                Center(
                  child: CustomButton(
                    text: _isUploading
                        ? 'addAsset.submitting'.tr()
                        : 'addAsset.submit'.tr(),
                    w: double.infinity,
                    h: propHeight(50),
                    onPressed: () =>
                        _isUploading ? null : () => _handleSubmit(),
                    gradient: const LinearGradient(
                      colors: [AppColors.blue, AppColors.mint],
                      transform: GradientRotation(90),
                    ),
                  ),
                ),
                SizedBox(height: propHeight(20)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      if (_features.isEmpty) {
        FlushbarHelper.showError(
          context: context,
          message: 'errors.noFeatures'.tr(),
        );
        return;
      }

      setState(() => _isUploading = true);

      // Simulate API call
      Future.delayed(const Duration(seconds: 2), () {
        setState(() => _isUploading = false);
        FlushbarHelper.showSuccess(
          context: context,
          message: 'addAsset.success'.tr(),
        );
        Navigator.pop(context);
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
