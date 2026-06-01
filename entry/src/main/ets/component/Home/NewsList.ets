import webview from '@ohos.web.webview';
import router from '@ohos.router';

// 定义新闻数据接口
interface NewsItem {
  id: number
  title: string
  date: string // 格式为"YY/MM/DD"
  url: string  // 新增url字段
}

@Entry
@Component
export struct NewsList {
  @State isShowNewsPopup: boolean = false; // 控制弹窗显示状态

  // 新闻数据
  private newsData: NewsItem[] = [
    {
      id: 1,
      title: "习近平给中国国家博物馆的老专家回信强调 推动文物活化利用推进文明",
      date: "22/7/9",
      url: "https://www.chnmuseum.cn/zx/gbxw/202207/t20220709_256669.shtml"
    },
    {
      id: 2,
      title: "习近平文化思想首次提出",
      date: "23/10/9",
      url: "https://www.chnmuseum.cn/zx/xxjxs/202310/t20231009_259960.shtml"
    },
    {
      id: 3,
      title: "中共中央关于进一步全面深化改革 推进中国式现代化的决定",
      date: "24/7/21",
      url: "https://www.chnmuseum.cn/zx/gbxw/202407/t20240721_269649.shtml"
    },
    {
      id: 4,
      title: "深化文化体制机制改革",
      date: "24/8/7",
      url: "https://www.chnmuseum.cn/zx/gbxw/202207/t20220709_256669.shtml"
    },
    {
      id: 5,
      title: "深化文化和旅游领域改革 加快建设社会主义文化强国",
      date: "24/10/16",
      url: "https://www.chnmuseum.cn/zx/gbxw/202207/t20220709_256669.shtml"
    },
    {
      id: 6,
      title: "AI文物活化微短剧：小'墓'骑两岁从军",
      date: "25/6/25",
      url: "https://www.chnmuseum.cn/zx/gbxw/202207/t20220709_256669.shtml"
    },
    {
      id: 7,
      title: "2025年国博青年干部培训班在浙江红船干部学院顺利举办",
      date: "25/6/25",
      url: "https://www.chnmuseum.cn/zx/gbxw/202207/t20220709_256669.shtml"
    },
    {
      id: 8,
      title: "国博公共考古体验营开始报名",
      date: "25/6/25",
      url: "https://www.chnmuseum.cn/zx/gbxw/202207/t20220709_256669.shtml"
    },
    {
      id: 9,
      title: "国博展讯 | '宇宙考古：时空探索'展览即将展出",
      date: "25/6/24",
      url: "https://www.chnmuseum.cn/zx/gbxw/202207/t20220709_256669.shtml"
    },
    {
      id: 10,
      title: "购买正版国博凤冠冰箱贴，请认准这些官方渠道",
      date: "25/6/24",
      url: "https://www.chnmuseum.cn/zx/gbxw/202207/t20220709_256669.shtml"
    }
  ]

