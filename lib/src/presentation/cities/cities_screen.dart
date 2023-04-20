import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:weather/src/core/colors.dart';
import 'package:weather/src/core/dependency_injection.dart';
import 'package:weather/src/core/dimensions.dart';
import 'package:weather/src/core/text_styles.dart';
import 'package:weather/src/domain/cubits/cities_cubit/cities_cubit.dart';
import 'package:weather/src/domain/cubits/cities_cubit/cities_cubit_state.dart';
import 'package:weather/src/presentation/components/city_list_item.dart';

class CitiesScreen extends StatefulWidget {
  const CitiesScreen({Key? key}) : super(key: key);

  @override
  State<CitiesScreen> createState() => _CitiesScreenState();
}

class _CitiesScreenState extends State<CitiesScreen> {
  late CitiesCubit citiesCubit;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    citiesCubit = getIt<CitiesCubit>();
    citiesCubit.getCities();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
          Dimensions.regular,
          40,
          Dimensions.regular,
          Dimensions.regular,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'My Cities',
              style: title,
            ),
            const SizedBox(height: Dimensions.regular),
            TextField(
              controller: _searchController,
              style: text.copyWith(color: WeatherColors.active),
              decoration: InputDecoration(
                labelText: 'Search for a city',
                labelStyle: text,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimensions.small),
                ),
                filled: true,
                fillColor: WeatherColors.foreground,
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: WeatherColors.active,
                  ),
                  onPressed: () {
                    // Perform search and add the city
                    citiesCubit.addCity(_searchController.text);
                    _searchController.clear();
                  },
                ),
              ),
            ),
            const SizedBox(height: Dimensions.regular * 2),
            Expanded(
              child: BlocBuilder<CitiesCubit, CitiesCubitState>(
                bloc: citiesCubit,
                builder: (context, state) => state.maybeWhen(
                  set: (cities) => ListView.separated(
                    padding: EdgeInsets.zero,
                    itemCount: cities.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: Dimensions.regular,
                    ),
                    itemBuilder: (context, index) => Slidable(
                      key: UniqueKey(),
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              citiesCubit
                                  .removeCity(cities[index].location.name);
                            },
                            backgroundColor: const Color(0xFFF85C43),
                            foregroundColor: Colors.white,
                            icon: Icons.close,
                            borderRadius:
                                BorderRadius.circular(Dimensions.small),
                            spacing: Dimensions.small,
                            label: 'Delete',
                          ),
                        ],
                      ),
                      child: CityListItem(
                        weatherResponse: cities.elementAt(index),
                      ),
                    ),
                  ),
                  error: (message) => Center(
                    child: Text(
                      message,
                      style: title.copyWith(color: Colors.red),
                    ),
                  ),
                  orElse: () =>
                      const Center(child: CircularProgressIndicator()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
