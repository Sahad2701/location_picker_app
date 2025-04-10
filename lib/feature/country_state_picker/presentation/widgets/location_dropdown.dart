import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location_picker_app/core/constants/app_const.dart';
import 'package:location_picker_app/feature/country_state_picker/domain/entities/location_item.dart';
import 'package:location_picker_app/feature/country_state_picker/presentation/cubit/location_cubit.dart';
import 'package:location_picker_app/feature/country_state_picker/presentation/cubit/location_state.dart';

class LocationDropdown extends StatefulWidget {
  final String hintText;
  final LocationItem? selectedValue;
  final bool isEnabled;
  final Function(LocationItem)? onChanged;
  final bool showLoading;

  const LocationDropdown({
    super.key,
    required this.hintText,
    this.selectedValue,
    this.isEnabled = true,
    this.onChanged,
    this.showLoading = false,
  });

  @override
  State<LocationDropdown> createState() => _LocationDropdownState();
}

class _LocationDropdownState extends State<LocationDropdown> {
  final FocusNode _focusNode = FocusNode();
  final GlobalKey _dropdownKey = GlobalKey();
  OverlayEntry? _overlayEntry;

  @override
  void dispose() {
    _focusNode.dispose();
    _overlayEntry?.remove();
    super.dispose();
  }

  void _showDropdownMenu(BuildContext context, List<LocationItem> items) {
    final RenderBox renderBox =
        _dropdownKey.currentContext!.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder:
          (context) => Stack(
            children: [
              Positioned.fill(
                child: GestureDetector(
                  onTap: () {
                    _overlayEntry?.remove();
                    _overlayEntry = null;
                    _focusNode.unfocus();
                  },
                  child: Container(color: Colors.transparent),
                ),
              ),
              // Dropdown menu positioned below the widget
              Positioned(
                left: position.dx,
                top: position.dy + size.height + 2,
                width: size.width,
                child: Material(
                  elevation: 6,
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  child: Container(
                    constraints: const BoxConstraints(maxHeight: 300),
                    child: ListView(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      children:
                          items.map((item) {
                            return InkWell(
                              onTap: () {
                                widget.onChanged?.call(item);
                                _overlayEntry?.remove();
                                _overlayEntry = null;
                                _focusNode.unfocus();
                              },
                              hoverColor: Colors.grey[200],
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24.0,
                                  vertical: 12.0,
                                ),
                                child: Text(
                                  item.name,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black87,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            );
                          }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        if (widget.showLoading && state is LocationLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        List<LocationItem> items = [];
        if (widget.hintText == AppConst.selectCountry) {
          if (state is CountriesLoaded) {
            items = state.countries;
          } else if (state is StatesLoaded) {
            items = state.countries;
          }
        } else if (widget.hintText == AppConst.selectState &&
            state is StatesLoaded) {
          items = state.states;
        }

        if (items.isEmpty && !widget.showLoading) {
          return const SizedBox.shrink();
        }

        return GestureDetector(
          key: _dropdownKey,
          onTap:
              widget.isEnabled
                  ? () {
                    _focusNode.unfocus();
                    _showDropdownMenu(context, items);
                  }
                  : null,
          child: InputDecorator(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey[400]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey[400]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.blue, width: 2),
              ),
              filled: true,
              fillColor: Colors.grey[100],
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              suffixIcon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
            ),
            child: Text(
              widget.selectedValue?.name ?? widget.hintText,
              style: TextStyle(
                color:
                    widget.selectedValue != null
                        ? Colors.black87
                        : Colors.grey[600],
                fontSize: 16,
              ),
            ),
          ),
        );
      },
    );
  }
}
