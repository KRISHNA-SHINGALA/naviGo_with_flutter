import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'a_map_view.dart'; // Map view import

class AdminCreateTrip extends StatefulWidget {
  const AdminCreateTrip({super.key});

  @override
  State<AdminCreateTrip> createState() => _AdminCreateTripState();
}

class _AdminCreateTripState extends State<AdminCreateTrip> {
  // Image picker tools
  final ImagePicker _imagePicker = ImagePicker();
  Uint8List? _selectedImage;

  // Function to pick image from gallery
  Future<void> _changePhoto() async {
    try {
      final XFile? image = await _imagePicker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        final Uint8List imageBytes = await image.readAsBytes();
        setState(() {
          _selectedImage = imageBytes;
        });
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Trip Details', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text Fields for Trip Details
            _buildSimpleTextField('Trip Title', 'e.g. Alpine Grand Tour 2024'),
            const SizedBox(height: 10),
            _buildSimpleTextField('Origin City', 'Starting point'),
            const SizedBox(height: 10),
            _buildSimpleTextField('Destination City', 'Target destination'),
            const SizedBox(height: 10),
            
            // Start and End Date row
            Row(
              children: [
                Expanded(child: _buildSimpleTextField('Start Date', 'mm/dd/yyyy')),
                const SizedBox(width: 10),
                Expanded(child: _buildSimpleTextField('End Date', 'mm/dd/yyyy')),
              ],
            ),
            const SizedBox(height: 10),
            _buildSimpleTextField('Bus Type', 'Luxury Coach'),
            const SizedBox(height: 10),
            
            // Seats and Price row
            Row(
              children: [
                Expanded(child: _buildSimpleTextField('Total Seats', '0')),
                const SizedBox(width: 10),
                Expanded(child: _buildSimpleTextField('Price per Seat', '₹0.00')),
              ],
            ),
            const SizedBox(height: 20),

            // Image Preview Box
            const Text('Trip Cover Preview', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: _selectedImage != null
                  ? Image.memory(_selectedImage!, fit: BoxFit.cover)
                  : const Center(child: Text('No photo selected')),
            ),
            const SizedBox(height: 10),

            // Change Photo Button
            OutlinedButton.icon(
              onPressed: _changePhoto,
              icon: const Icon(Icons.image),
              label: const Text('Change Photo'),
            ),
            const SizedBox(height: 30),

            // Next Button to go to Map Route
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to Map View Page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AdminMapView()),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade800),
                child: const Text('Next: Map Route', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Simple method to create text inputs
  Widget _buildSimpleTextField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.grey.shade100,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}