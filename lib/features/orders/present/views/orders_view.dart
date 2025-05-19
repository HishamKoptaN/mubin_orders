import 'package:shimmer_effect/shimmer_effect.dart';
import '../../../../core/all_imports.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../data/models/orders_res_model.dart';
import '../bloc/orders_bloc.dart';
import '../bloc/orders_event.dart';
import '../bloc/orders_state.dart';
import 'build_shimmer_order_placeholder.dart';
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
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    context.read<OrdersBloc>().add(
          OrdersEvent.getOrders(),
        );
    _scrollController.addListener(
      _onScroll,
    );
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent) {
      print("Reached the end of the list");
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: BlocBuilder<OrdersBloc, OrdersState>(
        builder: (
          context,
          state,
        ) {
          return state.maybeWhen(
            loaded: (
              orders,
              hasMore,
              addOrderReqModel,
              uploadingProgress,
            ) {
              return ListView.builder(
                controller: _scrollController,
                itemCount: (orders?.length ?? 0) + 1,
                itemBuilder: (
                  context,
                  i,
                ) {
                  final order = orders?[1];
                  if (i < orders!.length) {
                    return Stack(
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
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: OrderWidget(
                              order: order ?? Order(),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    if (hasMore!) {
                      return OrderShimmerWidget();
                    } else if (orders.isNotEmpty && !hasMore) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'لا يوجد طلبات أخرى.',
                            style: TextStyles.bold16,
                          ),
                        ),
                      );
                    }
                    return CircularProgressIndicator();
                  }
                },
              );
            },
            orElse: () {
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
            getOrdersfailure: (e) {
              return Center(
                child: Text(
                  e.error ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class GestureDetectorWidget extends StatelessWidget {
  GestureDetectorWidget({
    super.key,
    required this.onTap,
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
