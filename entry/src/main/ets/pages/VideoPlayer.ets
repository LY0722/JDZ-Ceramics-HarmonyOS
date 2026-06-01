import { router, window } from '@kit.ArkUI';
import { common } from '@kit.AbilityKit';

// VideoPlayer.ets
@Entry
@Component
struct VideoPlayer {
  private controller: VideoController = new VideoController();
  @State videoSrc: Resource = $rawfile('jdz.mp4'); // 默认视频
  // 改变设备横竖屏状态函数
  @State isFullScreen: boolean = false; // 跟踪全屏状态

  // 改变设备横竖屏状态函数
  private changeOrientation(isLandscape: boolean) {
    // 获取UIAbility实例的上下文信息
    let context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;

    // 调用该接口手动改变设备横竖屏状态
    window.getLastWindow(context).then((lastWindow) => {
      const orientation = isLandscape ?
      window.Orientation.LANDSCAPE :
      window.Orientation.PORTRAIT;

      lastWindow.setPreferredOrientation(orientation)
        .then(() => {
          console.info(`Orientation changed to: ${orientation}`);
        })
        .catch(() => {
        });
    });
  }
  aboutToAppear() {
    const params = router.getParams() as Record<string, Resource>;
    if (params && params.videoSrc) {
      this.videoSrc = params.videoSrc;
    }

    // 初始化屏幕方向为竖屏
    this.changeOrientation(false);
  }

  aboutToDisappear() {
    // 页面退出时恢复竖屏
    if (this.isFullScreen) {
      this.changeOrientation(false);
    }
  }

  build() {
    Column() {
      // 返回按钮
      Row() {
        Button() {
          Image($r('app.media.ic_back'))
            .width(24)
            .height(24)
        }
        .width(40)
        .height(40)
        .margin({ left: 8 })
        .backgroundColor(Color.Transparent)
        .onClick(() => {
          router.back();
        })
      }
      .width('100%')
      .height(56)
      .justifyContent(FlexAlign.Start)
      .alignItems(VerticalAlign.Center)

      // 视频播放器
      Video({
        src: this.videoSrc,
        controller: this.controller
      })
        .onFullscreenChange((event) => {
          this.isFullScreen = event.fullscreen;
          console.log(`Fullscreen changed to: ${event.fullscreen}`);

          // 全屏时切换横屏，退出时恢复竖屏
          this.changeOrientation(event.fullscreen);
        })
        .width(this.isFullScreen ? '100%' : '100%') // 宽度始终100%
        .height(this.isFullScreen ? '100%' : 300)   // 高度全屏时100%，非全屏固定300
        .autoPlay(true)
        .controls(true)
        .margin({ top: this.isFullScreen ? 0 : 16 }) // 全屏时移除上边距
        .controls(true)
        .margin({ top: 16 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}