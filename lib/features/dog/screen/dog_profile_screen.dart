import 'package:dog_friends/features/dog/provider_dogs/dog_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared_errors/error_message_required.dart';
import '../../../shared_helpers/date_helpers.dart';
import '../../../shared_provider/theme_mode_notifier.dart';
import '../dog_model/dog_model.dart';

enum Gender { male, female }

class DogProfileScreen extends ConsumerStatefulWidget {
  final bool isNewDog;
  final int? id;

  const DogProfileScreen({super.key, this.isNewDog = true, this.id});

  @override
  ConsumerState<DogProfileScreen> createState() => _DogProfileScreenState();
}

class _DogProfileScreenState extends ConsumerState<DogProfileScreen> {
  late DogModel dog;

  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;
  Gender _selectedGender = Gender.female;

  String dogAge = countAge(null);

  @override
  void initState() {
    super.initState();
    getDogById();
    setDogsAge();
  }

  void _changeThemeMode() {
    ref.read(themeNotifierProvider.notifier).changeThemeMode();
  }

  void setDogsAge() {
    if (!widget.isNewDog) {
      final date = DateTime.tryParse(dog.birthDate)!;
      dogAge = countAge(date);
    }
  }

  void getDogById() {
    //todo: remove mock image/data when back will be ready
    if (widget.isNewDog) {
      dog = DogModel(image: mockImageUrl);
    } else {
      dog = ref.read(dogsNotifierProvider.notifier).getDogById(widget.id!);
    }
  }

  void _saveDogName(String? value) {
    if (value != null) {
      dog.name = value;
    }
  }

  void _saveDogBreed(String? value) {
    if (value != null) {
      dog.breed = value;
    }
  }

  void _saveDogFeatures(String? value) {
    dog.dogFeatures = value!;
  }

  void dropdownCallback(selectedValue) {
    setState(() {
      _selectedGender = selectedValue;
      dog.gender = selectedValue.toString().split(".").last;
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
      dog.birthDate = date.toIso8601String();
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
      ref.read(dogsNotifierProvider.notifier).editDog(dog);
      Navigator.of(context).pop();
    }
  }

  void createNewDog() async {
    final isValid = validateAndSaveFormValues();

    if (isValid) {
      ref.read(dogsNotifierProvider.notifier).createDog(dog);
      Navigator.of(context).pop();
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
            onPressed: () => _changeThemeMode(),
            icon: const Icon(
              Icons.dark_mode,
              size: 30,
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
                  tag: "avatar-${dog.id}",
                  child: Image.network(
                    dog.image,
                    height: 380,
                    width: 350,
                    alignment: Alignment.topLeft,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Name"),
                  initialValue: dog.name,
                  onSaved: _saveDogName,
                  validator: _validate,
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Breed"),
                  initialValue: dog.breed,
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
                  initialValue: dog.dogFeatures,
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
