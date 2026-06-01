import { promptAction } from "@kit.ArkUI"

// components/home/SearchBar.ets
@Component
export struct SearchBar {
  private searchController: SearchController = new SearchController()
  @State currentIndex: number = 0
  @State searchText: string = ''
  @State keyword: string = ''

  build() {
    Row() {
      Text('搜索')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .width('10%')
        .textAlign(TextAlign.Start)
        .margin({top:1,left:3,right:3})
      Search({
        placeholder: '搜索陶瓷名称、朝代或工艺...',
        controller: this.searchController
      })
        .placeholderFont({ size: 14 })
        .textFont({ size: 14 })
        .onChange((value: string) => {
          this.searchText = value
        })
        .onSubmit(() => {
          // 搜索提交逻辑
          promptAction.showToast({ message: `搜索: ${this.searchText}`, duration: 1000 })
        })
        .width('83%')
        .height(40)
        .backgroundColor(Color.White)
        .borderRadius(20)
        .margin({ top: 1 })
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
  }
}