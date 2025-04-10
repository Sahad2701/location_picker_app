import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location_picker_app/core/constants/app_const.dart';
import 'package:location_picker_app/feature/country_state_picker/presentation/cubit/location_cubit.dart';
import 'package:location_picker_app/feature/country_state_picker/presentation/cubit/location_state.dart';
import 'package:location_picker_app/feature/country_state_picker/presentation/ui/selected_location_screen.dart';
import 'package:location_picker_app/feature/country_state_picker/presentation/widgets/location_dropdown.dart';

class LocationPickerScreen extends StatefulWidget {
  const LocationPickerScreen({super.key});

  @override
  State<LocationPickerScreen> createState() => _LocationPickerScreenState();
}

class _LocationPickerScreenState extends State<LocationPickerScreen> {
  @override
  void initState() {
    super.initState();
    context.read<LocationCubit>().loadCountries();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text(AppConst.appTitle)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: InkWell(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          child: BlocConsumer<LocationCubit, LocationState>(
            listener: (context, state) {
              if (state is LocationError) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            builder: (context, state) {
              final cubit = context.read<LocationCubit>();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LocationDropdown(
                    hintText: AppConst.selectCountry,
                    selectedValue: cubit.selectedCountry,
                    showLoading: true,
                    onChanged: (value) => cubit.updateSelectedCountry(value),
                  ),
                  const SizedBox(height: 24),
                  if (state is CountriesLoaded)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        AppConst.pleaseSelectCountry,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  if (state is StatesLoaded)
                    LocationDropdown(
                      hintText: AppConst.selectState,
                      selectedValue: cubit.selectedState,
                      onChanged: (value) => cubit.updateSelectedState(value),
                    ),
                  const SizedBox(height: 24),
                  BlocBuilder<LocationCubit, LocationState>(
                    builder: (context, state) {
                      if (state is StatesLoaded &&
                          cubit.selectedState != null) {
                        return ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => const SelectedLocationScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            AppConst.viewSelectedLocation,
                            style: TextStyle(fontSize: 16),
                          ),
                        );
                      }
                      return Offstage();
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
