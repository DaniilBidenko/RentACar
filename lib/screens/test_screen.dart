import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rent_a_car_auto/data/rent_a_car_model.dart';
import 'package:rent_a_car_auto/blocs/bronirovanie/bronirovanie_state.dart';
import 'package:rent_a_car_auto/blocs/mainbloc/rent_a_car_bloc.dart';
import 'package:rent_a_car_auto/blocs/mainbloc/rent_a_car_state.dart';

class TestScreen extends StatefulWidget{
  TestScreen({Key? key}) : super(key: key);
  @override
  State<TestScreen> createState() => TestScreenState();
}

class TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<RentACarBloc, RentACarState>(
          builder: (context, state) {
            if (state is RentACarLoading) {
              return Center(
                child: CircularProgressIndicator()
              );
            } else if (state is RentACarLoaded) {
              return Center(
                child: CarDropdownSelector(
                  cars: state.rentACar,
                ),
              );
            } else if (state is BronirovanieError) {
              return Center(
                child: Text('Ошибка'),
              );
            } else {
              return Center(child: Text('Иди нахуй'),);
            }
          }
        )
      ),
    );
  }
}

class CarDropdownSelector extends StatefulWidget {
  final List<RentACarModel> cars;
  final String storageKey;
  final ValueChanged<String>? onChanged;

  const CarDropdownSelector({
    Key? key,
    required this.cars,
    this.storageKey = 'selected_car_id',
    this.onChanged,
  }) : super(key: key);

  @override
  State<CarDropdownSelector> createState() => _CarDropdownSelectorState();
}

class _CarDropdownSelectorState extends State<CarDropdownSelector> {
  String? _selectedId;

  @override
  void initState() {
    super.initState();
    _loadInitialSelection();
  }

  Future<void> _loadInitialSelection() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString(widget.storageKey);
    final cars = widget.cars;

    String? initialSaved;
    if (saved != null && cars.any((c) => c.id == saved)) {
      initialSaved = saved;
    }

    final String? initial = initialSaved ?? (cars.isNotEmpty ? cars.first.id : null);
    if (!mounted) return;
    setState(() {
      _selectedId = initial;
    });
  }

  Future<void> _persistSelection(String id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(widget.storageKey, id);
  }

  @override
  Widget build(BuildContext context) {
    final cars = widget.cars;
    if (cars.isEmpty) {
      return const SizedBox.shrink();
    }

    final String? value =
        (_selectedId != null && cars.any((c) => c.id == _selectedId)) ? _selectedId : null;

    final selectedCar = value != null
        ? cars.firstWhere((c) => c.id == value, orElse: () => cars.first)
        : null;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DropdownButton<String>(
          value: value,
          hint: const Text("Выбери автомобиль"),
          isExpanded: true,
          selectedItemBuilder: (context) {
            return cars.map((item) {
              return Text("${item.brand} ${item.model} [${item.id}]");
            }).toList();
          },
          items: cars.map<DropdownMenuItem<String>>((item) {
            return DropdownMenuItem<String>(
              value: item.id,
              child: Text("${item.brand} ${item.model} [${item.id}]")
            );
          }).toList(),
          onChanged: (id) async {
            if (id == null) return;
            setState(() {
              _selectedId = id;
            });
            await _persistSelection(id);
            widget.onChanged?.call(id);
          },
        ),
        if (selectedCar != null) ...[
          const SizedBox(height: 12),
          Text("Выбран: ${selectedCar.brand} ${selectedCar.model} [${selectedCar.id}]")
        ]
      ],
    );
  }
}