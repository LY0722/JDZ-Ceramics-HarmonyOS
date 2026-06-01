// RegisterPage.ets
import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import preferences from '@ohos.data.preferences';

@Entry
@Component
struct RegisterPage {
  @State username: string = '';
  @State password: string = '';
  @State confirmPassword: string = '';
  @State agreedToTerms: boolean = false;

  build() {
    Column() {
      // 顶部标题 - 添加了艺术效果
      Text('欢迎注册')
        .fontSize(36)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 40, bottom: 10 })
        .fontColor('#1a73e8')
        .textShadow({ radius: 2, color: Color.Gray, offsetX: 1, offsetY: 1 })

      Text('创建您的账号')
        .fontSize(18)
        .fontWeight(FontWeight.Normal)
        .margin({ bottom: 40 })
        .fontColor('#666666')

      // 注册表单 - 添加了阴影效果
      TextInput({ placeholder: '请输入用户名(4-16位字母数字)' })
        .width('85%')
        .height(50)
        .margin({ bottom: 20 })
        .type(InputType.Normal)
        .backgroundColor(Color.White)
        .fontColor('#333333')
        .borderRadius(10)
        .shadow({ radius: 6, color: '#1a73e822', offsetX: 0, offsetY: 2 })
        .onChange((value: string) => {
          this.username = value.trim();
        })

      TextInput({ placeholder: '请输入密码(6-18位，包含字母和数字)' })
        .width('85%')
        .height(50)
        .margin({ bottom: 20 })
        .type(InputType.Password)
        .backgroundColor(Color.White)
        .fontColor('#333333')
        .borderRadius(10)
        .shadow({ radius: 6, color: '#1a73e822', offsetX: 0, offsetY: 2 })
        .onChange((value: string) => {
          this.password = value.trim();
        })

      TextInput({ placeholder: '请再次输入密码' })
        .width('85%')
        .height(50)
        .margin({ bottom: 20 })
        .type(InputType.Password)
        .backgroundColor(Color.White)
        .fontColor('#333333')
        .borderRadius(10)
        .shadow({ radius: 6, color: '#1a73e822', offsetX: 0, offsetY: 2 })
        .onChange((value: string) => {
          this.confirmPassword = value.trim();
        })

      // 用户协议勾选
      Row() {
        Checkbox()
          .select(this.agreedToTerms)
          .onChange((isChecked: boolean) => {
            this.agreedToTerms = isChecked;
          })
          .width(20)
          .height(20)
          .margin({ right: 8 })

        Text('我已阅读并同意')
          .fontSize(14)
          .fontColor('#666666')

        Text('《用户协议》')
          .fontSize(14)
          .fontColor('#1a73e8')
          .onClick(() => {
            // 这里可以跳转到用户协议页面
            promptAction.showToast({ message: '查看用户协议', duration: 1000 });
          })
      }
      .width('85%')
      .margin({ bottom: 25 })
      .alignItems(VerticalAlign.Center)

      Button('注册', { type: ButtonType.Capsule })
        .width('85%')
        .height(50)
        .backgroundColor('#1a73e8')
        .fontColor(Color.White)
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .shadow({ radius: 8, color: '#1a73e844', offsetX: 0, offsetY: 4 })
        .onClick(() => this.handleRegister())
        .margin({ bottom: 20 })

      Row() {
        Text('已有账号？')
          .fontSize(14)
          .fontColor('#666666')
        Text('立即登录')
          .fontSize(14)
          .fontColor('#1a73e8')
          .fontWeight(FontWeight.Medium)
          .onClick(() => {
            router.back();
          })
      }
      .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#f8f9fa')
    .justifyContent(FlexAlign.Start)
  }

  async handleRegister() {
    // 验证用户名和密码
    if (!this.validateUsername(this.username)) {
      promptAction.showToast({ message: '用户名格式不正确(4-16位字母数字)', duration: 2000 });
    } else if (!this.validatePassword(this.password)) {
      promptAction.showToast({ message: '密码格式不正确(6-18位，包含字母和数字)', duration: 2000 });
    } else if (this.password !== this.confirmPassword) {
      promptAction.showToast({ message: '两次输入的密码不一致', duration: 2000 });
    } else if (!this.agreedToTerms) {
      promptAction.showToast({ message: '请先同意用户协议', duration: 2000 });
    } else {
      // 注册成功，保存用户名和密码到临时存储
      try {
        const pref = await preferences.getPreferences(getContext(this), 'userPrefs');
        await pref.put('tempUsername', this.username);
        await pref.put('tempPassword', this.password);
        await pref.flush();

        promptAction.showToast({ message: '注册成功，请登录', duration: 2000 });
        router.replaceUrl({
          url: 'component/My/LoginPage',
          params: {
            registered: 'true',
            username: this.username,
            password: this.password
          }
        });
      } catch (e) {
        console.error(`Failed to save register data, error: ${e}`);
        promptAction.showToast({ message: '注册失败，请重试', duration: 2000 });
      }
    }
  }

  validateUsername(username: string): boolean {
    // 用户名4-16位字母数字
    const regex = /^[a-zA-Z0-9]{4,16}$/;
    return regex.test(username);
  }

  validatePassword(password: string): boolean {
    // 密码6-18位，包含字母和数字
    const regex = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,18}$/;
    return regex.test(password);
  }
}