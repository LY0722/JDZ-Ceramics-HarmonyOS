// MyPage.ets
import { MuseumCollection, RecentVisit } from "../My/UserData";
import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import preferences from '@ohos.data.preferences';

@Entry
@Component
export struct User {
  @State isLoggedIn: boolean = false;
  @State userInfo: UserInfo = {
    name: '请登录',
    avatar: '/common/images/default_avatar.png',
    memberLevel: '',
    points: 0
  }

  @State collections: MuseumCollection[] = [
    new MuseumCollection('1', '青铜器收藏', 12, '../../resources/base/media/c1.jpg'),
    new MuseumCollection('2', '瓷器珍品', 8, '../../resources/base/media/c1.jpg'),
    new MuseumCollection('3', '书画艺术', 5, '../../resources/base/media/c1.jpg')
  ];

  @State recentVisits: RecentVisit[] = [
    new RecentVisit('1', '国家博物馆', '2023-05-15', '../../resources/base/media/c1.jpg'),
    new RecentVisit('2', '故宫博物院', '2023-04-22', '../../resources/base/media/c1.jpg'),
    new RecentVisit('3', '上海博物馆', '2023-03-10', '../../resources/base/media/c1.jpg')
  ];

  aboutToAppear() {
    this.checkLoginStatus();
  }

  async checkLoginStatus() {
    try {
      const pref = await preferences.getPreferences(getContext(this), 'userPrefs');
      const loggedIn = await pref.get('isLoggedIn', false);
      this.isLoggedIn = Boolean(loggedIn);

      if (this.isLoggedIn) {
        const username = await pref.get('username', '博物馆爱好者');
        if (typeof username === 'string') {
          this.userInfo.name = username;
        }
        // 加载会员等级和积分信息
        this.userInfo.memberLevel = await pref.get('memberLevel', '普通会员') as string;
        this.userInfo.points = Number(await pref.get('points', 0));
      } else {
        this.resetUserInfo();
      }
    } catch (e) {
      console.error(`Failed to check login status, error: ${e}`);
      this.isLoggedIn = false;
      this.resetUserInfo();
    }
  }

  resetUserInfo() {
    this.userInfo = {
      name: '请登录',
      avatar: '/common/images/default_avatar.png',
      memberLevel: '',
      points: 0
    };
  }

  async handleLogout() {
    try {
      const pref = await preferences.getPreferences(getContext(this), 'userPrefs');
      await pref.put('isLoggedIn', false);
      await pref.flush();
      this.isLoggedIn = false;
      this.resetUserInfo();
      promptAction.showToast({ message: '已退出登录', duration: 2000 });
    } catch (e) {
      console.error(`Failed to logout, error: ${e}`);
      promptAction.showToast({ message: '退出登录失败', duration: 2000 });
    }
  }

