import { promptAction } from "@kit.ArkUI";

@Component
export struct Feedback {
  @State feedbackText: string = '';
  @State contactInfo: string = '';

  build() {
    Column() {
      // 标题栏
      Row() {
        Text('意见反馈')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)

        Blank()

        Text('×')
          .fontSize(22)
          .margin({ right: 8, bottom: 5 })
      }
      .width('100%')
      .height(50)
      .margin({ bottom: 8 })

      // 反馈表单

      Text('您的意见和建议是我们进步的动力~')
        .width('100%')
        .fontSize(16)
        .fontColor('#666')
        .margin({ top: 10, bottom: 16 })
        .textAlign(TextAlign.Start)

      Column() {

        Text('反馈内容')
          .fontSize(14)
          .fontColor('#333')
          .margin({ bottom: 8 })
          .textAlign(TextAlign.Start)
          .width('100%')

        TextInput({ placeholder: '请输入您的反馈内容(200字以内)', text: this.feedbackText })
          .placeholderFont({ size: 14, weight: FontWeight.Normal })
          .width('100%')
          .height(120)
          .fontSize(14)
          .maxLength(200)
          .type(InputType.Normal)
          .onChange((value: string) => {
            this.feedbackText = value;
          })
          .borderRadius(8)
          .padding(10)
          .backgroundColor(Color.White)
          .border({ width: 1, color: '#E5E5E5' })
      }
      .margin({ bottom: 16 })

      Column() {
        Text('联系方式(选填)')
          .fontSize(14)
          .fontColor('#333')
          .margin({ bottom: 8 })
          .textAlign(TextAlign.Start)
          .width('100%')

        TextInput({ placeholder: '邮箱/手机号', text: this.contactInfo })
          .placeholderFont({ size: 14, weight: FontWeight.Normal })
          .width('100%')
          .height(40)
          .fontSize(14)
          .type(InputType.Normal)
          .onChange((value: string) => {
            this.contactInfo = value;
          })
          .borderRadius(8)
          .padding(10)
          .backgroundColor(Color.White)
          .border({ width: 1, color: '#E5E5E5' })
      }

      Button('提交反馈')
        .width('100%')
        .height(45)
        .margin({ top: 20 })
        .backgroundColor('#1a73e8')
        .fontColor(Color.White)
        .fontSize(16)
        .onClick(() => {
          if (this.feedbackText.trim() === '') {
            promptAction.showToast({ message: '请填写反馈内容', duration: 2000 });
            return;
          }
          // 模拟提交反馈
          promptAction.showToast({ message: '反馈提交成功', duration: 2000 });
          this.feedbackText = '';
          this.contactInfo = '';
        })
    }
  .width('85%')
  .padding(20)
  .backgroundColor('#FFFFFF')
  .borderRadius(16)
  .shadow({ radius: 24, color: '#40000000', offsetX: 0, offsetY: 8 })
  }
}