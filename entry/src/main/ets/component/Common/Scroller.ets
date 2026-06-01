// Scroller.ets
@Component
export struct ScrollComponent {
  private scroller: Scroller = new Scroller();
  @State private showScrollBar: boolean = false;
  @State private showBackToTop: boolean = false;

  @BuilderParam content: () => void;

  private scrollToTop() {
    this.scroller.scrollTo({
      xOffset: 0,
      yOffset: 0,
      animation: {
        duration: 300,
        curve: Curve.EaseOut
      }
    });
    this.showBackToTop = false;
  }

  @Builder
  private BackToTopButton() {
    Column() {
      Image($r("app.media.ic_back_top"))
        .width(24)
        .height(24)
    }
    .width(48)
    .height(48)
    .borderRadius(24)
    .backgroundColor('#ffffff')
    .shadow({ radius: 8, color: '#20000000', offsetX: 0, offsetY: 2 })
    .position({ x: '90%', y: '85%' })
    .zIndex(999)
    .opacity(this.showBackToTop ? 1 : 0)
    .onClick(() => {
      this.scrollToTop();
    })
  }

  @Builder
  private CustomScrollBar() {
    Column()
      .width(6)
      .height('30%') // 动态高度更符合实际滚动比例
      .backgroundColor('#888888')
      .borderRadius(3)
      .opacity(0.6)
      .position({ x: '100%' })
      .margin({ right: 4 })
  }

  build() {
    Stack() {
      Scroll(this.scroller) {
        this.content()
      }
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.Off)
      .width('100%')
      .height('100%')
      .onScroll((xOffset: number, yOffset: number) => {
        console.log('当前滚动位置:', yOffset); // 添加日志确认是否触发滚动
        this.showScrollBar = true;
        this.showBackToTop = yOffset > 500;
      })
      .onScrollStop(() => {
        setTimeout(() => {
          this.showScrollBar = false;
        }, 1000);
      })

      // 滚动条容器
      Column() {
        if (this.showScrollBar) {
          this.CustomScrollBar()
        }
      }
      .width(10)
      .height('100%')
      .position({ x: '100%' })
      .margin({ right: 4 })

      this.BackToTopButton()
    }
    .width('100%')
    .height('100%')
  }
}