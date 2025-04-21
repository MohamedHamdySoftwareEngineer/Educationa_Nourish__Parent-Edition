import 'package:educational_nourish/Parent/core/utils/api_service.dart';
import 'package:educational_nourish/Parent/features/Bus%20Screen/bloc/bus_bloc.dart';
import 'package:educational_nourish/Parent/features/Bus%20Screen/presentation/views/widgets/bus_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bus_event.dart';

class BusScreen extends StatelessWidget {
  const BusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BusBloc(apiService: ApiService(  ))..add(FetchBuses()),
      child: const Scaffold(
        body: BusScreenBody(),
      ),
    );
  }
}
