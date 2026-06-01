@Component
export struct About {
  build() {
    Column() {
      // 标题栏
      Row() {
        Text('关于我们')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)

        Blank()

        Text('×')
          .fontSize(22)
          .margin({ right: 8, bottom: 5 })
      }
      .width('100%')
      .margin({ bottom: 16 })

      // 内容区域
      Scroll() {
        Column() {
          // 博物馆logo
          Image($r('app.media.museum1'))
            .width(120)
            .height(120)
            .margin({ top: 10, bottom: 20 })

          Text('景德镇中国陶瓷博物馆')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 30 })

          // 信息卡片
          Column() {
            // 开放时间
            Row() {
              Image($r('app.media.ic_clock'))
                .width(20)
                .height(20)
                .margin({ right: 10 })

              Column() {
                Text('开放时间')
                  .fontSize(16)
                  .fontWeight(FontWeight.Bold)
                  .margin({ bottom: 4 })

                Text('9:00（开馆）-16:30（停止入馆）-17:00（闭馆）')
                  .fontSize(14)
                  .fontColor('#666')
                  .margin({ bottom: 8 })

                Text('tips：周二至周日免费开放（周一闭馆、节假日除外）')
                  .fontSize(12)
                  .fontColor('#999')
              }
              .alignItems(HorizontalAlign.Start)
            }
            .width('100%')
            .margin({ bottom: 20 })

            // 咨询电话
            Row() {
              Image($r('app.media.ic_phone'))
                .width(20)
                .height(20)
                .margin({ right: 10 })

              Column() {
                Text('咨询电话')
                  .fontSize(16)
                  .fontWeight(FontWeight.Bold)
                  .margin({ bottom: 4 })

                Text('0798-8253701')
                  .fontSize(14)
                  .fontColor('#666')
              }
              .alignItems(HorizontalAlign.Start)
            }
            .width('100%')
            .margin({ bottom: 20 })

            // 地理位置
            Row() {
              Image($r('app.media.ic_position'))
                .width(20)
                .height(20)
                .margin({ right: 10 })

              Column() {
                Text('地理位置')
                  .fontSize(16)
                  .fontWeight(FontWeight.Bold)
                  .margin({ bottom: 4 })

                Text('江西省景德镇市昌江区紫晶北路1号')
                  .fontSize(14)
                  .fontColor('#666')
              }
              .alignItems(HorizontalAlign.Start)
            }
            .width('100%')
          }
          .width('100%')
          .padding(20)
          .borderRadius(12)
          .backgroundColor('#FFFFFF')

          // 版本信息
          Text('版本号：v1.0.0')
            .fontSize(12)
            .fontColor('#999')
            .margin({ top: 20, bottom: 10 })
        }
      }
      .height(400)
    }
    .width('90%')
    .padding(16)
    .backgroundColor('#F5F5F5')
    .borderRadius(12)
  }
}