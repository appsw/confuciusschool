import 'package:confuciusschool/base/BaseState.dart';
import 'package:confuciusschool/base/BasefulWidget.dart';
import 'package:confuciusschool/utils/Constant.dart';
import 'package:confuciusschool/utils/LoadingUtils.dart';
import 'package:confuciusschool/utils/PageUtils.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';
class WebViewPage extends StatefulWidget {
  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends BaseState {
  @override
  Widget getAppBar(BuildContext context) {
    // TODO: implement getAppBar
    return PageUtils.getAppBar(context, "抽奖");
  }
  var url1 = 'http://cedu.qwangluo.net/#/';
  bool getToken = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Constant.getToken().then((token){

      setState((){
        url1 = url1 + "?token=${token}";
        print("url========================"+url1);
        getToken = false;

      });
    });
  }

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return getToken ? LoadingUtils.getRingLoading() : Container(
      width: MediaQuery.of(context).size.width,
      child: WebView(
        initialUrl: url1,
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