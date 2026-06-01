// CollectionList.ets
import { getAllCollectionData, CollectionData } from "../Collection/CollectionUtils"
import { router } from "@kit.ArkUI"

@Component
export struct CollectionList {
  // 图片尺寸常量定义
  private readonly ITEM_HEIGHT: number = 120 // 统一高度
  private readonly ITEM_MARGIN: number = 8 // 统一间距

  private getRandomCollections(count: number = 3): Array<CollectionData> {
    const allCollections = getAllCollectionData()
    const shuffled = [...allCollections].sort(() => 0.5 - Math.random())
    return shuffled.slice(0, count)
  }

  build() {
    Column() {
      Row() {
        Text('馆藏珍品')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
        Text('更多')
          .fontSize(14)
          .fontColor('#999')
          .margin({ left: 8 })
          .onClick(() => {
            router.pushUrl({
              url: 'component/Collection/Collection',
            })
          })
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width('100%')
      .margin({ bottom: 12 })

      // 修改后的馆藏列表
      Row() {
        ForEach(this.getRandomCollections(), (item: CollectionData) => {
          Column() {
            // 图片容器 - 移除了边框
            Stack() {
              Image(item.imageUrl)
                .height(this.ITEM_HEIGHT) // 强制高度
                .width('auto') // 宽度自适应
                .objectFit(ImageFit.Fill)
                .borderRadius(4)
            }
            .height(this.ITEM_HEIGHT)
            .width('100%') // 确保宽度填满父容器
            .borderRadius(4)
            // .alignContent(HorizontalAlign.Center)

            // 珍品名称
            Text(item.name)
              .fontSize(14)
              .margin({ top: 8 })
              .maxLines(1)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
              .width('100%')
              .textAlign(TextAlign.Center)
          }
          .margin({ right: this.ITEM_MARGIN })
          .layoutWeight(1) // 关键修改：确保等宽分配
          .justifyContent(FlexAlign.Center) // 内容居中
        })
      }
      .width('100%')
      .margin({ bottom: 20 })
    }
    .width('100%')
    .padding(12)
  }
}