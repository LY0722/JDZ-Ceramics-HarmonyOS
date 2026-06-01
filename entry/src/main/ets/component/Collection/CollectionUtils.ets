import { CollectionData } from './CollectionDataModel'

export const DYNASTIES: Array<string> = [
  '新石器时代', '商周', '秦汉', '魏晋南北朝',
  '隋唐', '宋代', '元代', '明代', '清代'
]

export function getAllCollectionData(): Array<CollectionData> {
  return [
  // 新石器时代 (period: 0)
    {
      id: 1,
      name: '人面鱼纹彩陶盆',
      dynasty: '新石器时代',
      period: 0,
      imageUrl: $r('app.media.xing17'),
      description: '内壁以黑彩绘人面鱼纹，造型神秘独特，是仰韶文化的典型代表器物，也是儿童瓮棺的棺盖，反映了原始先民的宗教信仰和艺术审美。',
      height: 280,
      museum: '中国国家博物馆',
      material: '细泥红陶',
      discovery: '1955年出土于陕西西安半坡遗址'
    },
    {
      id: 2,
      name: '漩涡纹尖底瓶',
      dynasty: '新石器时代',
      period: 0,
      imageUrl: $r('app.media.xing18'),
      description: '小口尖底，便于汲水，腹部饰漩涡纹，线条流畅，富有动感，体现了原始先民对自然现象的观察和艺术表现，是马家窑文化的经典器物。',
      height: 320,
      museum: '甘肃省博物馆',
      material: '细泥红陶',
      discovery: '1971年出土于甘肃陇西吕家坪'
    },
    {
      id: 3,
      name: '蛋壳黑陶高柄杯',
      dynasty: '新石器时代',
      period: 0,
      imageUrl: $r('app.media.xing19'),
      description: '器壁薄如蛋壳，质地细腻，漆黑光亮，透雕中空柄腹，工艺精湛至极，是龙山文化的标志性器物，代表了原始社会制陶工艺的最高水平。',
      height: 300,
      museum: '山东博物馆',
      material: '黑陶',
      discovery: '出土于山东日照东海峪遗址'
    },
    {
      id: 4,
      name: '黑陶刻纹宽把杯',
      dynasty: '新石器时代',
      period: 0,
      imageUrl: $r('app.media.xing20'),
      description: '器形简约大方，表面刻划精细的纹饰，线条细腻流畅，是良渚文化陶器中的精品，体现了长江流域新石器时代高超的制陶技艺。',
      height: 260,
      museum: '上海博物馆',
      material: '泥质黑衣灰陶',
      discovery: '1984年青浦福泉山高台墓地65号墓出土'
    },

    // 商周 (period: 1)
    {
      id: 5,
      name: '商青釉弦纹尊',
      dynasty: '商周',
      period: 1,
      imageUrl: $r('app.media.shang21'),
      description: '胎质灰白，施青釉，颈部及腹部饰弦纹，造型仿青铜器，古朴庄重，是商代原始瓷的代表作品。',
      height: 220,
      museum: '上海博物馆',
      material: '原始瓷',
      discovery: '暂无公开的明确出土信息'
    },
    {
      id: 6,
      name: '西周青釉豆',
      dynasty: '商周',
      period: 1,
      imageUrl: $r('app.media.shang22'),
      description: '豆盘浅腹，圈足，釉色青黄，器形简洁实用，内壁口沿至腹部饰有篦点纹，下部及外壁饰弦纹。',
      height: 200,
      museum: '首都博物馆',
      material: '原始瓷',
      discovery: '1974年出土于北京房山琉璃河商周遗址'
    },
    {
      id: 7,
      name: '西周应国三联原始瓷豆',
      dynasty: '商周',
      period: 1,
      imageUrl: $r('app.media.shang23'),
      description: '上部为三个形制、大小相同的浅豆盘，下部共用一个收腰筒状圈足，造型独特罕见。',
      height: 240,
      museum: '平顶山博物馆',
      material: '原始瓷',
      discovery: '出土于平顶山应国墓地'
    },
    {
      id: 8,
      name: '商青釉兽首鼎',
      dynasty: '商周',
      period: 1,
      imageUrl: $r('app.media.shang24'),
      description: '兽首形足，腹部饰弦纹，将动物造型与器物功能相结合，设计巧妙，是商周时期原始瓷向成熟青瓷过渡的重要例证。',
      height: 260,
      museum: '上海博物馆',
      material: '原始瓷',
      discovery: '暂无公开的明确出土信息'
    },

    // 秦汉 (period: 2)
    {
      id: 9,
      name: '秦始皇陵兵马俑',
      dynasty: '秦汉',
      period: 2,
      imageUrl: $r('app.media.han25'),
      description: '陶俑高度写实，形象逼真，兵种多样，排列成庞大的军阵，气势磅礴，是秦代雕塑艺术的巅峰之作，被誉为"世界第八大奇迹"。',
      height: 350,
      museum: '秦始皇帝陵博物院',
      material: '陶质',
      discovery: '1974年出土于陕西临潼秦始皇陵东侧'
    },
    {
      id: 10,
      name: '东汉绿釉陶楼',
      dynasty: '秦汉',
      period: 2,
      imageUrl: $r('app.media.han26'),
      description: '红胎绿釉，为三层楼阁式建筑，庑殿式顶，造型精美，细节丰富，展现了东汉时期的建筑风格和工艺水平。',
      height: 340,
      museum: '河南博物院',
      material: '红陶，外表涂白粉，上施绿釉',
      discovery: '1954年出土于河南省淮阳九女冢村汉墓'
    },
    {
      id: 11,
      name: '西汉彩绘陶壶',
      dynasty: '秦汉',
      period: 2,
      imageUrl: $r('app.media.han27'),
      description: '腹部绘有精美的图案，色彩绚丽，线条流畅，常见云气纹、白虎瑞兽等纹饰，体现了汉代高超的彩绘工艺。',
      height: 240,
      museum: '河南博物院',
      material: '泥质灰陶',
      discovery: '1953年出土于河南省洛阳烧沟汉墓'
    },
    {
      id: 12,
      name: '东汉青釉四系瓷罐',
      dynasty: '秦汉',
      period: 2,
      imageUrl: $r('app.media.han28'),
      description: '口直沿，腹部成球形，平底，腹上部四侧有四个半环形耳，可穿系，实用性强。淡青色釉，釉层薄而均匀，有开片。',
      height: 320,
      museum: '中国国家博物馆',
      material: '瓷器，采用高岭土做胎',
      discovery: '1955年出土于河南省洛阳市中州路'
    },

    // 魏晋南北朝 (period: 3)
    {
      id: 13,
      name: '西晋越窑青釉黄鼬把瓷鸡首壶',
      dynasty: '魏晋南北朝',
      period: 3,
      imageUrl: $r('app.media.wei29'),
      description: '鸡首为流，黄鼬形把，造型生动独特，釉色清新淡雅，体现了西晋时期越窑青瓷的高超工艺和独特的艺术风格。',
      height: 260,
      museum: '余姚博物馆',
      material: '青瓷',
      discovery: '暂无公开的明确出土信息'
    },
    {
      id: 14,
      name: '北朝青釉仰覆莲花尊',
      dynasty: '魏晋南北朝',
      period: 3,
      imageUrl: $r('app.media.wei30'),
      description: '器型硕大庄重。颈部装饰分三层，上层贴一对飞天，中层刻三圈弦纹，下层贴饰对称的忍冬、莲花纹。通体施青釉，釉色青绿温润。',
      height: 330,
      museum: '中国国家博物馆',
      material: '青瓷',
      discovery: '1948年出土于河北景县封氏墓'
    },
    {
      id: 15,
      name: '东晋德清窑黑釉鸡首壶',
      dynasty: '魏晋南北朝',
      period: 3,
      imageUrl: $r('app.media.wei31'),
      description: '黑釉光亮如漆，鸡首流短小，曲柄连接口沿，造型简洁流畅，体现了德清窑独特的制瓷风格。',
      height: 300,
      museum: '浙江博物馆',
      material: '黑瓷',
      discovery: '推测出土于浙江省德清县相关遗址'
    },
    {
      id: 16,
      name: '南朝青釉刻花莲瓣纹盘口壶',
      dynasty: '魏晋南北朝',
      period: 3,
      imageUrl: $r('app.media.wei32'),
      description: '腹部刻划莲瓣纹等纹饰，线条流畅，釉色青灰，体现了南朝时期青瓷的装饰艺术特点，造型古朴大方。',
      height: 310,
      museum: '上海博物馆',
      material: '青瓷',
      discovery: '暂无公开的明确出土信息'
    },

    // 隋唐 (period: 4)
    {
      id: 17,
      name: '唐三彩骆驼载乐俑',
      dynasty: '隋唐',
      period: 4,
      imageUrl: $r('app.media.tang33'),
      description: '骆驼背负乐舞俑群，造型生动逼真，色彩斑斓，人物表情丰富，展现了盛唐时期胡汉文化交融的繁荣景象。',
      height: 300,
      museum: '陕西历史博物馆',
      material: '陶质，以黄、绿、白三色为主',
      discovery: '1959年出土于陕西西安中堡村唐墓'
    },
    {
      id: 18,
      name: '邢窑白釉执壶',
      dynasty: '隋唐',
      period: 4,
      imageUrl: $r('app.media.tang34'),
      description: '白釉细腻洁白，短流曲柄，造型简洁实用，底刻"盈"字款，表明为宫廷用器，体现了唐代邢窑白瓷的高超工艺水平。',
      height: 320,
      museum: '故宫博物院等可能有收藏',
      material: '白瓷',
      discovery: '出土于西安，具体信息不详'
    },
    {
      id: 19,
      name: '唐青釉"大中元年"铭划花执壶',
      dynasty: '隋唐',
      period: 4,
      imageUrl: $r('app.media.tang35'),
      description: '壶身刻有明确年代铭文，是唐代越窑执壶的标准器。腹部刻划花卉纹，工艺精湛，反映出9世纪初越窑器物的烧造水平。',
      height: 340,
      museum: '上海博物馆',
      material: '青瓷',
      discovery: '1936年陈万里先生在浙江绍兴得到此壶'
    },
    {
      id: 20,
      name: '唐黄釉绞胎骑马俑',
      dynasty: '隋唐',
      period: 4,
      imageUrl: $r('app.media.tang36'),
      description: '采用绞胎工艺，将不同颜色的陶土绞合在一起，形成独特的纹理，人马造型生动，展现了唐代高超的陶塑艺术。',
      height: 280,
      museum: '河南博物院',
      material: '陶质',
      discovery: '出土于河南洛阳，具体信息不详'
    },

    // 宋代 (period: 5)
    {
      id: 21,
      name: '青釉莲纹凤首壶',
      dynasty: '宋代',
      period: 5,
      imageUrl: $r('app.media.song1'),
      description: '壶身装饰莲纹，以凤首为流，造型独特，展现了宋代将乐窑的制瓷工艺。',
      height: 200,
      museum: '上海市长宁区非遗保护中心',
      material: '瓷土，青釉',
      discovery: '将乐窑遗址相关区域出土'
    },
    {
      id: 22,
      name: '青白釉褐彩长颈瓶',
      dynasty: '宋代',
      period: 5,
      imageUrl: $r('app.media.song2'),
      description: '瓶身修长，青白釉搭配褐彩，呈现出古朴雅致的美感。',
      height: 180,
      museum: '上海市长宁区非遗保护中心',
      material: '瓷土，青白釉并点缀褐彩',
      discovery: '推测为将乐窑遗址附近出土'
    },
    {
      id: 23,
      name: '青白釉骑马人物俑',
      dynasty: '宋代',
      period: 5,
      imageUrl: $r('app.media.song3'),
      description: '人物骑马造型生动，青白釉色温润，是宋代陶瓷中的艺术珍品。',
      height: 220,
      museum: '上海市长宁区非遗保护中心',
      material: '瓷土，青白釉',
      discovery: '可能出自将乐窑相关区域'
    },
    {
      id: 24,
      name: '碗窑山遗址出土黑釉盏',
      dynasty: '宋代',
      period: 5,
      imageUrl: $r('app.media.song4'),
      description: '大口小足如漏斗，胎体粗厚，部分釉层中呈现兔毛状花纹，可与建窑兔毫盏相匹敌。',
      height: 190,
      museum: '福建博物院或闽侯县博物馆',
      material: '瓷土，黑釉',
      discovery: '1982年发现于福州高新区南屿镇窗厦村碗窑山遗址'
    },

    // 元代 (period: 6)
    {
      id: 25,
      name: '天蓝釉花口紫斑贴塑兽面双螭耳连座瓶',
      dynasty: '元代',
      period: 6,
      imageUrl: $r('app.media.yuan5'),
      description: '造型优美，天蓝釉色搭配紫斑，装饰有兽面和螭耳，极具艺术观赏性。',
      height: 240,
      museum: '中国国家博物馆',
      material: '瓷土，天蓝釉为底色并饰以紫斑',
      discovery: '北京市元大都遗址出土'
    },
    {
      id: 26,
      name: '青花云龙纹砚盒',
      dynasty: '元代',
      period: 6,
      imageUrl: $r('app.media.yuan6'),
      description: '盒上绘有云龙纹，青花发色浓艳，体现了元代青花瓷的高超工艺。',
      height: 200,
      museum: '景德镇市陶瓷考古研究所',
      material: '瓷土，青花',
      discovery: '1988年江西省景德镇市珠山麓风景路出土'
    },
    {
      id: 27,
      name: '青花满池娇图菱花口盘',
      dynasty: '元代',
      period: 6,
      imageUrl: $r('app.media.yuan7'),
      description: '盘呈菱花口，绘有满池娇图案，画面生动，展现了元代青花瓷的绘画艺术。',
      height: 300,
      museum: '中国国家博物馆',
      material: '瓷土，青花',
      discovery: '传世或其他遗址出土'
    },
    {
      id: 28,
      name: '元青花云龙纹兽耳盖罐',
      dynasty: '元代',
      period: 6,
      imageUrl: $r('app.media.yuan8'),
      description: '罐体绘有云龙纹，兽耳装饰增添古朴之感，是元代青花瓷器的代表作品之一。',
      height: 230,
      museum: '江西高安元青花博物馆',
      material: '瓷土，青花',
      discovery: '上世纪80年代江西高安元代窖藏出土'
    },

    // 明代 (period: 7)
    {
      id: 29,
      name: '明万历五彩莲池花鸟图蒜头瓶',
      dynasty: '明代',
      period: 7,
      imageUrl: $r('app.media.ming9'),
      description: '五彩色彩鲜艳，图案生动，展现了明代万历时期五彩瓷的高超技艺。',
      height: 280,
      museum: '故宫博物院',
      material: '瓷土，五彩',
      discovery: '宫廷旧藏或传世文物'
    },
    {
      id: 30,
      name: '明成化斗彩三秋杯',
      dynasty: '明代',
      period: 7,
      imageUrl: $r('app.media.ming10'),
      description: '杯身绘有三秋景色，斗彩工艺精湛，色彩淡雅柔和，是成化斗彩瓷中的珍品。',
      height: 180,
      museum: '故宫博物院',
      material: '瓷土，斗彩',
      discovery: '宫廷流传下来的文物'
    },
    {
      id: 31,
      name: '明永乐青花云龙纹天球瓶',
      dynasty: '明代',
      period: 7,
      imageUrl: $r('app.media.ming11'),
      description: '造型饱满，青花云龙纹气势磅礴，体现了永乐时期青花瓷的大气与精湛工艺。',
      height: 320,
      museum: '故宫博物院',
      material: '瓷土，进口青料',
      discovery: '宫廷旧藏或传世品'
    },
    {
      id: 32,
      name: '明嘉靖娇黄釉盘',
      dynasty: '明代',
      period: 7,
      imageUrl: $r('app.media.ming12'),
      description: '黄釉色泽娇艳，为明代单色釉中的名贵品种，彰显出嘉靖时期单色釉烧制的高超水平。',
      height: 200,
      museum: '可能为私人收藏',
      material: '瓷土，娇黄釉',
      discovery: '未提及具体出土信息'
    },

    // 清代 (period: 8)
    {
      id: 33,
      name: '清康熙豇豆红釉水盂',
      dynasty: '清代',
      period: 8,
      imageUrl: $r('app.media.qing13'),
      description: '水盂造型小巧，豇豆红釉色温润柔美，有深浅不一的色泽变化，极具美感。',
      height: 180,
      museum: '上海市奉贤区博物馆',
      material: '瓷土，豇豆红釉',
      discovery: '传世或窖藏'
    },
    {
      id: 34,
      name: '清康熙郎窑红釉折沿盆',
      dynasty: '清代',
      period: 8,
      imageUrl: $r('app.media.qing14'),
      description: '郎窑红釉色鲜艳夺目，折沿盆造型规整，是康熙时期郎窑红瓷器的典型代表。',
      height: 300,
      museum: '上海市奉贤区博物馆',
      material: '瓷土，郎窑红釉',
      discovery: '未提及'
    },
    {
      id: 35,
      name: '清乾隆"湛恩堂"款青釉刻花云龙纹盘',
      dynasty: '清代',
      period: 8,
      imageUrl: $r('app.media.qing15'),
      description: '盘上刻有云龙纹，青釉色泽温润，刻花工艺精细，体现了乾隆时期瓷器的精致工艺。',
      height: 210,
      museum: '上海市奉贤区博物馆',
      material: '瓷土，青釉',
      discovery: '可能为传世品'
    },
    {
      id: 36,
      name: '清雍正青花宝相花纹小蒜头瓶',
      dynasty: '清代',
      period: 8,
      imageUrl: $r('app.media.qing16'),
      description: '瓶身绘有宝相花纹，青花发色淡雅，器形简约精致，展现了雍正时期青花瓷的典雅风格。',
      height: 310,
      museum: '可能为私人收藏',
      material: '瓷土，青花',
      discovery: '未提及具体出土信息'
    }
  ]
}

export { CollectionData }
