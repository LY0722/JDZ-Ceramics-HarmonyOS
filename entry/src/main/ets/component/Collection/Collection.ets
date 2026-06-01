import router from '@ohos.router';
import prompt from '@ohos.prompt';
import { CollectionData } from './CollectionDataModel';
import { DYNASTIES, getAllCollectionData } from './CollectionUtils';

@Entry
@Component
export struct Collection {
  // 当前选中的朝代索引
  @State currentDynastyIndex: number = 0
  // 所有陶瓷数据
  @State collectionList: Array<CollectionData> = []
  // 导航栏滚动控制器
  private navScroller: Scroller = new Scroller()
  // 内容区滚动控制器
  private contentScroller: Scroller = new Scroller()
  // 搜索相关状态
  @State searchText: string = ''
  @State isSearching: boolean = false
  @State showSearchModal: boolean = false
  // 原始数据备份
  private allCollectionData: Array<CollectionData> = []
  // 当前朝代的原始数据备份
  private currentDynastyData: Array<CollectionData> = []
  // 是否显示回到顶部按钮
  @State showBackToTop: boolean = false

  aboutToAppear() {
    this.allCollectionData = getAllCollectionData()
    this.loadCollectionData(this.currentDynastyIndex)
  }

  // 加载对应朝代的陶瓷数据
  loadCollectionData(index: number) {
    this.currentDynastyIndex = index
    this.isSearching = false
    this.currentDynastyData = this.allCollectionData.filter(item => item.period === index)
    this.collectionList = this.currentDynastyData
    this.navScroller.scrollTo({
      xOffset: 0,
      yOffset: index * 48,
      animation: { duration: 200, curve: Curve.EaseOut }
    })
    this.contentScroller.scrollTo({ xOffset: 0, yOffset: 0 })
    this.showBackToTop = false
  }

  // 执行搜索
  performSearch() {
    if (this.searchText.trim() === '') {
      prompt.showToast({ message: '请输入搜索内容', duration: 2000 })
      return
    }

    this.isSearching = true
    const searchTerm = this.searchText.toLowerCase()

    this.collectionList = this.allCollectionData.filter(item =>
    item.name.toLowerCase().includes(searchTerm) ||
    item.dynasty.toLowerCase().includes(searchTerm) ||
    item.description.toLowerCase().includes(searchTerm) ||
    item.museum.toLowerCase().includes(searchTerm) ||
    item.material.toLowerCase().includes(searchTerm)
    )

    if (this.collectionList.length === 0) {
      prompt.showToast({ message: '未找到相关瓷器', duration: 2000 })
    }

    this.showSearchModal = false
    this.searchText = ''
    this.contentScroller.scrollTo({ xOffset: 0, yOffset: 0 })
    this.showBackToTop = false
  }

  // 清除搜索
  clearSearch() {
    this.isSearching = false
    this.searchText = ''
    this.collectionList = this.currentDynastyData
    this.contentScroller.scrollTo({ xOffset: 0, yOffset: 0 })
    this.showBackToTop = false
  }

  // 打开搜索框
  openSearch() {
    this.showSearchModal = true
    this.collectionList = []
  }

  // 处理内容区滚动事件
  handleContentScroll(scrollOffset: number) {
    this.showBackToTop = scrollOffset > 500
  }

  // 回到顶部
  scrollToTop() {
    this.contentScroller.scrollTo({ xOffset: 0, yOffset: 0 })
    this.showBackToTop = false
  }

  build() {
    Row() {
      // 左侧朝代导航栏 - 简洁竖线风格
      Column() {
        // 标题
        Text('中国陶瓷')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20, bottom: 15 })
          .width('100%')
          .textAlign(TextAlign.Center)
          .fontColor('#333333')

        Scroll(this.navScroller) {
          Column() {
            ForEach(DYNASTIES, (dynasty: string, index: number) => {
              Row() {
                // 选中状态竖线指示器
                Column()
                  .width(4)
                  .height(24)
                  .backgroundColor(this.currentDynastyIndex === index ? '#4A6DA7' : 'transparent')
                  .margin({ right: 8 })

                // 导航项文本
                Text(dynasty)
                  .fontSize(16)
                  .fontColor(this.currentDynastyIndex === index ? '#4A6DA7' : '#555555')
                  .fontWeight(this.currentDynastyIndex === index ? FontWeight.Medium : FontWeight.Normal)
                  .height(48)
                  .textAlign(TextAlign.Start)
              }
              .width('100%')
              .padding({ left: 16, right: 16 })
              .backgroundColor(this.currentDynastyIndex === index ? '#F0F4FA' : '#FFFFFF')
              .onClick(() => {
                this.loadCollectionData(index)
              })
            }, (dynasty: string) => dynasty)
          }
          .width('100%')
          .margin({top:-240})
        }
        .scrollable(ScrollDirection.Vertical)
        .scrollBar(BarState.Off)  // 保持左侧导航栏滚动条关闭
        .width('100%')
        .height('100%')
      }
      .width('25%')
      .height('100%')
      .backgroundColor('#FFFFFF')
      .borderWidth({ right: 1 })
      .borderColor({ right: '#EEEEEE' })

