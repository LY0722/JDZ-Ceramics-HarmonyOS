interface FuncItem {
  icon: Resource,
  name: string
}
@Component
export struct Banner {
  private images: Resource[] = [
    $r('app.media.banner_c1'),
    $r('app.media.banner_c2'),
    $r("app.media.banner_c1"),
    $r('app.media.banner_c4'),
    $r('app.media.banner_c5'),
    // $r('app.media.banner_c6'),
  ]

  @State currentIndex: number = 0

  build() {
    Swiper() {
      // 正确类型声明：img参数应为Resource类型
      ForEach(this.images, (img: Resource) => {
        Image(img)  // 直接使用Resource类型的图片资源
          .width('100%')
          .height(210)
          .objectFit(ImageFit.Cover)
      }, (img: Resource) => img.id.toString()) // 添加key生成器
    }
    .indicator(true)
    .autoPlay(true)
    .interval(3000)
    .height(210)
    .margin({ top: 10 })
  }
}