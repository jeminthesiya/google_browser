import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Show_provider extends ChangeNotifier {
  WebViewController? webViewController;

  void initcontriller(int index) {
    webViewController = WebViewController();
    webViewController!.loadRequest(
      Uri.parse("${linkList[index]}"),
    );
  }

  List logoList = [
    "assets/images/Amazon.png",
    "assets/images/booking.jpg",
    "assets/images/flipkart.webp",
    "assets/images/Google_Chrome.png",
    "assets/images/netfilx.webp",
    "assets/images/play_store.webp",
    "assets/images/s.png",
    "assets/images/sh.png",
    "assets/images/tweter.png",
    "assets/images/vidmate.webp",
    "assets/images/yahoo.png",
    "assets/images/youtube.png",
  ];

  List linkList = [
    "https://www.amazon.in/?&ext_vrnc=hi&tag=googhydrabk1-21&ref=pd_sl_5szpgfto9i_e&adgrpid=58075519359&hvpone=&hvptwo=&hvadid=486462756371&hvpos=&hvnetw=g&hvrand=8725968498181400949&hvqmt=e&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=9062189&hvtargid=kwd-64107830&hydadcr=14452_2154371&gclid=EAIaIQobChMI9PL0j8XQ_AIVBw4rCh1f2QZiEAAYASAAEgKzQPD_BwE",
    "https://www.booking.com/index.html?aid=378266;label=booking-name-IquAp*EbiLS6jPVl_he8yQS461500239787:pl:ta:p1:p22,563,000:ac:ap:neg:fi:tikwd-65526620:lp9062189:li:dec:dm:ppccp=UmFuZG9tSVYkc2RlIyh9YYriJK-Ikd_dLBPOo0BdMww;ws=&gclid=EAIaIQobChMIjM-5k9zQ_AIVmBsrCh3FcwcPEAAYASAAEgI3YfD_BwE",
    "https://www.flipkart.com/",
    "https://www.google.com/",
    "https://www.netflix.com/in/",
    "https://play.google.com/store/games",
    "https://www.skype.com/en/",
    "https://www.shopify.com/in",
    "https://twitter.com/",
    "https://www.9apps.com/android-apps/HD-Video-Downloader-and-Live-TV-VidMate/",
    "https://in.search.yahoo.com/?guccounter=1&guce_referrer=aHR0cHM6Ly93d3cuZ29vZ2xlLmNvbS8&guce_referrer_sig=AQAAAE10Er2ZH6lSzW9ZHXTMIbwzXuZjq0jJ71M9v-rjk4C9PSglJHYUeO2ykShjNmaVH0A5lsdBG-5DfzeylFPugYhW8vjRJFyZaCxuak-x1ilIJch4HsAiGgoZikKfqj4fERPCIwzjpKirdQVL_z_Rt11EI9wLLlNIi9j3NIUUbZzF",
    "https://www.youtube.com/",
  ];

  List AppNameList = [
    "Amazon",
    "booking ",
    "flipkart",
    "Chrome",
    "netflix",
    "playstore",
    "skype",
    "shopify",
    "twitter",
    "vidmate",
    "yahoo",
    "Youtube",
  ];
}
