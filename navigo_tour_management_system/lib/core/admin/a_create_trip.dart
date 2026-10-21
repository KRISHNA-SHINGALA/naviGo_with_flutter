
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:navigo_tour_management_system/core/admin/admin_top_bar.dart';

import 'a_map_view.dart';

class AdminCreateTrip extends StatefulWidget {
  const AdminCreateTrip({super.key});

  @override
  State<AdminCreateTrip> createState() => _AdminCreateTripState();
}

class _AdminCreateTripState extends State<AdminCreateTrip> {
  static const Color primaryBlue = Color(0xFF0056D2);
  static const Color fieldBlue = Color(0xFFDCEEFF);

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController =
      TextEditingController();

  final TextEditingController _originController =
      TextEditingController();

  final TextEditingController _destinationController =
      TextEditingController();

  final TextEditingController _startDateController =
      TextEditingController();

  final TextEditingController _endDateController =
      TextEditingController();

  final TextEditingController _seatsController =
      TextEditingController();

  final TextEditingController _priceController =
      TextEditingController();

  final ImagePicker _imagePicker = ImagePicker();

  Uint8List? _selectedImage;
  String _selectedBusType = 'Luxury Coach';

  final List<String> _busTypes = [
    'Luxury Coach',
    'AC Sleeper',
    'Non-AC Sleeper',
    'Mini Bus',
    'Tempo Traveller',
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _originController.dispose();
    _destinationController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    _seatsController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  // Open the date picker and update the selected date.
  Future<void> _selectDate(
    TextEditingController controller,
  ) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: primaryBlue,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        controller.text =
            '${pickedDate.month.toString().padLeft(2, '0')}/'
            '${pickedDate.day.toString().padLeft(2, '0')}/'
            '${pickedDate.year}';
      });
    }
  }

  // Select a trip cover image from the gallery.
  Future<void> _changePhoto() async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );

      if (image != null) {
        final Uint8List imageBytes = await image.readAsBytes();

        if (!mounted) return;

        setState(() {
          _selectedImage = imageBytes;
        });
      }
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Unable to select image. Please try again.'),
        ),
      );
    }
  }

  // Validate trip information before opening the map screen.
  void _openMapRoute() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final int? totalSeats = int.tryParse(_seatsController.text.trim());
    final double? price = double.tryParse(_priceController.text.trim());

    if (totalSeats == null || totalSeats <= 0) {
      _showMessage('Enter a valid number of seats.');
      return;
    }

    if (price == null || price < 0) {
      _showMessage('Enter a valid price per seat.');
      return;
    }

    final DateTime? startDate = _parseDate(_startDateController.text);
    final DateTime? endDate = _parseDate(_endDateController.text);

    if (startDate == null || endDate == null) {
      _showMessage('Please select valid trip dates.');
      return;
    }

    if (endDate.isBefore(startDate)) {
      _showMessage('End date cannot be before the start date.');
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AdminMapView(
          tripTitle: _titleController.text.trim(),
          originCity: _originController.text.trim(),
          destinationCity: _destinationController.text.trim(),
          startDate: _startDateController.text.trim(),
          endDate: _endDateController.text.trim(),
          busType: _selectedBusType,
          totalSeats: totalSeats,
          pricePerSeat: price,
          coverImage: _selectedImage,
        ),
      ),
    );
  }

  // Convert the displayed date into a DateTime value.
  DateTime? _parseDate(String value) {
    try {
      final parts = value.split('/');
      if (parts.length != 3) return null;

      return DateTime(
        int.parse(parts[2]),
        int.parse(parts[0]),
        int.parse(parts[1]),
      );
    } catch (_) {
      return null;
    }
  }

  // Display a message to the user.
  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
