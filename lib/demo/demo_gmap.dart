import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:smartq/blocs/org_bloc.dart';
import 'package:smartq/model/organisation.dart';

class MapSample extends StatefulWidget {
  final markerIcon;

  MapSample({this.markerIcon});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  List<Marker> _markers;

  OrgBloc orgBloc;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(3.343799, 101.449480),
    zoom: 6,
  );

  static final CameraPosition _kLake = CameraPosition(
      // bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      // tilt: 59.440717697143555,
      zoom: 14.4746);

  BitmapDescriptor pinLocationIcon;

  Location location = new Location();

  bool _serviceEnabled = false;
  PermissionStatus _permissionGranted;
  // LocationData _locationData;

  @override
  void initState() {
    print("initstate start...");
    orgBloc = BlocProvider.of<OrgBloc>(context);

    print("fetching api start...");
    // Fetching organisations list
    orgBloc.add(FetchOrg());

    location.serviceEnabled().then((onValue) {
      _serviceEnabled = onValue;
    });
    if (!_serviceEnabled) {
      location.requestService().then((onValue) {
        _serviceEnabled = onValue;
      });

      if (!_serviceEnabled) {
        return;
      }
    }

    location.hasPermission().then((onValue) {
      _permissionGranted = onValue;
    });
    if (_permissionGranted == PermissionStatus.denied) {
      location.requestPermission().then((onValue) {
        _permissionGranted = onValue;
      });
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    super.initState();
  }

  @override
  void dispose() {
    // _controller.complete();
    // orgBloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("inside build...");

    return new Scaffold(
      body: BlocBuilder<OrgBloc, OrgState>(
          cubit: orgBloc,
          builder: (context, state) {
            print(state);
            if (state is LoadedOrg) {
              print("im loaded...");
              _markers = List<Organisation>.from(state.organisations).map((f) {
                var addr1 = f.address1;
                var addr2 = f.address2;
                return Marker(
                    markerId: MarkerId(f.id.toString()),
                    infoWindow:
                        InfoWindow(title: f.name, snippet: "$addr1,$addr2"),
                    position: LatLng(
                        double.parse(f.latitude), double.parse(f.longitude)),
                    icon: widget.markerIcon);
              }).toList();
              return GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                markers: Set.from(_markers),
              );
            }

            return Center(
                // widthFactor: 2,
                // heightFactor: 2,
                child: Container(
                    width: MediaQuery.of(context).size.width / 4,
                    height: MediaQuery.of(context).size.width / 4,
                    // height: 150,
                    child: CircularProgressIndicator()));
          }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('To the lake!'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  static Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        .buffer
        .asUint8List();
  }
}
