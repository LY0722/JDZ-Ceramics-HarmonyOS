// ExhibitionWaterfall.ets
import { ExhibitionItem, FilterOption, EXHIBITION_DATA } from './ExhibitionData';
import router from '@ohos.router';

@Entry
@Component
export struct Exhibits {
  @State currentFilter: number = 0; // 当前选中的筛选索引
  @State exhibitionList: ExhibitionItem[] = []; // 展览数据
  @State originalData: ExhibitionItem[] = []; // 原始数据
  private scroller: Scroller = new Scroller(); // 滚动控制器
  @State showBackToTop: boolean = false; // 是否显示返回顶部按钮

  // 筛选选项
  private filterOptions: FilterOption[] = [
    { id: 0, name: '全部展览' },
    { id: 1, name: '历史陶瓷' },
    { id: 2, name: '当代陶艺' },
    { id: 3, name: '陶瓷工艺' },
    { id: 4, name: '文化专题' },
    { id: 5, name: '免费展览' },
    { id: 6, name: '景德镇本地' }
  ];

  aboutToAppear() {
    this.loadExhibitionData();
    this.filterExhibitions();
  }

  // 从数据模块加载展览数据
  loadExhibitionData() {
    this.originalData = [...EXHIBITION_DATA];
  }

  // 处理筛选点击
  handleFilterClick(index: number) {
    this.currentFilter = index;
    this.filterExhibitions();
    this.scrollToTop(); // 筛选时自动回到顶部
  }

  // 筛选展览数据
  filterExhibitions() {
    switch(this.currentFilter) {
      case 0: // 全部展览
        this.exhibitionList = [...this.originalData];
        break;
      case 1: // 特展推荐
        this.exhibitionList = this.originalData.filter(item => item.category === 1);
        break;
      case 2: // 历史文物
        this.exhibitionList = this.originalData.filter(item => item.category === 2);
        break;
      case 3: // 艺术绘画
        this.exhibitionList = this.originalData.filter(item => item.category === 3);
        break;
      case 4: // 自然科技
        this.exhibitionList = this.originalData.filter(item => item.category === 4);
        break;
      case 5: // 免费展览
        this.exhibitionList = this.originalData.filter(item => item.isFree);
        break;
      default:
        this.exhibitionList = [...this.originalData];
    }
  }

  // 处理展览项点击
  handleExhibitionClick(item: ExhibitionItem) {
    router.pushUrl({
      url: 'component/Exhibit/Exhibit',
      params: {
        id: item.id.toString() // 确保转换为字符串
      }
    }).catch((err: Error) => {  // 显式声明 err 为 Error 类型
      console.error('路由跳转失败:', err);
    });
  }


  // 返回顶部
  scrollToTop() {
    this.scroller.scrollTo({ xOffset: 0, yOffset: 0 });
    this.showBackToTop = false;
  }

  build() {
    Column() {
      // 顶部筛选栏
      this.buildFilterBar()


      //瀑布流展览区域
        Scroll(this.scroller) {
          this.buildWaterfall()
        }
        .height('auto')
        .scrollBar(BarState.On) // 开启滚动条
        .scrollBarColor(Color.Gray)
        .scrollBarWidth(4) // 设置滚动条宽度
        .onDidScroll(()=>{
          if(this.scroller.currentOffset().yOffset < 50){
            this.showBackToTop = false;
          } else {
            this.showBackToTop = true;
          }
        })

        // 返回顶部按钮
        if (this.showBackToTop) {
          Button() {
            Image($r('app.media.ic_back_top')) // 确保有这个图标资源
              .width(24)
              .height(24)
          }
          .zIndex(999) // 确保按钮在最上层
          .width(40)
          .height(40)
          .backgroundColor('#EEF3F4')
          .borderRadius(24)
          .opacity(0.8)
          .position({ x: '85%', y: '100%' })
          .onClick(() => {
            this.scrollToTop()
          })
        }
    }
    .margin({bottom:20})
    .padding({ bottom: 70 })
    .width('100%')
    .height('100%')
    .backgroundColor('#f5f7fa')
  }

  @Builder
  buildFilterBar() {
    Scroll() {
      Row() {
        ForEach(this.filterOptions, (filter: FilterOption, index: number) => {
          Row() {
            // 选中状态竖线指示器
            Column()
              .width(4)
              .height(24)
              .backgroundColor(this.currentFilter === index ? '#4A6DA7' : 'transparent')
              .margin({ right: 8 })

            // 分类文本
            Text(filter.name)
              .fontSize(16)
              .fontColor(this.currentFilter === index ? '#4A6DA7' : '#555555')
              .fontWeight(this.currentFilter === index ? FontWeight.Medium : FontWeight.Normal)
              .height(48)
              .textAlign(TextAlign.Start)
          }
          .width('28%')
          .padding({ left: 16, right: 16 })
          .backgroundColor(this.currentFilter === index ? '#F0F4FA' : '#FFFFFF')
          .borderRadius(8)
          .margin({ right: 10 })
          .onClick(() => this.handleFilterClick(index))
        })
      }
      .padding({ left: 10, top: 10, bottom: 10, right: 10 })
      .height(60)
    }
    .scrollable(ScrollDirection.Horizontal)
    .scrollBar(BarState.Off)
    .width('100%')
    .backgroundColor('#FFFFFF')
    .borderRadius(12)
    .margin({ top: 10, left: 10, right: 10 })
    .shadow({ radius: 3, color: '#10000000', offsetX: 0, offsetY: 1 })
  }

  // 构建瀑布流布局
  @Builder
  buildWaterfall() {
    WaterFlow() {
      ForEach(this.exhibitionList, (item: ExhibitionItem) => {
        FlowItem() {// 内置的流式布局子项组件
          this.buildExhibitionCard(item)
        }
      })
    }
    .height('auto')
    .columnsTemplate('1fr 1fr')
    .columnsGap(10)
    .rowsGap(10)
    .padding(10)
    .backgroundColor('#f5f7fa')
  }

  // 构建展览卡片
  @Builder
  buildExhibitionCard(item: ExhibitionItem) {
    Column() {
      // 展览图片
      Stack() {
        Image(item.image)
          .width('100%')
          .objectFit(ImageFit.Contain)

        // 免费标签
        if (item.isFree) {
          Text('免费')
            .fontSize(12)
            .fontColor('#ffffff')
            .padding({ left: 8, right: 8, top: 4, bottom: 4 })
            .backgroundColor('#1296db')
            .borderRadius(4)
            .margin({ top: 8, right: 8 })
            .position({ x: '0%', y: '0%' })
            .align(Alignment.TopEnd)
        }
      }
      .margin({ bottom: 8 })

      // 展览标题
      Text(item.title)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .fontColor('#333')
        .maxLines(2)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .margin({ bottom: 4 })
        .width('100%')
        .textAlign(TextAlign.Center)

      // 展览日期
      Text(item.date)
        .fontSize(12)
        .fontColor('#666')
        .width('100%')
        .textAlign(TextAlign.Start)
        .margin({ bottom: 6 })

      // 展览描述
      Text(item.description)
        .fontSize(13)
        .fontColor('#666')
        .maxLines(2)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .width('100%')
        .textAlign(TextAlign.Start)
    }
    .padding(12)
    .backgroundColor(Color.White)
    .shadow({ radius: 6, color: '#1a000000', offsetX: 1, offsetY: 2 })
    .onClick(() => this.handleExhibitionClick(item))
  }
}