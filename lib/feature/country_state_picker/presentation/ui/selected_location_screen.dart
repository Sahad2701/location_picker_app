import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location_picker_app/core/constants/app_const.dart'; // Import AppConst
import 'package:location_picker_app/feature/country_state_picker/presentation/cubit/location_cubit.dart';
import 'package:location_picker_app/feature/country_state_picker/presentation/cubit/location_state.dart';
import 'package:location_picker_app/feature/country_state_picker/presentation/widgets/location_card_widget.dart';

class SelectedLocationScreen extends StatelessWidget {
  const SelectedLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppConst.selectedLocationTitle)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<LocationCubit, LocationState>(
          builder: (context, state) {
            final cubit = context.read<LocationCubit>();
            final country = cubit.selectedCountry?.name ?? AppConst.notSelected;
            final stateName = cubit.selectedState?.name ?? AppConst.notSelected;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LocationCardWidget(title: AppConst.countryLabel, value: country),
                const SizedBox(height: 16),
                LocationCardWidget(title: AppConst.stateLabel, value: stateName),
              ],
            );
          },
        ),
      ),
    );
  }
}