// 陶瓷数据模型
export class CollectionData {
  id: number = 0                 // 陶瓷ID
  name: string = ''              // 陶瓷名称
  dynasty: string = ''           // 所属朝代
  period: number = 0             // 所属时期索引(0-8)
  imageUrl: Resource = $r('app.media.default_img') // 图片URL
  description: string = ''       // 描述信息
  height: number = 200           // 图片高度（用于瀑布流布局）
  museum: string = ''            // 博物馆位置
  material: string = ''          // 材质
  discovery: string = ''         // 出土信息
}