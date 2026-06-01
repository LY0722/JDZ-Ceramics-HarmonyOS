// GuideService.ets
@Component
export struct GuideService {
  build() {
    Column() {
      // 预约卡片部分
      Row() {
        // 参观预约卡片
        this.buildReservationCard('#795442', '参观预约', '线上预约参观时间', 'home_bac1')

        // 活动预约卡片
        this.buildReservationCard('#4f7487', '活动预约', '预约特色活动', 'home_bac1')

        // 志愿者卡片
        this.buildReservationCard('#9d8569', '志愿者', '加入志愿者团队', 'home_bac3')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .margin({ bottom: 20 })

      // 关于我们部分 - 修改为白色字体
      Column() {
        Text('关于我们')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 16 })
          .width('100%')
          .textAlign(TextAlign.Center)
          .fontColor(Color.White)  // 添加白色字体

        // Text('开馆时间：9:00（开馆）-17:00（闭馆）')
        //   .fontSize(14)
        //   .margin({ bottom: 4 })
        //   .width('100%')
        //   .textAlign(TextAlign.Start)
        //   .fontColor(Color.White)  // 添加白色字体
        // Text('注意：周二至周日免费开放（周一闭馆、节假日除外）')
        //   .fontSize(12)
        //   .fontColor('#EEEEEE')  // 改为浅灰色，白色背景上更易读
        //   .margin({ bottom: 8 })
        //   .width('100%')
        //   .textAlign(TextAlign.Start)

        Text('咨询电话：0798-8253701')
          .fontSize(12)
          .fontColor('#EEEEEE')  // 改为浅灰色
          .margin({ bottom: 8 })
          .width('100%')
          .textAlign(TextAlign.Start)

        Text('地理位置：江西省景德镇市昌江区紫晶北路1号')
          .fontSize(12)
          .fontColor('#EEEEEE')  // 改为浅灰色
          .width('100%')
          .textAlign(TextAlign.Start)
      }
      .width('100%')
      // 添加版权信息
      Column() {
        Text('版权所有 © 景德镇中国陶瓷博物馆')
          .fontSize(12)
          .fontColor(Color.White)
          .width('100%')
          .textAlign(TextAlign.Center)
          .padding(8)
      }
      .width('100%')
      // .backgroundColor('#000000')  // 黑色背景
      .margin({ top: 20 })  // 与上方内容留出空白

    }
    .width('100%')
    .padding(16)
    .backgroundImage($r('app.media.background_home3'))
    .backgroundImageSize(ImageSize.Cover)
  }

  @Builder
  private buildReservationCard(color: string, title: string, subTitle: string, imageRes: string) {
    Stack() {
      Column() {
        Text(title)
          .fontSize(16)
          .fontColor(Color.White)
          .margin({ bottom: 4 })

        Text(subTitle)
          .fontSize(12)
          .fontColor(Color.White)
          .opacity(0.8)
      }
      .alignItems(HorizontalAlign.Start)
      .padding(12)
      .zIndex(1)

      // 修改图片位置和大小
      Image($r(`app.media.${imageRes}`))
        .width(30)  // 增大宽度
        .height(30)  // 增大高度
        .opacity(0.3)
        .position({ x: '65%', y: '60%' })  // 向左移动
        // .margin({ left: -10 })  // 再向左调整一点
    }
    .width('30%')
    .height(80)
    .backgroundColor(color)
    .borderRadius(8)
  }
}