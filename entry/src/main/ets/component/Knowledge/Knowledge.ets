import router from '@ohos.router';
import { KnowledgeItem, knowledgeData } from './KnowledgeData';

@Entry
@Component
export struct Knowledge {
  @State knowledgeList: Array<KnowledgeItem> = knowledgeData;
  private scroller: Scroller = new Scroller(); // 修改为 Scroller
  @State showBackToTop: boolean = false;

  // 左滑收藏功能
  @Builder swipeAction(index: number) {

    Row() {
      Button(this.knowledgeList[index].isCollected ? '取消收藏' : '收藏')
        .width(80)
        .height('100%')
        .backgroundColor(this.knowledgeList[index].isCollected ? '#FF9800' : '#4DB6AC')
        .fontColor(Color.White)
        .borderRadius(12)
        .onClick(() => {
          this.knowledgeList = this.knowledgeList.map((item, i) => {
            if (i === index) {
              return {
                id: item.id,
                era: item.era,
                title: item.title,
                content: item.content,
                isCollected: !item.isCollected
              }
            }
            return item
          })
        })
    }
    .justifyContent(FlexAlign.End)
    .height(170)

    .padding(8);

  }

  // 跳转到视频播放页面
  navigateToVideo() {
    router.pushUrl({
      url: 'pages/VideoPlayer',
      params: {
        videoSrc: $rawfile('jdz.mp4')
      }
    });
  }

  // 回到顶部
  scrollToTop() {
    this.scroller.scrollToIndex(0);
    this.showBackToTop = false;
  }

  // 处理滚动事件
  handleScroll(scrollOffset: number) {
    this.showBackToTop = scrollOffset > 500;
  }
  build() {
    Column() {
      // 标题栏
      Row() {
        Text('一起走进陶瓷吧')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ left: 12 })
          .layoutWeight(1)
          .textAlign(TextAlign.Center)
          .fontColor('#333333');

        // 添加视频图标按钮
        Button() {
          Image($r('app.media.ic_video'))
            .width(24)
            .height(24)
        }
        .width(40)
        .height(40)
        .margin({ right: 8 })
        .backgroundColor(Color.Transparent)
        .onClick(() => {
          this.navigateToVideo();
        })
      }
      .width('100%')
      .height(56)
      .backgroundColor('#FFFFFF')
      .alignItems(VerticalAlign.Center)
      .shadow({ radius: 4, color: '#00000010', offsetX: 0, offsetY: 2 });

      Stack(){
        // 知识列表
        List({ space: 12, scroller: this.scroller }) {  // 修改为 scroller
          ForEach(this.knowledgeList, (item: KnowledgeItem, index: number) => {
            ListItem() {
              Swiper() {
                // 主内容
                Column() {
                  // 标题部分
                  Column() {
                    Text(item.title)
                      .fontSize(18)
                      .fontWeight(FontWeight.Bold)
                      .fontColor('#333333')
                      .margin({ top: 12, left: 16, right: 16 });

                    Text(item.era)
                      .fontSize(12)
                      .fontColor('#666666')
                      .margin({ top: 4, left: 16, right: 16, bottom: 8 });
                  }
                  .width('100%')

                  // 分割线
                  Divider()
                    .strokeWidth(1)
                    .color('#EEEEEE')
                    .margin({ left: 16, right: 16 });

                  // 内容部分
                  Text(item.content)
                    .fontSize(14)
                    .lineHeight(20)
                    .fontColor('#555555')
                    .margin({ top: 8, left: 16, right: 16, bottom: 12 })
                    .textAlign(TextAlign.Start)
                    .flexShrink(1);

                  // 统计信息
                  Row() {
                    Text(`共${this.knowledgeList.length}条知识`)
                      .fontSize(12)
                      .fontColor('#666666');

                    Text(`已收藏${this.knowledgeList.filter(item => item.isCollected).length}条`)
                      .fontSize(12)
                      .fontColor('#666666')
                      .margin({ left: 12 });
                  }
                  .width('100%')
                  .padding({ left: 16, right: 16, bottom: 12 })
                  .justifyContent(FlexAlign.Start);
                }
                .width('100%')
                .backgroundColor('#FFF')
                .borderRadius(12)
                .border({ width: 1, color: '#E0E9FF' })
                .shadow({ radius: 6, color: '#00000010', offsetX: 0, offsetY: 2 })
                .height('auto')

                // 右滑操作项
                this.swipeAction(index);
              }
              .duration(150)
              .index(0)
              .autoPlay(false)
              .indicator(false)
              .loop(false)
              .effectMode(EdgeEffect.Spring);
            }
            .borderRadius(12)
            .margin({ left: 16, right: 16, top: 8, bottom: 8 })
            .height('auto');
          });
        }
        .width('100%')
        .height('100%')
        .layoutWeight(1)
        .margin({ top: 8 })
        .scrollBar(BarState.On)
        .scrollBarColor(Color.Gray)
        .scrollBarWidth(6)
        .edgeEffect(EdgeEffect.Spring)
        .onScroll((scrollOffset: number) => {
          this.handleScroll(scrollOffset);
        })
        .backgroundImage($r('app.media.background_knowledge'))
        .backgroundImageSize({height:'100%',width:'100%'})



        // 回到顶部按钮
        if(this.showBackToTop) {
          Button() {
            Image($r('app.media.ic_back_top'))
              .width(24)
              .height(24)
          }
          .width(48)
          .height(48)
          .backgroundColor('#FFFFFF')
          .borderRadius(24)
          .zIndex(1)
          .shadow({ radius: 4, color: '#00000020', offsetX: 0, offsetY: 2 })
          .position({ x: '85%', y: '80%' })
          .onClick(() => {
            this.scrollToTop();
          })
        }
      }
      .width('100%')
      .height('100%')
      .layoutWeight(1)

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F9FF');
  }
}