      // 右侧陶瓷瀑布流展示区
      Column() {
        // 顶部标题栏
        Row() {
          if (this.isSearching) {
            Text('搜索结果')
              .fontSize(22)
              .fontWeight(FontWeight.Bold)
              .fontColor('#333333')
              .margin({ left: 20 })

            Blank()

            Text('x')
              .width(24)
              .height(24)
              .margin({ right: 20 })
              .onClick(() => {
                this.clearSearch()
              })
          } else {
            Text(DYNASTIES[this.currentDynastyIndex] + '陶瓷')
              .fontSize(22)
              .fontWeight(FontWeight.Bold)
              .fontColor('#333333')
              .margin({ left: 20 })

            Blank()

            Image($r('app.media.ic_search_icon'))
              .width(24)
              .height(24)
              .margin({ right: 20 })
              .onClick(() => {
                this.openSearch()
              })
          }
        }
        .width('100%')
        .height(60)
        .justifyContent(FlexAlign.SpaceBetween)
        .alignItems(VerticalAlign.Center)
        .backgroundColor('#FFFFFF')
        .borderWidth({ bottom: 1 })
        .borderColor({ bottom: '#EEEEEE' })

        // 修改后的瀑布流区域（带滚动条）
        Stack() {
          Scroll(this.contentScroller) {
            Column(){
              WaterFlow() {
                if (this.showSearchModal) {
                  FlowItem() {
                    Column() {
                      // 空状态
                    }
                    .width('100%')
                    .height('100%')
                  }
                } else {
                  ForEach(this.collectionList, (item: CollectionData) => {
                    FlowItem() {
                      Column() {
                        Stack() {
                          Image(item.imageUrl)
                            .width('100%')
                            .height(item.height)
                            .objectFit(ImageFit.Cover)
                            .onError(() => {
                              item.imageUrl = $r('app.media.default_img')
                            })
                        }
                        .width('100%')
                        .height(item.height)
                        .margin({ bottom: 8 })

                        Column() {
                          Text(item.name)
                            .fontSize(16)
                            .fontWeight(FontWeight.Medium)
                            .fontColor('#333333')
                            .margin({ bottom: 4 })

                          Text(item.dynasty)
                            .fontSize(12)
                            .fontColor('#999999')
                            .margin({ bottom: 6 })

                          Text(item.description)
                            .fontSize(12)
                            .fontColor('#666666')
                            .maxLines(2)
                            .textOverflow({ overflow: TextOverflow.Ellipsis })

                          Text('材质: ' + item.material)
                            .fontSize(12)
                            .fontColor('#666666')
                            .margin({ top: 4 })

                          Text('馆藏: ' + item.museum)
                            .fontSize(12)
                            .fontColor('#666666')
                            .margin({ top: 2 })
                        }
                        .padding({ left: 8, right: 8 })
                        .width('100%')
                      }
                      .backgroundColor('#FFFFFF')
                      .margin({ bottom: 15, left: 10, right: 10 })
                      .onClick(() => {
                        router.pushUrl({
                          url: 'pages/CollectionDetailPage',
                          params: { collectionData: JSON.stringify(item) }
                        })
                      })
                    }
                  }, (item: CollectionData) => item.id.toString())
                }
              }
              .columnsGap(15)
              .rowsGap(15)
              .padding(15)
              .width('100%')
              .height('auto')
              .backgroundColor('#F5F7FA')
            }
            .width('100%')
            .height('auto')
          }
          .scrollable(ScrollDirection.Vertical)
          .scrollBar(BarState.On)
          .scrollBarColor(Color.Gray)
          .scrollBarWidth(12)
          .edgeEffect(EdgeEffect.Spring)
          .onScroll((scrollOffset: number) => {
            this.handleContentScroll(scrollOffset)
          })
          .width('100%')
          .height('100%')
          .margin({bottom:20})

          // 回到顶部按钮
          if (this.showBackToTop) {
            Button() {
              Image($r('app.media.ic_back_top'))
                .width(24)
                .height(24)
            }
            .width(48)
            .height(48)
            .backgroundColor('#4A6DA7')
            .borderRadius(24)
            .opacity(0.8)
            .position({ x: '80%', y: '80%' })  // 调整位置
            .onClick(() => {
              this.scrollToTop()
            })
          }
        }
        .width('100%')
        .height('100%')
        .layoutWeight(1)  // 添加layoutWeight确保填充空间
      }
      .width('78%')
      .height('100%')

      // 搜索弹窗
      if (this.showSearchModal) {
        Column() {
          Column()
            .width('100%')
            .height('100%')
            .backgroundColor('#000000')
            .opacity(0.5)
            .onClick(() => {
              this.showSearchModal = false
              this.clearSearch()
            })

          Column() {
            Row() {
              TextInput({ placeholder: '输入瓷器名称、朝代或描述...', text: this.searchText })
                .width('80%')
                .height(50)
                .fontSize(16)
                .onChange((value: string) => {
                  this.searchText = value
                })

              Button('搜索')
                .width('20%')
                .height(50)
                .fontSize(16)
                .fontColor('#FFFFFF')
                .backgroundColor('#4A6DA7')
                .onClick(() => {
                  this.performSearch()
                })
            }
            .width('90%')
            .margin({ top: -90, bottom: 10 })
            .borderRadius(8)
            .backgroundColor('#FFFFFF')
          }
          .width('100%')
          .position({ x: 0, y: 100 })
        }
        .width('100%')
        .height('100%')
        .position({ x: 0, y: 0 })
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F7FA')
  }
}