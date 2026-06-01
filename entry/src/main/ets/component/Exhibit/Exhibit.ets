// ExhibitionDetail.ets
import { ExhibitionItem, getExhibitionById } from './ExhibitionData'
import { router } from '@kit.ArkUI'

@Entry
@Component
struct ExhibitionDetail {
  @State exhibition: ExhibitionItem | null = null
  @State isLiked: boolean = false  // 点赞状态
  private exhibitionId: number = 0
  private scroller: Scroller = new Scroller()  // 添加滚动控制器
  @State showBackToTop: boolean = false  // 是否显示返回顶部按钮

  aboutToAppear() {
    const params = router.getParams() as Record<string, string>;
    if (params && params['id']) {
      this.exhibitionId = parseInt(params['id']);
      this.exhibition = getExhibitionById(this.exhibitionId) || null;
      if (this.exhibition) {
        this.isLiked = this.exhibition.liked; // 初始化点赞状态
      }
    }
  }

  // 点赞按钮点击事件
  private toggleLike() {
    this.isLiked = !this.isLiked;
    if (this.exhibition) {
      this.exhibition.liked = this.isLiked;
    }
  }

  // 处理滚动事件
  private handleScroll(scrollOffset: number) {
    this.showBackToTop = scrollOffset > 300;  // 滚动超过300时显示返回顶部按钮
  }

  // 返回顶部
  private scrollToTop() {
    this.scroller.scrollTo({ xOffset: 0, yOffset: 0 });
    this.showBackToTop = false;
  }

  // 构建标签行
  @Builder
  buildTags(tags: string[]) {
    Column(){
      Flex({ justifyContent: FlexAlign.Center, wrap: FlexWrap.Wrap }) {
        ForEach(tags, (tag: string) => {
          Text(tag)
            .fontSize(12)
            .fontColor('#1296db')
            .padding({ left: 10, right: 10, top: 6, bottom: 6 })
            .backgroundColor('#e6f7ff')
            .borderRadius(15)
            .margin({ right: 8, bottom: 8 })
        })
      }
      .width('100%')
    }
    .margin({ bottom: 20 })
    .width('100%')
    .alignItems(HorizontalAlign.Center)
  }

