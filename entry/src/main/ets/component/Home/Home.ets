import { Banner } from "./Banner"
import { NewsList } from "./NewsList"
import { SearchBar } from "./SearchBar"
import { GuideService } from "./GuideService"
import { ExhibitionList } from "./ExhibitionList"
import { CollectionList } from "./CollectionList"

@Entry
@Component
export struct Home {
  build() {
    Scroll() {
      Column() {
        // 顶部标题栏
        Text('景德镇瓷典')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .fontColor('#1A1A1A')
          .margin({ bottom: 12 })

        SearchBar()
        Banner()
        NewsList()
        ExhibitionList()
        CollectionList()
        GuideService()
        // About()


      }
    }
  }
}