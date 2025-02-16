import 'package:shimmer_effect/shimmer_effect.dart';
import '../../../../core/all_imports.dart';
import '../../../../core/gloabal_widgets/gloabal_widgets.dart';
import '../../../../core/global/responsive.dart';
import '../../../../core/single_tone/orders_single_tone.dart';
import '../../data/models/orders_res_model.dart';
import '../bloc/orders_bloc.dart';
import '../bloc/orders_event.dart';
import '../bloc/orders_state.dart';
import 'widgets/desktop_widget.dart';
import 'widgets/mobile_widget.dart';

class OrdersView extends StatefulWidget {
  const OrdersView({
    super.key,
  });
    static const String routeName = "OrdersView";

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      body: BlocProvider(
        create: (context) => OrdersBloc(
          getOrdersUseCase: getIt(),
        )..add(
            OrdersEvent.getOrders(),
          ),
        child: BlocBuilder<OrdersBloc, OrdersState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () {
                return Column(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 7,
                            child: ListView.builder(
                              itemCount: OrdersSingletone
                                  .instance.ordersResModel?.orders?.length ??10,
                              itemBuilder: (context, index) {
                                final order = OrdersSingletone
                                    .instance.ordersResModel?.orders?[index];
                                return Expanded(
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: height / 3,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey,
                                          ),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                        ),
                                        child: Card(
                                          semanticContainer: true,
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          child: Res.isMobile(
                                            context,
                                          )
                                              ? MobileHomeWidget(
                                                  order: order?? Order(),
                                                )
                                              : DesktopWidget(
                                                  order: order?? Order(),
                                                ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
              orderShare: () {
                return Center(
                  child: Center(
                    child: Expanded(
                      flex: 2,
                      child: Container(
                        width: width / 3,
                        height: height / 3,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(0, 158, 158, 158)),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              MyText(
                                fieldName:t.or,
                                color: Colors.black,
                                fontSize: 15,
                              ),
                              CircularProgressIndicator(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              loading: () {
                return Center(
                  child: ShimmerEffect(
                    baseColor: Colors.white,
                    highlightColor: Colors.green,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Divider(
                          thickness: 6,
                          color: Colors.red,
                        ),
                        Text(
                          'Loading...',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              failure: (e) {
                return Center(
                  child:  Text(
                         e.error??'',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 24),
                        ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class GestureDetectorWidget extends StatelessWidget {
  GestureDetectorWidget({
    super.key,
    required  this.onTap,
  });

  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green),
          borderRadius: const BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        child: const Icon(
          Icons.location_on,
          color: Colors.green,
        ),
      ),
    );
  }
}