  build() {
    Column() {
      if (this.exhibition) {
        // 内容区域
        Stack() {
          Scroll(this.scroller) {
            Column() {
              // 标题和点赞按钮
              Row() {
                Text(this.exhibition.title)
                  .fontSize(22)
                  .fontWeight(FontWeight.Bold)
                  .layoutWeight(1)
                  .maxLines(2)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                  .margin({left:20})

                Button() {
                  Image($r('app.media.ic_back'))
                    .width(20)
                    .height(20)
                }
                .type(ButtonType.Circle)
                .width(40)
                .height(40)
                .backgroundColor(Color.Transparent)
                .position({ x: -15, y: -8 })
                .onClick(() => router.back())
                .zIndex(1)
              }
              .margin({ top: 20, bottom: 15 })
              .width('100%')

              Stack() {
                Image(this.exhibition.image)
                  .width('100%')
                  .height(280)
                  .objectFit(ImageFit.Contain)
              }
              .width('100%')
              .height(300)

              // 基本信息行
              Column() {
                Row() {
                  Image($r("app.media.ic_clock"))
                    .width(16)
                    .height(16)
                    .margin({ right: 5 })
                  Text(`${this.exhibition.date} | ${this.exhibition.openingHours}`)
                    .fontSize(14)
                    .fontColor('#666')
                }

                Row() {
                  Image($r("app.media.ic_position"))
                    .width(16)
                    .height(16)
                    .margin({ right: 5, top: 8 })
                  Text(this.exhibition.location)
                    .fontSize(14)
                    .fontColor('#666')
                }.margin({ top: 8 })

                Row() {
                  Image($r("app.media.ic_more"))
                    .width(16)
                    .height(16)
                    .margin({ right: 5, top: 8 })
                  Text(this.exhibition.isFree ? '免费入场' : `票价: ¥${this.exhibition.price}`)
                    .fontSize(14)
                    .fontColor(this.exhibition.isFree ? '#07C160' : '#FF9500')
                }.margin({ top: 8 })
              }
              .width('100%')
              .margin({ bottom: 20 })

              this.buildTags(this.exhibition.tags)

              Text('展览介绍')
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .margin({ bottom: 10 })
                .width('100%')
                .textAlign(TextAlign.Start)

              Text(this.exhibition.detailDescription)
                .fontSize(16)
                .lineHeight(24)
                .margin({ bottom: 25 })
                .width('100%')
                .textIndent(32)
                .letterSpacing(0.5)

              if (this.exhibition.audioGuide || this.exhibition.vrTour) {
                Text('特色服务')
                  .fontSize(18)
                  .fontWeight(FontWeight.Bold)
                  .margin({ bottom: 10 })
                  .width('100%')
                  .textAlign(TextAlign.Start)

                Row() {
                  if (this.exhibition.audioGuide) {
                    Row() {
                      Column(){
                        Image($r("app.media.ic_micro"))
                          .width(24)
                          .height(24)
                        Text('语音导览')
                          .fontSize(12)
                          .margin({ top: 4 })
                      }
                      .margin({ right: 20 })
                      Column(){
                        Image($r("app.media.ic_listen"))
                          .width(24)
                          .height(24)
                        Text('语音讲解')
                          .fontSize(12)
                          .margin({ top: 4 })
                      }
                      .margin({ right: 20 })
                      Column(){
                        Image($r("app.media.ic_chuang"))
                          .width(24)
                          .height(24)
                        Text('创意文化')
                          .fontSize(12)
                          .margin({ top: 4 })
                      }
                      .margin({ right: 20 })
                    }
                    .margin({ right: 20 })
                  }
                  if (this.exhibition.vrTour) {
                    Column() {
                      Image($r("app.media.ic_VR"))
                        .width(24)
                        .height(24)
                      Text('VR体验')
                        .fontSize(12)
                        .margin({ top: 4 })
                    }
                  }
                }
                .width('100%')
                .margin({ bottom: 25 })
              }

              Button('立即预约参观', { type: ButtonType.Capsule })
                .width('90%')
                .height(50)
                .fontSize(18)
                .backgroundColor('#FF9500')
                .margin({ bottom: 20 })
                .onClick(() => {
                  AlertDialog.show(
                    {
                      title: '预约成功',
                      message: '您已成功预约参观该展览',
                      confirm: {
                        value: '确定',
                        action: () => {
                          console.log('用户确认预约');
                        }
                      },
                      cancel: () => {
                        console.log('用户关闭弹窗');
                      }
                    }
                  )
                })
            }
            .padding({bottom:20,left:20,right:20})
          }
          .scrollable(ScrollDirection.Vertical)
          .scrollBar(BarState.On)  // 开启滚动条
          .scrollBarColor(Color.Gray)  // 设置滚动条颜色
          .scrollBarWidth(4)  // 设置滚动条宽度
          .onScroll((scrollOffset: number) => {
            this.handleScroll(scrollOffset)
          })
          .width('100%')
          .height('100%')

          // 返回顶部按钮
          if (this.showBackToTop) {
            Button() {
              Image($r('app.media.ic_back_top'))  // 确保有这个图标资源
                .width(24)
                .height(24)
            }
            .width(48)
            .height(48)
            .backgroundColor('#4A6DA7')
            .borderRadius(24)
            .opacity(0.8)
            .position({ x: '85%', y: '80%' })
            .onClick(() => {
              this.scrollToTop()
            })
          }
        }
        .width('100%')
        .height('100%')
      } else {
        Column() {
          if (this.exhibitionId) {
            Text('未找到展览信息')
              .fontSize(18)
              .fontColor('#999')
          } else {
            Progress({
              type: ProgressType.Ring,
              value: 0
            })
              .width(50)
              .height(50)
          }
        }
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#f5f7fa')
  }
}