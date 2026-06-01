import { router } from "@kit.ArkUI";
import { ExhibitionItem, EXHIBITION_DATA } from "../Exhibit/ExhibitionData"
import promptAction from '@ohos.promptAction';
import preferences from '@ohos.data.preferences';
import { OrderList } from "./OrderList";
import { CollectionData } from "../Collection/CollectionDataModel";
import { knowledgeData, KnowledgeItem } from "../Knowledge/KnowledgeData";
import { getAllCollectionData } from "../Collection/CollectionUtils";
import { CollectionList } from "./CollectionList";
import { KnowledgeList } from "./KnowledgeList";
import { UserData } from "./UserData";
import { Account } from "./Account";
import { Message } from "./Message";
import { Feedback } from "./Feedback";
import { About } from "./About";

@Preview({
  title: 'UserProfile'
})
@Component
export struct Users {
  @State isLoggedIn: boolean = false;
  @State userInfo: UserData = new UserData('博物馆爱好者', $r('app.media.tx1'), '普通会员', 450, '151****2557');

  @State showOrderList: boolean = false;
  @State showCollectionList: boolean = false;
  @State showKnowledgeList: boolean = false;
  @State showAccount: boolean = false;
  @State showMessage: boolean = false;
  @State showFeedback: boolean = false;
  @State showAbout: boolean = false;

  @State bookedExhibitions: ExhibitionItem[] = [];
  @State collectedItems: CollectionData[] = [];
  @State knowledgeRecords: KnowledgeItem[] = [];



  @State functionList: FunctionItem[] = [
    new FunctionItem($r('app.media.ic_orders'), '我的预约', 'pages/Appointment'),
    new FunctionItem($r('app.media.ic_service_normal'), '收藏展品', 'pages/Collections'),
    new FunctionItem($r('app.media.ic_history'), '科普记录', 'pages/KnowledgeRecords'),
    new FunctionItem($r('app.media.ic_manage'), '账号管理', 'pages/Account'),
    new FunctionItem($r('app.media.ic_message'), '消息通知', 'pages/Notifications'),
    new FunctionItem($r('app.media.ic_feedback'), '意见反馈', 'pages/Feedback'),
    new FunctionItem($r('app.media.ic_about'), '关于我们', 'pages/About'),
  ]

  aboutToAppear() {
    this.checkLoginStatus();
    this.loadUserData();
  }

  async loadUserData() {
    this.bookedExhibitions = EXHIBITION_DATA.filter(item => item.id % 2 === 0);
    this.collectedItems = getAllCollectionData().filter(item => item.id % 3 === 0);
    this.knowledgeRecords = knowledgeData.filter(item => !item.isCollected);
  }

  async checkLoginStatus() {
    try {
      const pref = await preferences.getPreferences(getContext(this), 'userPrefs');
      const loggedIn = await pref.get('isLoggedIn', false);
      this.isLoggedIn = Boolean(loggedIn);

      if (this.isLoggedIn) {
        const username = await pref.get('username', '博物馆爱好者');
        const phone = await pref.get('phone', '151****2557');

        if (typeof username === 'string') {
          this.userInfo.name = username;
        }
        if (typeof phone === 'string') {
          this.userInfo.phone = phone;
        }
      }
    } catch (e) {
      console.error(`Failed to check login status, error: ${e}`);
      this.isLoggedIn = false;
    }
  }

  @Builder
  buildFunctionList() {
    Column() {
      ForEach(this.functionList, (item: FunctionItem, index: number) => {
        Column() {
          if (index === 3) {
            Column()
              .width('100%')
              .height(12)
              .backgroundColor('#F5F5F5')
          }

          Row() {
            Image(item.icon)
              .width(28)
              .height(28)
              .margin({ left: 16, right: 12 })

            Text(item.name)
              .fontSize(18)
              .fontColor('#333')

            Blank()

            Image($r('app.media.ic_detail'))
              .width(20)
              .height(20)
              .margin({ right: 16 })
          }
          .height(60)
          .width('100%')
          .backgroundColor('#FFFFFF')
          .onClick(() => {
            if (item.name === '我的预约') {
              this.showOrderList = true;
            } else if (item.name === '收藏展品') {
              this.showCollectionList = true;
            } else if (item.name === '科普记录') {
              this.showKnowledgeList = true;
            } else if (item.name === '账号管理') {
              this.showAccount = true;
            } else if (item.name === '消息通知') {
              this.showMessage = true;
            } else if (item.name === '意见反馈') {
              this.showFeedback = true;
            } else if (item.name === '关于我们') {
              this.showAbout = true;
            }
          })
        }
      })
    }
    .width('100%')
    .backgroundColor('#FFFFFF')
  }

