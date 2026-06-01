// LoginPage.ets
import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import preferences from '@ohos.data.preferences';

@Entry
@Component
struct LoginPage {
  @State username: string = '';
  @State password: string = '';
  @State rememberMe: boolean = false;

  async onPageShow() {
    // 检查是否已登录
    try {
      const pref = await preferences.getPreferences(getContext(this), 'userPrefs');
      const isLoggedIn = await pref.get('isLoggedIn', false);
      const remember = await pref.get('rememberMe', false);

      if (isLoggedIn && remember) {
        router.replaceUrl({ url: 'pages/Index' });
        return;
      }

      // 检查是否有从注册页面传递过来的用户名和密码
      const params = router.getParams() as RouteParams;
      if (params?.registered === 'true') {
        this.username = params.username || '';
        this.password = params.password || '';

        // 清除临时存储
        await pref.delete('tempUsername');
        await pref.delete('tempPassword');
        await pref.flush();
      } else {
        // 检查临时存储中是否有注册信息
        const tempUsername = await pref.get('tempUsername', '') as string;
        const tempPassword = await pref.get('tempPassword', '') as string;
        if (tempUsername && tempPassword) {
          this.username = tempUsername;
          this.password = tempPassword;
        }
      }
    } catch (e) {
      console.error(`Failed to check login status, error: ${e}`);
    }
  }

  build() {
    Column() {
      // 顶部标题 - 艺术效果
      Text('景德镇瓷典')
        .fontSize(36)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 40, bottom: 10 })
        .fontColor('#1a73e8')
        .textShadow({ radius: 2, color: Color.Gray, offsetX: 1, offsetY: 1 })

      Text('传承千年陶瓷文化')
        .fontSize(18)
        .fontWeight(FontWeight.Normal)
        .margin({ bottom: 40 })
        .fontColor('#666666')

      // 登录表单 - 添加阴影效果
      TextInput({ placeholder: '请输入用户名', text: this.username })
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

      TextInput({ placeholder: '请输入密码', text: this.password })
        .width('85%')
        .height(50)
        .margin({ bottom: 15 })
        .type(InputType.Password)
        .backgroundColor(Color.White)
        .fontColor('#333333')
        .borderRadius(10)
        .shadow({ radius: 6, color: '#1a73e822', offsetX: 0, offsetY: 2 })
        .onChange((value: string) => {
          this.password = value.trim();
        })

      // 记住我选项 - 美化样式
      Row() {
        Checkbox()
          .select(this.rememberMe)
          .onChange((isChecked: boolean) => {
            this.rememberMe = isChecked;
          })
          .width(20)
          .height(20)
          .margin({ right: 8 })
        Text('记住我')
          .fontSize(14)
          .fontColor('#666666')
      }
      .width('85%')
      .justifyContent(FlexAlign.Start)
      .margin({ bottom: 25 })
      .alignItems(VerticalAlign.Center)

      // 登录按钮 - 添加阴影效果
      Button('登录', { type: ButtonType.Capsule })
        .width('85%')
        .height(50)
        .backgroundColor('#1a73e8')
        .fontColor(Color.White)
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .shadow({ radius: 8, color: '#1a73e844', offsetX: 0, offsetY: 4 })
        .onClick(() => this.handleLogin())
        .margin({ bottom: 20 })

      // 注册链接 - 美化样式
      Row() {
        Text('还没有账号？')
          .fontSize(14)
          .fontColor('#666666')
        Text('立即注册')
          .fontSize(14)
          .fontColor('#1a73e8')
          .fontWeight(FontWeight.Medium)
          .onClick(() => {
            router.pushUrl({ url: 'component/My/RegisterPage' });
          })
      }
      .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#f8f9fa')
    .justifyContent(FlexAlign.Start)
  }

  async handleLogin() {
    // 验证用户名和密码
    if (!this.validateUsername(this.username)) {
      promptAction.showToast({ message: '用户名格式不正确', duration: 2000 });
    } else if (!this.validatePassword(this.password)) {
      promptAction.showToast({ message: '密码格式不正确', duration: 2000 });
    } else {
      // 模拟登录成功
      try {
        const pref = await preferences.getPreferences(getContext(this), 'userPrefs');
        await pref.put('isLoggedIn', true);
        await pref.put('rememberMe', this.rememberMe);
        await pref.put('username', this.username);
        await pref.flush();

        promptAction.showToast({ message: '登录成功', duration: 2000 });
        router.replaceUrl({ url: 'pages/Index' });
      } catch (e) {
        console.error(`Failed to save login status, error: ${e}`);
        promptAction.showToast({ message: '登录失败，请重试', duration: 2000 });
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

interface RouteParams {
  registered?: string;
  username?: string;
  password?: string;
}