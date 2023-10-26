import 'package:dog_friends/features/user/service/dogs_api.dart';
import 'package:flutter/material.dart';

import '../../../shared_const/error_message_required.dart';
import '../../../shared_helpers/date_helpers.dart';
import '../dog_model/dog_model.dart';

enum Gender { male, female }

class DogProfileScreen extends StatefulWidget {
  final DogModel dog;
  final bool isNewDog;

  const DogProfileScreen({
    super.key,
    required this.dog,
    this.isNewDog = false,
  });

  @override
  State<DogProfileScreen> createState() => _DogProfileScreenState();
}

class _DogProfileScreenState extends State<DogProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final dogApi = DogApi();
  DateTime? _selectedDate;
  Gender _selectedGender = Gender.female;

  String dogAge = countAge(null);

  @override
  void initState() {
    super.initState();
    setDogsAge();
  }

  void setDogsAge() {
    if (!widget.isNewDog) {
      final date = DateTime.tryParse(widget.dog.birthDate)!;
      dogAge = countAge(date);
    }
  }

  void editPage() {}

  void _saveDogName(String? value) {
    widget.dog.name = value!;
  }

  void _saveDogBreed(String? value) {
    widget.dog.breed = value!;
  }

  void _saveDogFeatures(String? value) {
    widget.dog.dogFeatures = value!;
  }

  void dropdownCallback(selectedValue) {
    setState(() {
      _selectedGender = selectedValue;
      widget.dog.gender = selectedValue.toString().split(".").last;
    });
  }

  String? _validate(String? value) {
    if (value == null || value.isEmpty) {
      return errorMessageRequired;
    }

    return null;
  }

  void getDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010, 8),
      lastDate: DateTime.now(),
    );

    if (date == null) {
      return;
    }

    setState(() {
      _selectedDate = date;
      setState(() {
        dogAge = countAge(_selectedDate);
      });
      widget.dog.birthDate = date.toIso8601String();
    });
  }

  void submitForm() {
    if (widget.isNewDog) {
      createNewDog();
    } else {
      updateDog();
    }
  }

  void updateDog() {
    final isValid = validateAndSaveFormValues();

    if (isValid) {
      dogApi.editDog(widget.dog);
    }
  }

  void createNewDog() async {
    final isValid = validateAndSaveFormValues();

    if (isValid) {
      await dogApi.createDog(widget.dog);
      if (context.mounted) {
        Navigator.of(context).pop(widget.dog);
      }
    }
  }

  bool validateAndSaveFormValues() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
    }

    return isValid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: editPage,
            icon: const Icon(
              Icons.pets,
              size: 45,
              color: Color(0xCE06284E),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: "avatar-${widget.dog.id}",
                  child: Image.network(
                    widget.dog.image,
                    height: 380,
                    width: 350,
                    alignment: Alignment.topLeft,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Name"),
                  initialValue: widget.dog.name,
                  onSaved: _saveDogName,
                  validator: _validate,
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Breed"),
                  initialValue: widget.dog.breed,
                  onSaved: _saveDogBreed,
                  validator: _validate,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(dogAge),
                    TextButton(
                      child: const Text("Set date of born"),
                      onPressed: () => getDate(context),
                    )
                  ],
                ),
                DropdownButton(
                  value: _selectedGender,
                  items: const [
                    DropdownMenuItem(
                      value: Gender.male,
                      child: Text("Male"),
                    ),
                    DropdownMenuItem(
                      value: Gender.female,
                      child: Text("Female"),
                    )
                  ],
                  onChanged: dropdownCallback,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: "Dog's features"),
                  initialValue: widget.dog.dogFeatures,
                  onSaved: _saveDogFeatures,
                  validator: _validate,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: submitForm,
                  child: const Text("Save"),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
