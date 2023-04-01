import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:google_broweser/google/provider/google_provider.dart';
import 'package:provider/provider.dart';

class Google_Screen extends StatefulWidget {
  const Google_Screen({Key? key}) : super(key: key);

  @override
  State<Google_Screen> createState() => _Google_ScreenState();
}

class _Google_ScreenState extends State<Google_Screen> {
  Google_Provider? google_providertrue;
  Google_Provider? google_providerfalse;
  TextEditingController searchc = TextEditingController();
  PullToRefreshController? pullToRefreshController;

  @override
  void initState() {
    super.initState();
    pullToRefreshController = PullToRefreshController(onRefresh: () {
      google_providertrue!.inAppWebViewController?.reload();
    });
  }

  @override
  Widget build(BuildContext context) {
    google_providertrue = Provider.of<Google_Provider>(context, listen: true);
    google_providerfalse = Provider.of<Google_Provider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    google_providertrue!.inAppWebViewController!.goBack();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    google_providertrue!.inAppWebViewController!.goForward();
                  },
                  icon: Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 5,bottom: 5),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey.shade300,
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                            ),
                            child: IconButton(
                              onPressed: () {
                                var newurl = searchc.text;
                                google_providertrue!.inAppWebViewController!
                                    .loadUrl(
                                  urlRequest: URLRequest(
                                    url: Uri.parse(
                                        "https://www.google.com/search?q=$newurl"),
                                  ),
                                );
                              },
                              icon: Icon(
                                Icons.search_rounded,
                                color: Colors.black,
                                size: 25,
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              controller: searchc,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search URL",
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    google_providertrue!.inAppWebViewController!.reload();
                  },
                  icon: Icon(
                    Icons.refresh,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
              ],
            ),
            LinearProgressIndicator(
              value: google_providertrue!.progressbar,
            ),
            Expanded(
              child: InAppWebView(
                initialUrlRequest: URLRequest(
                  url: Uri.parse("https://www.google.com/"),
                ),
                pullToRefreshController: pullToRefreshController!,
                onWebViewCreated: (controller) {
                  google_providertrue!.inAppWebViewController = controller;
                },
                onLoadError: (controller, url, code, message) {
                  pullToRefreshController!.endRefreshing();

                  google_providertrue!.inAppWebViewController = controller;
                },
                onLoadStart: (controller, url) {
                  google_providertrue!.inAppWebViewController = controller;
                },
                onLoadStop: (controller, url) {
                  pullToRefreshController!.endRefreshing();

                  google_providertrue!.inAppWebViewController = controller;
                },
                onProgressChanged: (controller, progress) {
                  if (progress == 100) {
                    pullToRefreshController!.endRefreshing();
                  }
                  google_providerfalse!.changeprogressbar(progress / 100);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
