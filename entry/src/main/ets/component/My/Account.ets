import { router } from "@kit.ArkUI";
import promptAction from '@ohos.promptAction';
import preferences from '@ohos.data.preferences';
import { UserData } from "./UserData";

@Component
export struct Account {
  @Link userInfo: UserData;
  @State editMode: boolean = false;
  @State tempName: string = '';
  @State tempPhone: string = '';

  aboutToAppear() {
    this.tempName = this.userInfo.name;
    this.tempPhone = this.userInfo.phone;
  }
  async loadUserInfo() {
    try {
      const pref = await preferences.getPreferences(getContext(this), 'userPrefs');
      const username = await pref.get('username', '博物馆爱好者');
      const phone = await pref.get('phone', '151****2557');

      if (typeof username === 'string') {
        this.userInfo.name = username;
        this.tempName = username;
      }
      if (typeof phone === 'string') {
        this.userInfo.phone = phone;
        this.tempPhone = phone;
      }
    } catch (e) {
      console.error(`Failed to load user info, error: ${e}`);
    }
  }

  async saveUserInfo() {
    try {
      const pref = await preferences.getPreferences(getContext(this), 'userPrefs');
      await pref.put('username', this.tempName);
      await pref.put('phone', this.tempPhone);
      await pref.flush();

      // 更新本地和父组件数据
      this.userInfo.name = this.tempName;
      this.userInfo.phone = this.tempPhone;
      this.editMode = false;
      promptAction.showToast({ message: '保存成功', duration: 2000 });
    } catch (e) {
      console.error(`Failed to save user info, error: ${e}`);
      promptAction.showToast({ message: '保存失败', duration: 2000 });
    }
  }

  build() {
    Column() {
      // 头部返回按钮
      Row() {
        Text('账号管理')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ left: 16 })

        Blank()

        Text('×')
          .fontSize(22)
          .margin({ right: 8, bottom: 5 })
      }
      .width('100%')
      .margin({ bottom: 16 })

      Column() {
        Image(this.userInfo.avatar)
          .width(80)
          .height(80)
          .borderRadius(40)
          .margin({ top: 10, bottom: 16 })

        if (this.editMode) {
          TextInput({ text: this.tempName })
            .width('80%')
            .height(40)
            .fontSize(18)
            .textAlign(TextAlign.Center)
            .onChange((value: string) => {
              this.tempName = value;
            })
            .margin({ bottom: 8 })

          TextInput({ text: this.tempPhone })
            .width('80%')
            .height(40)
            .fontSize(16)
            .textAlign(TextAlign.Center)
            .onChange((value: string) => {
              this.tempPhone = value;
            })
        } else {
          Text(this.userInfo.name)
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 8 })

          Text(this.userInfo.phone)
            .fontSize(16)
            .fontColor('#666')
        }
      }
      .width('100%')
      .alignItems(HorizontalAlign.Center)
      .margin({ bottom: 20 })

      if (this.editMode) {
        Button('保存')
          .width('100%')
          .height(40)
          .backgroundColor('#1a73e8')
          .fontColor(Color.White)
          .onClick(() => {
            this.saveUserInfo();
          })
      } else {
        Button('编辑')
          .width('100%')
          .height(40)
          .backgroundColor('#1a73e8')
          .fontColor(Color.White)
          .onClick(() => {
            this.editMode = true;
          })
      }
      Column() {
        Row() {
          Text('会员等级')
            .fontSize(16)
            .fontColor('#333')

          Blank()

          Text(this.userInfo.memberLevel)
            .fontSize(16)
            .fontColor('#666')
        }
        .width('100%')
        .height(40)
        .padding({ left: 16, right: 16 })

        Divider().strokeWidth(0.5).color('#EEEEEE')

        Row() {
          Text('积分')
            .fontSize(16)
            .fontColor('#333')

          Blank()

          Text(this.userInfo.points.toString())
            .fontSize(16)
            .fontColor('#666')
        }
        .width('100%')
        .height(40)
        .padding({ left: 16, right: 16 })
      }
      .backgroundColor('#FFFFFF')
      .borderRadius(8)
      .margin({ top: 16 })
    }
    .width('90%')
    .padding(16)
    .backgroundColor('#F5F5F5')
    .borderRadius(12)
  }
}