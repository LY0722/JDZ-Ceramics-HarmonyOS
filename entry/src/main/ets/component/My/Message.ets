interface Messages {
  id: number;
  title: string;
  content: string;
  time: string;
  read: boolean;
}
@Component

export struct Message {

  @State messages: Array<Messages> = [
    {
      id: 1,
      title: '系统通知',
      content: '您的预约已成功，请按时参观。',
      time: '2023-06-15 10:30',
      read: false
    },
    {
      id: 2,
      title: '活动提醒',
      content: '本周六有特别展览"古代青铜器特展"，欢迎参观。',
      time: '2023-06-14 09:15',
      read: true
    },
    {
      id: 3,
      title: '系统通知',
      content: '您的账号在异地登录，请确认是否本人操作。如非本人操作，请立即修改密码。',
      time: '2023-06-12 18:45',
      read: true
    },
    {
      id: 4,
      title: '积分提醒',
      content: '您的最新积分已更新，当前可用积分：650分',
      time: '2023-06-10 14:20',
      read: false
    }
  ];

  build() {
    Column() {
      // 标题栏
      Row() {
        Text('消息通知')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor('#333')
          .margin({left:8})

        Blank()

        Text('×')
          .fontSize(22)
          .margin({ right: 8, bottom: 5 })
          .onClick(()=>{
          })
      }
      .width('100%')
      .height(50)
      .borderRadius(12)
      .backgroundColor('#FFFFFF')
      .shadow({ radius: 4, color: '#10000000', offsetX: 0, offsetY: 2 })
      .padding({ left: 16, right: 16 })

      // 消息列表
      Scroll() {
        Column() {
          ForEach(this.messages, (item: Messages) => {
            Column() {
              Row() {
                // 未读消息小红点
                if (!item.read) {
                  Column()
                    .width(8)
                    .height(8)
                    .backgroundColor('#FF3B30')
                    .borderRadius(4)
                    .margin({ right: 8 })
                } else {
                  Column()
                    .width(8)
                    .height(8)
                    .margin({ right: 8 })
                }
                Column(){
                  Row(){
                    Text(item.title)
                      .fontSize(16)
                      .fontWeight(FontWeight.Bold)
                      .fontColor(item.read ? '#666' : '#1A1A1A')
                      .maxLines(1)
                      .textOverflow({overflow:TextOverflow.Ellipsis})

                    Blank()

                    Text(item.time)
                      .fontSize(12)
                      .fontColor('#999')
                  }
                  .width('100%')
                  .margin({bottom:4})
                  Text(item.content)
                    .fontSize(14)
                    .fontColor(item.read?'#999':'#666')
                    .width('100%')
                    .textAlign(TextAlign.Start)
                    .maxLines(2)
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                }
                .layoutWeight(1)
              }
              .width('100%')
              .padding(12)
            }
            .width('100%')
            .backgroundColor(item.read ? '#FFFFFF' : '#F5F9FF')
            .borderRadius(8)
            .border({ width: 1, color: item.read ? '#EEEEEE' : '#D6E7FF' })
            .margin({ bottom: 8 })
            .onClick(() => {
              this.messages = this.messages.map(msg => {
                if (msg.id === item.id) {
                  return {
                    id: msg.id,
                    title: msg.title,
                    content: msg.content,
                    time: msg.time,
                    read: true  // 只修改这个属性
                  };
                }
                return msg;
              });
            })
          })
        }
        .padding(16)
      }
      .layoutWeight(1)
      .width('100%')
      .margin({ top: 8 })
    }
    .width('85%')
    .height('70%')
    .backgroundColor('#FFFFFF')
    .borderRadius(16)
    .shadow({ radius: 24, color: '#40000000', offsetX: 0, offsetY: 8 })
    .padding({ top: 16, bottom: 16 })
  }
}