appBar: PreferredSize(
  preferredSize: const Size.fromHeight(66),
  child: const SafeArea(
    bottom: false,
    child: AdminTopBar(),
  ),
),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 22, 16, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Trip Details',
                  style: TextStyle(
                    color: primaryBlue,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                _buildTextField(
                  label: 'Trip Title',
                  hint: 'e.g. Alpine Grand Tour 2026',
                  controller: _titleController,
                  icon: Icons.stars_outlined,
                ),

                const SizedBox(height: 14),

                _buildTextField(
                  label: 'Origin City',
                  hint: 'Starting point',
                  controller: _originController,
                  icon: Icons.location_on_outlined,
                ),

                const SizedBox(height: 14),

                _buildTextField(
                  label: 'Destination City',
                  hint: 'Target destination',
                  controller: _destinationController,
                  icon: Icons.my_location_outlined,
                ),

                const SizedBox(height: 14),

                // Start and end date fields.
                Row(
                  children: [
                    Expanded(
                      child: _buildDateField(
                        label: 'Start Date',
                        controller: _startDateController,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _buildDateField(
                        label: 'End Date',
                        controller: _endDateController,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 14),

                // Bus type selection.
                const Text(
                  'Bus Type',
                  style: TextStyle(fontSize: 13, color: Colors.black87),
                ),
                const SizedBox(height: 6),

                Container(
                  height: 48,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: fieldBlue,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _selectedBusType,
                      isExpanded: true,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: _busTypes.map((type) {
                        return DropdownMenuItem<String>(
                          value: type,
                          child: Row(
                            children: [
                              const Icon(
                                Icons.directions_bus_outlined,
                                size: 20,
                              ),
                              const SizedBox(width: 10),
                              Text(type),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            _selectedBusType = value;
                          });
                        }
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 14),

                // Total seats and price per seat.
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _buildTextField(
                        label: 'Total Seats',
                        hint: '40',
                        controller: _seatsController,
                        icon: Icons.event_seat_outlined,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          final seats = int.tryParse(value?.trim() ?? '');

                          if (seats == null || seats <= 0) {
                            return 'Enter valid seats';
                          }

                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _buildTextField(
                        label: 'Price per Seat',
                        hint: '₹0.00',
                        controller: _priceController,
                        icon: Icons.payments_outlined,
                        keyboardType:
                            const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        validator: (value) {
                          final price =
                              double.tryParse(value?.trim() ?? '');

                          if (price == null || price < 0) {
                            return 'Enter valid price';
                          }

                          return null;
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 22),

                const Text(
                  'Trip Cover Preview',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                // Display the selected cover image or a placeholder.
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Container(
                    width: double.infinity,
                    height: 165,
                    color: fieldBlue,
                    child: _selectedImage != null
                        ? Image.memory(
                            _selectedImage!,
                            fit: BoxFit.cover,
                          )
                        : Stack(
                            fit: StackFit.expand,
                            children: [
                              const Icon(
                                Icons.directions_bus_filled_outlined,
                                size: 65,
                                color: primaryBlue,
                              ),
                              Positioned(
                                bottom: 12,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: Text(
                                    'Add a trip cover photo',
                                    style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ),
                ),

                const SizedBox(height: 10),

                Center(
                  child: OutlinedButton.icon(
                    onPressed: _changePhoto,
                    icon: const Icon(Icons.edit_outlined, size: 18),
                    label: const Text('Change Photo'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: primaryBlue,
                      side: const BorderSide(color: primaryBlue),
                    ),
                  ),
                ),

                const SizedBox(height: 22),

                // Continue to route planning.
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _openMapRoute,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3025F5),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Next: Map Route',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.arrow_forward, size: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Build a validated text input field.
  Widget _buildTextField({
    required String label,
    required String hint,
    required TextEditingController controller,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          validator: validator ??
              (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Required';
                }

                return null;
              },
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 12,
            ),
            prefixIcon: Icon(icon, size: 19, color: Colors.black87),
            filled: true,
            fillColor: fieldBlue,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: const BorderSide(color: primaryBlue),
            ),
            errorMaxLines: 2,
          ),
        ),
      ],
    );
  }

  // Build a date input field with a calendar picker.
  Widget _buildDateField({
    required String label,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 13, color: Colors.black87),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          readOnly: true,
          onTap: () => _selectDate(controller),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Select date';
            }

            if (_parseDate(value) == null) {
              return 'Invalid date';
            }

            return null;
          },
          decoration: InputDecoration(
            hintText: 'mm/dd/yyyy',
            hintStyle: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 11,
            ),
            suffixIcon: const Icon(
              Icons.calendar_month_outlined,
              size: 19,
            ),
            filled: true,
            fillColor: fieldBlue,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: const BorderSide(color: primaryBlue),
            ),
          ),
        ),
      ],
    );
  }
}