// component/My/CollectionList.ets
import { CollectionData } from "../Collection/CollectionDataModel"


@Component
export struct CollectionList {
  @Link collectionList: CollectionData[]

  build() {
    Column() {
      Row() {
        Text('收藏展品')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)

        Blank()

        Text('×')
          .fontSize(22)
          .margin({ right: 8, bottom: 5 })
      }
      .width('100%')

      Scroll() {
        Column() {
          ForEach(this.collectionList, (item: CollectionData) => {
            Row() {
              Image(item.imageUrl)
                .width(80)
                .height(120)
                .objectFit(ImageFit.Cover)
                .borderRadius(8)
                .margin({ right: 12 })

              Column() {
                Text(item.name)
                  .fontSize(16)
                  .fontWeight(FontWeight.Medium)
                  .margin({ bottom: 6 })
                  .maxLines(1)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })

                Text(`朝代: ${item.dynasty}`)
                  .fontSize(14)
                  .fontColor('#666')
                  .margin({ bottom: 6 })

                Text(`材质: ${item.material}`)
                  .fontSize(14)
                  .fontColor('#666')
                  .margin({ bottom: 6 })

                Text(`馆藏: ${item.museum}`)
                  .fontSize(14)
                  .fontColor('#666')
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