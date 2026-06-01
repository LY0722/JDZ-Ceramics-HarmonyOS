// WebViewPage.ets
import webview from '@ohos.web.webview';
import router from '@ohos.router';

@Entry
@Component
export struct WebViewPage {
  private webController: webview.WebviewController = new webview.WebviewController();

  @State url: string = '';

  aboutToAppear() {
    // 正确获取路由参数的方式
    const params = router.getParams() as Record<string, string>;
    this.url = params?.url || '';
  }

  build() {
    Column() {
      // 顶部导航栏
      Row() {
        Image($r('app.media.ic_back'))
          .width(24)
          .height(24)
          .margin({ left: 12 })
          .onClick(() => {
            router.back();
          })

        Text(this.url)
          .fontSize(14)
          .margin({ left: 8 })
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .layoutWeight(1)
      }
      .width('100%')
      .height(50)
      .backgroundColor('#FFFFFF')

      // Web组件
      Web({
        controller: this.webController,
        src: this.url
      })
        .width('100%')
        .height('100%')
        .onPageEnd(e => {
          console.log('Page loaded: ' + e.url);
        })
    }
    .width('100%')
    .height('100%')
    .onAppear(() => {
      if (this.url) {
        this.webController.loadUrl(this.url);
      }
    })
  }
}