  build() {
    Stack() {
      Column() {
        if (this.isLoggedIn) {
          Column() {
            this.buildTopBar()
            this.buildUserInfo()
          }
          .backgroundImage($r('app.media.bjtp'))
          .backgroundImageSize(ImageSize.Cover)
          .margin({ top: -40 })

          this.buildFunctionList()
        } else {
          this.buildLoginPrompt()
        }
      }
      .width('100%')
      .height('100%')
      .backgroundColor('#F5F5F5')
      .margin({ top: 0 })

      // 预约列表弹窗
      if (this.showOrderList) {
        Column() {
          OrderList({ exhibitionList: $bookedExhibitions })
        }
        .onClick(() => {
          this.showOrderList = false
        })
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .backgroundColor('#80000000')
      }

      // 收藏展品弹窗
      if (this.showCollectionList) {
        Column() {
          CollectionList({ collectionList: $collectedItems })
        }
        .onClick(() => {
          this.showCollectionList = false
        })
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .backgroundColor('#80000000')
      }

      // 科普记录弹窗
      if (this.showKnowledgeList) {
        Column() {
          KnowledgeList({ knowledgeList: $knowledgeRecords })
        }
        .onClick(() => {
          this.showKnowledgeList = false
        })
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .backgroundColor('#80000000')
      }
      if (this.showAccount) {
        Column() {
          Account({ userInfo: $userInfo }) // 使用$传递响应式变量
        }
        .onClick(() => {
          this.showAccount = false;
          this.checkLoginStatus(); // 关闭时重新检查登录状态
        })
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .backgroundColor('#80000000')
      }

      if (this.showMessage) {
        Column() {
          Message()
        }
        .onClick(() => {
          this.showMessage = false
        })
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .backgroundColor('#80000000')
      }

      if (this.showFeedback) {
        Column() {
          Feedback()
        }
        .onClick(() => {
          this.showFeedback = false
        })
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .backgroundColor('#80000000')
      }

      if (this.showAbout) {
        Column() {
          About()
        }
        .onClick(() => {
          this.showAbout = false
        })
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .backgroundColor('#80000000')
      }
    }
  }

  @Builder
  buildTopBar() {
    Row() {
      Text('我的')
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .margin({ left: 16 })

      Blank()

      Image($r('app.media.ic_drop'))
        .width(28)
        .height(28)
        .margin({ right: 16 })
        .onClick(async () => {
          if (this.isLoggedIn) {
            try {
              const pref = await preferences.getPreferences(getContext(this), 'userPrefs');
              await pref.put('isLoggedIn', false);
              await pref.flush();
              this.isLoggedIn = false;
              promptAction.showToast({ message: '已退出登录', duration: 2000 });
            } catch (e) {
              console.error(`Failed to logout, error: ${e}`);
            }
          }
        })
    }
    .width('100%')
    .height(56)
    .justifyContent(FlexAlign.SpaceBetween)
    .alignItems(VerticalAlign.Center)
    .margin({ top: 48 })
  }

  @Builder
  buildUserInfo() {
    Column() {
      Image(this.userInfo.avatar)
        .width(90)
        .height(90)
        .borderRadius(45)
        .margin({ top: 20, bottom: 12 })

      Text(this.userInfo.name)
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 8 })

      Text(this.userInfo.phone)
        .fontSize(16)
        .fontColor('#666')
    }
    .width('100%')
    .alignItems(HorizontalAlign.Center)
    .padding({ bottom: 20 })
  }

  @Builder
  buildLoginPrompt() {
    Column() {
      Image($r('app.media.tab_my'))
        .width(130)
        .height(130)
        .margin({ bottom: 20, top: 40 })

      Text('您还未登录')
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('登录后可查看个人信息、收藏和参观记录')
        .fontSize(16)
        .fontColor('#666')
        .margin({ bottom: 20 })

      Button('立即登录', { type: ButtonType.Capsule })
        .width(220)
        .height(45)
        .backgroundColor('#1a73e8')
        .fontColor(Color.White)
        .onClick(() => {
          router.pushUrl({ url: 'component/My/LoginPage' });
        })
    }
    .width('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}

class FunctionItem {
  icon: Resource;
  name: string;
  page: string;

  constructor(icon: Resource, name: string, page: string) {
    this.icon = icon;
    this.name = name;
    this.page = page;
  }
}