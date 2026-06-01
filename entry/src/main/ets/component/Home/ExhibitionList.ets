// ExhibitionList.ets
import { ExhibitionItem, EXHIBITION_DATA } from "../Exhibit/ExhibitionData"
import { router } from "@kit.ArkUI"

@Component
export struct ExhibitionList {
  // 定义尺寸常量
  private readonly ITEM_HEIGHT: number = 120 // 统一高度
  private readonly ITEM_MARGIN: number = 8 // 统一间距

  private getRandomExhibitions(count: number = 4): Array<ExhibitionItem> {
    const shuffled = [...EXHIBITION_DATA].sort(() => 0.5 - Math.random())
    return shuffled.slice(0, count)
  }

  build() {
    Column() {
      Row() {
        Text('陈列展览')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
        Text('更多')
          .fontSize(14)
          .fontColor('#999')
          .margin({ left: 8 })
          .onClick(() => {
            router.pushUrl({
              url: 'component/Exhibit/Exhibits',
            })
          })
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width('100%')
      .margin({ bottom: 12 })

      // 展览列表
      Row() {
        ForEach(this.getRandomExhibitions(), (item: ExhibitionItem) => {
          Column() {
            // 图片容器
            Stack() {
              Image(item.image)
                .height('100%')  // 关键修改：使用百分比高度
                .width('100%') // 宽度自适应
                .objectFit(ImageFit.Cover) // 保持图片比例
                .borderRadius(4)

            }
            .height(this.ITEM_HEIGHT)
            .width('100%') // 确保容器宽度一致
            .borderRadius(4)
            .border({ width: 1, color: '#EEEEEE' })
            .alignContent(Alignment.Center) // 关键修改：添加水平居中
            .onClick(() => {
              // 添加点击事件，跳转到展览详情页
              router.pushUrl({
                url: 'component/Exhibit/Exhibit',
                params: { id: item.id.toString() }
              })
            })
            // 展览标题
            Text(item.title)
              .fontSize(14)
              .margin({ top: 8 })
              .maxLines(1) // 改为1行
              .textOverflow({ overflow: TextOverflow.Ellipsis })
              .width('100%')
              .textAlign(TextAlign.Center)
          }
          .margin({ right: this.ITEM_MARGIN })
          .layoutWeight(1)
          .justifyContent(FlexAlign.Start)
        })
      }
      .alignItems(VerticalAlign.Top)
      .width('100%')
      .margin({ bottom: 20 })
    }
    .width('100%')
    .padding(12)
  }
}