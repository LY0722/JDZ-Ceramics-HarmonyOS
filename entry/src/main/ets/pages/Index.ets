import { Home } from '../component/Home/Home'
import { Knowledge } from '../component/Knowledge/Knowledge'
import { Collection } from '../component/Collection/Collection'
import { Exhibits } from '../component/Exhibit/Exhibits'
import { Users } from '../component/My/Users'


@Entry
@Component
struct MuseumIndex {
  @State currentIndex: number = 0 // 当前选中标签页索引

  build() {
    Tabs({ barPosition: BarPosition.End, index: this.currentIndex }) {
      // 1. 首页展示
      TabContent() {
        Home()
      }.tabBar(this.buildTabBar(0, '首页', $r('app.media.tab_home'), $r('app.media.tab_home_active')))

      // 2. 知识百科
      TabContent() {
        Knowledge()
      }.tabBar(this.buildTabBar(1, '百科', $r('app.media.tab_knowledge'), $r('app.media.tab_knowledge_active')))

      // 3. 展览展品
      TabContent() {
        Collection()
      }.tabBar(this.buildTabBar(2, '瓷品', $r('app.media.tab_collection'), $r('app.media.tab_collection_active')))

      // 4. 导航路线
      TabContent() {
        Exhibits()
      }.tabBar(this.buildTabBar(3, '展览', $r('app.media.tab_exhibit'), $r('app.media.tab_exhibit_active')))

      // 5. 个人中心
      TabContent() {
        Users()
      }.tabBar(this.buildTabBar(4, '我的', $r('app.media.tab_my'), $r('app.media.tab_my_active')))
    }
    .barMode(BarMode.Fixed) // 固定底部导航栏
    .barWidth('100%') // 宽度100%
    .barHeight(60) // 高度60
    .backgroundColor('#ffffff') // 背景白色
    .onChange((index: number) => {
      this.currentIndex = index
    })
  }

  @Builder
  buildTabBar(itemIndex: number, title: string, normalIcon: Resource, selectedIcon: Resource) {
    Column() {
      // 图标（选中状态使用主题色）
      Image(this.currentIndex === itemIndex ? selectedIcon : normalIcon)
        .width(24)
        .height(24)
        .margin({ bottom: 4 })
        .objectFit(ImageFit.Contain)

      // 文字（选中状态使用主题色）
      Text(title)
        .fontSize(12)
        .fontColor(this.currentIndex === itemIndex ? '#1296db' : '#000000')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}