  build() {
    Stack() {
      Column() {
        // 标题栏
        Row() {
          Text("新闻资讯")
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .margin({ left: 15 })

          Blank()

          // 右侧三个小圆点
          Row() {
            Circle().width(6).height(6).fill('#000000').margin({ left: 4 })
            Circle().width(6).height(6).fill('#000000').margin({ left: 4 })
            Circle().width(6).height(6).fill('#000000').margin({ left: 4 })
          }
          .margin({ right: 12 })
          .onClick(() => {
            this.isShowNewsPopup = true;
          })
        }
        .width('100%')
        .height(50)
        .justifyContent(FlexAlign.Center)

        // 新闻列表
        List() {
          ForEach(this.newsData, (item: NewsItem) => {
            ListItem() {
              Column() {
                // 标题和日期的行
                Row() {
                  Text(item.title)
                    .fontSize(16)
                    .fontColor('#333333')
                    .maxLines(1)
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                    .layoutWeight(1)

                  Text(item.date)
                    .fontSize(14)
                    .fontColor('#999999')
                    .margin({ left: 10 })
                    .flexShrink(0)
                }
                .width('100%')
                .height(44)
                .padding({ left: 16, right: 16 })

                // 分割线作为Column的子元素
                Divider()
                  .strokeWidth(0.5)
                  .color('#EEEEEE')
                  .margin({ top: 8, bottom: 8 })
              }
              .onClick(() => {
                if (!item.url || typeof item.url !== 'string') {
                  console.error('无效的URL:', item.url);
                  return;
                }
                router.pushUrl({
                  url: 'component/Home/WebViewPage',
                  params: { url: item.url }
                }).then(() => {
                  console.log('跳转成功');
                }).catch((err: Error) => {
                  console.error('跳转失败:', err.message);
                });
              })
            }
          }, (item: NewsItem) => item.id.toString())
        }
        .width('93%')
        .borderRadius(8)
        .backgroundColor('#FFFFFF')
        .shadow({ radius: 2, color: '#10000000', offsetX: 0, offsetY: 1 })
        .height(180)
      }
      .width('100%')
      .height('auto')

      // 新闻列表弹窗
      if (this.isShowNewsPopup) {
        // 半透明背景层
        Column()
          .width('100%')
          .height('100%')
          .backgroundColor('#80000000')
          .position({ x: 0, y: 0 })
          .zIndex(100)
          .onClick(() => {
            this.isShowNewsPopup = false;
          })

        // 弹窗内容
        Column() {
          // 弹窗标题
          Row() {
            Text('全部新闻')
              .fontSize(18)
              .fontWeight(FontWeight.Bold)
              .margin({ left: 16 })

            Blank()

            Text('×')
              .fontSize(22)
              .margin({ right: 16, bottom: 5 })
              .onClick(() => {
                this.isShowNewsPopup = false;
              })
          }
          .width('100%')
          .height(50)
          .justifyContent(FlexAlign.SpaceBetween)
          .alignItems(VerticalAlign.Center)
          .borderWidth({ bottom: 1 })
          .borderColor({ bottom: '#EEEEEE' })

          // 弹窗内容 - 新闻列表
          List() {
            ForEach(this.newsData, (item: NewsItem) => {
              ListItem() {
                Column() {
                  // 标题和日期的行
                  Row() {
                    Text(item.title)
                      .fontSize(16)
                      .fontColor('#333333')
                      .maxLines(2)
                      .textOverflow({ overflow: TextOverflow.Ellipsis })
                      .layoutWeight(1)

                    Text(item.date)
                      .fontSize(14)
                      .fontColor('#999999')
                      .margin({ left: 10 })
                      .flexShrink(0)
                  }
                  .width('100%')
                  .height('auto')
                  .padding({ left: 16, right: 16, top: 12, bottom: 12 })

                  // 分割线
                  Divider()
                    .strokeWidth(0.5)
                    .color('#EEEEEE')
                }
                .onClick(() => {
                  this.isShowNewsPopup = false;
                  if (!item.url || typeof item.url !== 'string') {
                    console.error('无效的URL:', item.url);
                    return;
                  }
                  router.pushUrl({
                    url: 'component/Home/WebViewPage',
                    params: { url: item.url }
                  });
                })
              }
            }, (item: NewsItem) => item.id.toString())
          }
          .width('100%')
          .height('100%')
          .layoutWeight(1)
        }
        .width('90%')
        .height('70%')
        .backgroundColor('#FFFFFF')
        .borderRadius(12)
        .shadow({ radius: 10, color: '#40000000', offsetX: 0, offsetY: 2 })
        .position({ x: '5%', y: '15%' })
        .zIndex(101)
      }
    }
    .width('100%')
    .height('auto')
    .onClick(() => {
      if (this.isShowNewsPopup) {
        this.isShowNewsPopup = false;
      }
    })
  }
}