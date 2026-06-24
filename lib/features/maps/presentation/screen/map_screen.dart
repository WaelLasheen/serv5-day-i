import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/core/widgets/custom_form_field.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:day_i/features/maps/presentation/map_cubit/maps_cubit.dart';
import 'package:day_i/features/maps/presentation/map_cubit/maps_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';

class MyMapScreen extends StatefulWidget {
  const MyMapScreen({super.key});

  @override
  State<MyMapScreen> createState() => _MyMapScreenState();
}

class _MyMapScreenState extends State<MyMapScreen> {
  final MapController _mapController = MapController();
  final TextEditingController _searchController = TextEditingController();
  List<Marker> _markers = [];

  @override
  void dispose() {
    _mapController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;

    return Stack(
      children: [
        // The Map
        FlutterMap(
          mapController: _mapController,
          options: const MapOptions(
            initialCenter: LatLng(30, 31), // Cairo initial center
            initialZoom: 13,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.waellasheen.day_i',
            ),
            MarkerLayer(markers: _markers),
            RichAttributionWidget(
              attributions: [
                TextSourceAttribution(
                  'OpenStreetMap contributors',
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),

        // Search floating card
        Positioned(
          top: MediaQuery.of(context).padding.top + 16.h,
          left: 16.w,
          right: 16.w,
          child: Container(
            decoration: BoxDecoration(
              color: appTheme.surfaceColor,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: appTheme.boarderPrimary),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 16.r,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomFormField(
                  controller: _searchController,
                  hintText: S.current.searchLocation,
                  prefixIcon: Icon(
                    Icons.search,
                    color: appTheme.grey700,
                    size: 24.r,
                  ),
                  suffixIcon: ValueListenableBuilder<TextEditingValue>(
                    valueListenable: _searchController,
                    builder: (context, value, child) {
                      return value.text.isNotEmpty
                          ? IconButton(
                              icon: Icon(
                                Icons.clear,
                                color: appTheme.grey700,
                                size: 20.r,
                              ),
                              onPressed: () {
                                _searchController.clear();
                                context.read<MapsCubit>().clearSearch();
                              },
                            )
                          : const SizedBox.shrink();
                    },
                  ),
                  textInputAction: TextInputAction.search,
                  onFieldSubmitted: (value) {
                    context.read<MapsCubit>().searchPlaces(value);
                  },
                ),
                BlocBuilder<MapsCubit, MapsState>(
                  builder: (context, state) {
                    if (state is MapsSearchLoading) {
                      return Padding(
                        padding: EdgeInsets.only(top: 8.h),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(2.r),
                          child: LinearProgressIndicator(
                            color: appTheme.primaryColor,
                            backgroundColor: appTheme.blueLight,
                            minHeight: 3.h,
                          ),
                        ),
                      );
                    }
                    if (state is MapsSearchSuccess) {
                      if (state.places.isEmpty) {
                        return Padding(
                          padding: EdgeInsets.only(top: 12.h),
                          child: Text(
                            'No locations found.',
                            style: context.textTheme.bodyMedium?.copyWith(
                              color: appTheme.textSecondary,
                            ),
                          ),
                        );
                      }
                      return ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: 250.h),
                        child: Container(
                          margin: EdgeInsets.only(top: 8.h),
                          child: ListView.separated(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemCount: state.places.length,
                            separatorBuilder: (context, index) => Divider(
                              color: appTheme.boarderPrimary,
                              height: 1.h,
                            ),
                            itemBuilder: (context, index) {
                              final place = state.places[index];
                              return ListTile(
                                dense: true,
                                contentPadding: EdgeInsets.zero,
                                leading: Icon(
                                  Icons.location_on_outlined,
                                  color: appTheme.primaryColor,
                                  size: 20.r,
                                ),
                                title: Text(
                                  place.displayName,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: context.textTheme.bodyMedium?.copyWith(
                                    color: appTheme.textPrimary,
                                  ),
                                ),
                                onTap: () {
                                  final latLng = LatLng(
                                    place.latitude,
                                    place.longitude,
                                  );
                                  _mapController.move(latLng, 15);
                                  setState(() {
                                    _markers = [
                                      Marker(
                                        point: latLng,
                                        width: 40.r,
                                        height: 40.r,
                                        child: Icon(
                                          Icons.location_on,
                                          color: appTheme.primaryColor,
                                          size: 40.r,
                                        ),
                                      ),
                                    ];
                                  });
                                  _searchController.text = place.displayName;
                                  context.read<MapsCubit>().clearSearch();
                                  FocusScope.of(context).unfocus();
                                },
                              );
                            },
                          ),
                        ),
                      );
                    }
                    if (state is MapsSearchFailure) {
                      return Padding(
                        padding: EdgeInsets.only(top: 12.h),
                        child: Text(
                          state.message,
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: appTheme.errorColor,
                          ),
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