  build() {
    Column() {
      // 用户信息头部
        this.buildUserHeader()
      // 测试视图
      Text('测试背景色')
        .width('100%')
        .height(50)
        .backgroundColor('#f5e6c9') // 确认这个颜色是否能正常显示

      if (this.isLoggedIn) {
        // 功能快捷入口
        this.buildQuickActions()

        // 我的收藏
        Text('我的收藏')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20, left: 16, bottom: 10 })
          .width('100%')
          .textAlign(TextAlign.Start)

        this.buildCollections()

        // 最近参观
        Text('最近参观')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20, left: 16, bottom: 10 })
          .width('100%')
          .textAlign(TextAlign.Start)

        this.buildRecentVisits()
      } else {
        this.buildLoginPrompt()
      }

      // 底部设置等入口
      this.buildBottomActions()
    }
    .width('100%')
    .height('100%')
    // .backgroundColor('#F5F5F5')
  }

  @Builder
  buildLoginPrompt() {
    Column() {
      Image('/common/images/default_avatar.png')
        .width(120)
        .height(120)
        .borderRadius(60)
        .margin({ bottom: 20 })

      Text('您还未登录')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('登录后可查看个人收藏和参观记录')
        .fontSize(14)
        .fontColor('#666')
        .margin({ bottom: 20 })

      Button('立即登录', { type: ButtonType.Capsule })
        .width(200)
        .height(40)
        .backgroundColor('#1a73e8')
        .fontColor(Color.White)
        .onClick(() => {
          router.pushUrl({ url: '"component/My/User"' });
        })
    }
    .width('100%')
    .height(300)
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .margin({ top: 20 })
  }

  @Builder
  buildUserHeader() {
    Row() {
      Image(this.userInfo.avatar)
        .width(50)
        .height(50)
        .borderRadius(20)
        .margin({ right: 16 })

      Column() {
        Text(this.userInfo.name)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 6 })

        if (this.isLoggedIn) {
          Row() {
            Text(this.userInfo.memberLevel)
              .fontSize(14)
              .fontColor('#666')

            Divider()
              .vertical(true)
              .height(14)
              .margin({ left: 8, right: 8 })
              .color('#CCC')

            Text(`积分: ${this.userInfo.points}`)
              .fontSize(14)
              .fontColor('#666')
          }
          .alignItems(VerticalAlign.Center)
        }
      }
      .alignItems(HorizontalAlign.Start)
    }
    .width('100%')
    .padding(16)
    .backgroundColor('#f5e6c9')
    .margin({ bottom: 10 })
    .onClick(() => {
      if (!this.isLoggedIn) {
        router.pushUrl({ url: 'component/My/User' });
      }
    })
    .zIndex(1)  // 添加层级确保不被覆盖
  }

  @Builder
  buildQuickActions() {
    GridRow() {
      GridCol({ span: 6 }) {
        Column() {
          Image($r('app.media.ic_more'))
            .width(32)
            .height(32)
            .margin({ bottom: 8 })
          Text('我的门票')
            .fontSize(14)
        }
        .width('100%')
        .padding(12)
        .backgroundColor('#FFFFFF')
        .borderRadius(8)
        .onClick(() => {
          router.pushUrl({ url: 'pages/TicketPage' });
        })
      }

      GridCol({ span: 6 }) {
        Column() {
          Image($r('app.media.ic_more'))
            .width(32)
            .height(32)
            .margin({ bottom: 8 })
          Text('活动预约')
            .fontSize(14)
        }
        .width('100%')
        .padding(12)
        .backgroundColor('#FFFFFF')
        .borderRadius(8)
        .onClick(() => {
          router.pushUrl({ url: 'pages/ActivityPage' });
        })
      }

      GridCol({ span: 6 }) {
        Column() {
          Image($r('app.media.ic_more'))
            .width(32)
            .height(32)
            .margin({ bottom: 8 })
          Text('意见反馈')
            .fontSize(14)
        }
        .width('100%')
        .padding(12)
        .backgroundColor('#FFFFFF')
        .borderRadius(8)
        .onClick(() => {
          router.pushUrl({ url: 'pages/FeedbackPage' });
        })
      }

      GridCol({ span: 6 }) {
        Column() {
          Image($r('app.media.ic_more'))
            .width(32)
            .height(32)
            .margin({ bottom: 8 })
          Text('帮助中心')
            .fontSize(14)
        }
        .width('100%')
        .padding(12)
        .backgroundColor('#FFFFFF')
        .borderRadius(8)
        .onClick(() => {
          router.pushUrl({ url: 'pages/HelpPage' });
        })
      }
    }
    .padding(8)
    .backgroundColor('#FFFFFF')
    .borderRadius(12)
    .margin({ left: 16, right: 16 })
  }

  @Builder
  buildCollections() {
    GridRow() {
      ForEach(this.collections, (item: MuseumCollection) => {
        GridCol({ span: 8 }) {
          Column() {
            Image(item.cover)
              .width('100%')
              .aspectRatio(1)
              .objectFit(ImageFit.Cover)
              .borderRadius(8)

            Text(item.name)
              .fontSize(14)
              .margin({ top: 6 })
              .maxLines(1)
              .textOverflow({ overflow: TextOverflow.Ellipsis })

            Text(`${item.count}件藏品`)
              .fontSize(12)
              .fontColor('#999')
              .margin({ top: 2 })
          }
          .width('100%')
          .padding(8)
          .onClick(() => {
            router.pushUrl({
              url: 'pages/CollectionDetail',
              params: { id: item.id }
            });
          })
        }
      })
    }
    .padding({ left: 8, right: 8 })
  }

  @Builder
  buildRecentVisits() {
    Column() {
      ForEach(this.recentVisits, (item: RecentVisit) => {
        Row() {
          Image(item.image)
            .width(80)
            .height(60)
            .objectFit(ImageFit.Cover)
            .borderRadius(4)
            .margin({ right: 12 })

          Column() {
            Text(item.name)
              .fontSize(16)
              .fontWeight(FontWeight.Medium)
              .margin({ bottom: 4 })

            Text(`参观日期: ${item.date}`)
              .fontSize(12)
              .fontColor('#999')
          }
          .alignItems(HorizontalAlign.Start)

          Blank()

          Image($r('app.media.ic_more'))
            .width(16)
            .height(16)
        }
        .width('100%')
        .padding(12)
        .backgroundColor('#FFFFFF')
        .borderRadius(8)
        .margin({ bottom: 8 })
        .onClick(() => {
          router.pushUrl({
            url: 'pages/MuseumDetail',
            params: { id: item.id }
          });
        })
      })
    }
    .width('100%')
    .padding({ left: 16, right: 16 })
  }

  @Builder
  buildBottomActions() {
    Row() {
      Text('设置')
        .fontSize(14)
        .fontColor('#666')
        .margin({ right: 20 })
        .onClick(() => {
          router.pushUrl({ url: 'pages/SettingsPage' });
        })

      Text('关于我们')
        .fontSize(14)
        .fontColor('#666')
        .margin({ right: 20 })
        .onClick(() => {
          router.pushUrl({ url: 'pages/AboutPage' });
        })

      if (this.isLoggedIn) {
        Text('退出登录')
          .fontSize(14)
          .fontColor('#666')
          .onClick(() => {
            this.handleLogout();
          })
      } else {
        Text('登录')
          .fontSize(14)
          .fontColor('#666')
          .onClick(() => {
            router.pushUrl({ url: 'component/My/LoginPage' });
          })
      }
    }
    .width('100%')
    .justifyContent(FlexAlign.Center)
    .margin({ top: 20, bottom: 20 })
  }
}

interface UserInfo {
  name: string;
  avatar: string;
  memberLevel: string;
  points: number;
}