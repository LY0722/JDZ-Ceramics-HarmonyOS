// component/My/KnowledgeList.ets
import { KnowledgeItem } from "../Knowledge/KnowledgeData"


@Component
export struct KnowledgeList {
  @Link knowledgeList: KnowledgeItem[]

  build() {
    Column() {
      Row() {
        Text('科普记录')
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
          ForEach(this.knowledgeList, (item: KnowledgeItem) => {
            Column() {
              Text(item.title)
                .fontSize(16)
                .fontWeight(FontWeight.Medium)
                .margin({ bottom: 6 })

              Text(item.era)
                .fontSize(14)
                .fontColor('#666')
                .margin({ bottom: 6 })

              Text(item.content)
                .fontSize(14)
                .fontColor('#333')
                .margin({ bottom: 6 })
                .maxLines(3)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
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