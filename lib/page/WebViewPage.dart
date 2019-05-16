import 'package:confuciusschool/base/BasefulWidget.dart';
import 'package:confuciusschool/utils/PageUtils.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends BasefulWidget{
  @override
  Widget getAppBar(BuildContext context) {
    // TODO: implement getAppBar
    return PageUtils.getAppBar(context, "抽奖");
  }

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return Container(
      width: MediaQuery.of(context).size.width,
      child: WebView(
        initialUrl: 'http://cedu.qwangluo.net/#/',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
//          _controller.complete(webViewController);
        },
        // TODO(iskakaushik): Remove this when collection literals makes it to stable.
        // ignore: prefer_collection_literals
        javascriptChannels: <JavascriptChannel>[
//          _toasterJavascriptChannel(context),
        ].toSet(),
      ),
    );
  }

}