import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/common/custom_app_bar/ktabbar.dart';
import 'package:trading_app/common/loader/shimmer.dart';
import 'package:trading_app/constants/colors.dart';
import 'package:trading_app/constants/text.dart';
import 'package:trading_app/live_page/screens/nasdaq_stock_screen.dart';
import 'package:trading_app/live_page/screens/nse_stock_screen.dart';
import 'package:trading_app/user/controller/user_controller.dart';

class LivePageScreen extends StatefulWidget {
  const LivePageScreen({super.key});

  @override
  State<LivePageScreen> createState() => _LivePageScreenState();
}

class _LivePageScreenState extends State<LivePageScreen> {
  final List<String> nseStockNames = [
    "Adani Port",
    "Axis Bank",
    "Coal India",
    "ICICI Bank",
    "ITC",
    "Power Grid",
    "Tata Motors",
    "Tata Steel",
    "TCS",
    "Yesbank",
    "Yatra",
    "Titan",
    "TideWater",
    "TFCILTD",
    "Tata Power",
    "Tata Chemicals ltd.",
    "Aditya Birla",
    "Ongc",
    "Oil India ltd.",
    "Zomato"
  ];

  // Example list of stock names
  final List<String> sestockId = [
    "NSE_EQ|INE742F01042",
    "NSE_EQ|INE238A01034",
    "NSE_EQ|INE522F01014",
    "NSE_EQ|INE090A01021",
    "NSE_EQ|INE154A01025",
    "NSE_EQ|INE752E01010",
    "NSE_EQ|INE155A01022",
    "NSE_EQ|INE081A01020",
    "NSE_EQ|INE467B01029",
    "NSE_EQ|INE528G01035",
    "NSE_EQ|INE0JR601024",
    "NSE_EQ|INE280A01028",
    "NSE_EQ|INE484C01030",
    "NSE_EQ|INE305A01015",
    "NSE_EQ|INE245A01021",
    "NSE_EQ|INE092A01019",
    "NSE_EQ|INE674K01013",
    "NSE_EQ|INE213A01029",
    "NSE_EQ|INE274J01014",
    "NSE_EQ|INE758T01015"
  ];

  final List<String> NasdaqStockNames = [
    'Amazon',
    'Apple',
    'Amd',
    'Google',
    'Intel',
    'Meta',
    'Microsoft',
    'Netflix',
    'Nvidia',
    'Super Micro Computer',
    'Walt Disney Company',
    'AMC Entertainment Holdings',
    'Micron Technology, Inc.',
    'Taiwan Semicon. Ma. Comany Ltd.',
    'Bank of America Corporation',
    'JP Morgan Chase & Co.',
    'Trump Media & Tech. Group Corp.',
    'Adobe Inc.',
    'Roku Inc.',
    'Robinhood Market Inc.',
    'Shopify Inc.'
  ];

  final List<String> NasdaqStockId = [
    "NASDAQ:AMZN",
    "NASDAQ:AAPL",
    "NASDAQ:AMD",
    "NASDAQ:GOOGL",
    "NASDAQ:INTC",
    "NASDAQ:META",
    "NASDAQ:MSFT",
    "NASDAQ:NFLX",
    "NASDAQ:NVDA",
    "NASDAQ:SMCI",
    "NYSE:DIS",
    "NYSE:AMC",
    "NASDAQ:MU",
    "NYSE:TSM",
    "NYSE:BAC",
    "NYSE:JPM",
    "NASDAQ:DJT",
    "NASDAQ:ADBE",
    "NASDAQ:ROKU",
    "NASDAQ:HOOD",
    "NYSE:SHOP"
  ];

  // Example list of stock prices
  List<String> filteredStockNames = [];
  List<String> filteredNasdaqStockNames = [];

  @override
  void initState() {
    super.initState();
    filteredStockNames.addAll(nseStockNames);
    filteredNasdaqStockNames.addAll(NasdaqStockNames);
  }

  void _filterNseStocks(String searchText) {
    setState(() {
      filteredStockNames = nseStockNames
          .where(
              (name) => name.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
      filteredNasdaqStockNames = NasdaqStockNames.where(
              (name) => name.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    final controller = Get.put(UserController());
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (_, isScroled) {
              return [
                SliverAppBar(
                  floating: false,
                  automaticallyImplyLeading: false,
                  pinned: true,
                  expandedHeight: 220,
                  backgroundColor: dark ? Colors.black : TColor.white,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        Text(
                          KtextString.homeAppBarTitle,
                          style: Theme.of(context).textTheme.labelMedium!.apply(
                                color: dark ? TColor.grey : TColor.darkerGrey,
                              ),
                        ),
                        Obx(() {
                          if (controller.profileLoding.value) {
                            return const KShimmerEffect(hight: 80, width: 80);
                          } else {
                            return Text(
                              controller.user.value.username,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .apply(
                                    color: dark ? TColor.white : TColor.black,
                                  ),
                            );
                          }
                        }),
                        const SizedBox(
                          height: 24,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color:
                                      dark ? TColor.grey : TColor.darkerGrey)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 5),
                            child: TextField(
                              onChanged: _filterNseStocks,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.search),
                                errorBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                hintText: 'Search Here!',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  bottom: const KTabBar(
                    labelPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 32),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    tabList: [
                      Text('NASDAQ'),
                      Text('NSE'),
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(children: [
              // NseScreen(stockId: stockId,stockNames: stockNames,),

              NasdaqScreen(
                NasdaqStockNames: filteredNasdaqStockNames,
                NasdaqStockId: NasdaqStockId,
              ),
              NseScreen(
                stockId: sestockId,
                stockNames: filteredStockNames,
              ),
            ])),
      ),
    );
  }
}
