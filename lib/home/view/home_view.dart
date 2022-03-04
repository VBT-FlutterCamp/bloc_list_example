import 'package:bloc_example_list/home/service/home_dio_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';

import '../../core/constans/string_contants.dart';
import '../viewmodel/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(homeService: HomeService(Dio(BaseOptions(baseUrl: StirngConstants.baseUrl)))),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: context.read<HomeCubit>().isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      SizedBox(
                        height: context.dynamicHeight(0.2),
                        child: Lottie.asset('assets/lottie/cycle.json'),
                      ),
                      SizedBox(
                        height: context.dynamicHeight(0.6),
                        child: GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemCount: context.read<HomeCubit>().model?.data?.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              elevation: 10,
                              child: Column(
                                children: [
                                  Text(context.read<HomeCubit>().model?.data?[index].firstName ?? ''),
                                  Text(context.read<HomeCubit>().model?.data?[index].lastName ?? ''),
                                  Image(
                                      fit: BoxFit.scaleDown,
                                      image: NetworkImage(context.read<HomeCubit>().model?.data?[index].avatar ?? ''))
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
