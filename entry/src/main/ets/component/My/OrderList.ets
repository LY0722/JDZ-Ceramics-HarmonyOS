import { ExhibitionItem } from "../Exhibit/ExhibitionData"

// component/My/OrderList.ets
@Component
export struct OrderList {
  @Link exhibitionList: ExhibitionItem[]

  build() {
    Column() {
      Row() {
        Text('我的预约')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)

        Blank()  // 添加Blank元素占据中间空间

        Text('×')
          .fontSize(22)
          .margin({ right: 8, bottom: 5 })
      }
      .width('100%')

      Scroll() {
        Column() {
          ForEach(this.exhibitionList, (item: ExhibitionItem) => {
            Row() {
              // 左侧图片
              Image(item.image)
                .width(60)
                .height(120)
                .objectFit(ImageFit.Cover)
                .borderRadius(8)
                .margin({ right: 12 })

              // 右侧内容
              Column() {
                Text(item.title)
                  .fontSize(16)
                  .fontWeight(FontWeight.Medium)
                  .margin({ bottom: 8 })
                  .maxLines(1)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                  .width('100%')
                  .textAlign(TextAlign.Start)

                Text(`参观时间: ${item.date}`)
                  .fontSize(14)
                  .fontColor('#666')
                  .margin({ bottom: 8 })
                  .width('100%')
                  .textAlign(TextAlign.Start)

                Text(`开放时间: ${item.openingHours}`)
                  .fontSize(14)
                  .fontColor('#666')
                  .margin({ bottom: 8 })
                  .width('100%')
                  .textAlign(TextAlign.Start)

                Text(`地点: ${item.location}`)
                  .fontSize(14)
                  .fontColor('#666')
                  .margin({ bottom: 8 })
                  .width('100%')
                  .textAlign(TextAlign.Start)
              }
              .alignItems(HorizontalAlign.Start)
              .width('60%')
            }
            .width('100%')
            .padding(12)
            .backgroundColor('#FFFFFF')
            .borderRadius(8)
            .shadow({ radius: 4, color: '#20000000', offsetX: 0, offsetY: 2 })
            .margin({ bottom: 12 })
          })
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