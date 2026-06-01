export interface KnowledgeItem {
  id: number;
  era: string;
  title: string;
  content: string;
  isCollected: boolean;
}

export const knowledgeData: Array<KnowledgeItem> = [
  {
    id: 1,
    era: '新石器时代 (约公元前10000年-前2000年)',
    title: '陶器的起源',
    content: '中国最早的陶器出现在约1万年前，以红陶、灰陶为主，采用泥条盘筑法制作。代表文化有仰韶文化的彩陶和龙山文化的黑陶。',
    isCollected: false
  },
  {
    id: 2,
    era: '商周时期 (约公元前1600年-前256年)',
    title: '原始瓷与印纹硬陶',
    content: '商代中期出现了原始青瓷，采用高岭土为原料，烧成温度达1200℃以上。西周时期印纹硬陶盛行，胎质坚硬，为瓷器发展奠定基础。',
    isCollected: false
  },
  {
    id: 3,
    era: '秦汉时期 (公元前221年-公元220年)',
    title: '青瓷的成熟与陶俑艺术',
    content: '汉代青瓷技术趋于成熟，浙江上虞等地已能生产真正的瓷器。秦始皇兵马俑展示了高超的陶塑技艺，汉代铅釉陶开始出现。',
    isCollected: false
  },
  {
    id: 4,
    era: '魏晋南北朝 (220年-589年)',
    title: '青瓷的普及与发展',
    content: '这一时期青瓷生产范围扩大，浙江越窑成为中心。釉色更加均匀，器型更加丰富，出现了鸡首壶等特色器型。',
    isCollected: false
  },
  {
    id: 5,
    era: '隋唐时期 (581年-907年)',
    title: '南青北白格局形成',
    content: '唐代形成"南青北白"的瓷器生产格局。南方以越窑秘色瓷为代表，北方以邢窑白瓷著称。唐三彩是低温彩釉陶器的杰出代表。',
    isCollected: false
  },
  {
    id: 6,
    era: '宋代 (960年-1279年)',
    title: '瓷器艺术的巅峰',
    content: '宋代瓷器工艺达到历史高峰，五大名窑(汝、官、哥、钧、定)各具特色。青白瓷、青花瓷开始出现，瓷器远销海外。',
    isCollected: false
  },
  {
    id: 7,
    era: '元代 (1271年-1368年)',
    title: '青花瓷的成熟',
    content: '元代景德镇成为全国制瓷中心，青花瓷成熟并大量生产。采用进口钴料，纹饰繁密，器型大气，开创了彩瓷新纪元。',
    isCollected: false
  },
  {
    id: 8,
    era: '明代 (1368年-1644年)',
    title: '彩瓷的繁荣',
    content: '明代永乐、宣德青花为巅峰之作，成化斗彩精美绝伦。景德镇设立御窑厂，瓷器品种丰富，技术精湛，外销规模扩大。',
    isCollected: false
  },
  {
    id: 9,
    era: '清代 (1644年-1912年)',
    title: '瓷器的集大成',
    content: '清代康雍乾三朝瓷器工艺登峰造极，粉彩、珐琅彩等新品种层出不穷。景德镇制瓷技术达到历史顶峰，仿古创新兼备。',
    isCollected: false
  },
  {
    id: 10,
    era: '现代 (20世纪至今)',
    title: '陶瓷的现代化发展',
    content: '现代陶瓷结合传统工艺与科技，发展出新型陶瓷材料。艺术陶瓷、工业陶瓷、建筑陶瓷等分支蓬勃发展，中国仍是世界陶瓷生产大国。',
    isCollected: false
  },
  {
    id: 11,
    era: '陶瓷工艺',
    title: '制瓷工艺流程',
    content: '传统制瓷包括采石、粉碎、淘洗、制坯、修坯、装饰、施釉、装窑、烧成等工序。现代工艺引入机械化和自动化，但核心工艺仍保持传统。',
    isCollected: false
  },
  {
    id: 12,
    era: '陶瓷分类',
    title: '陶瓷的主要种类',
    content: '按材质分为陶器、炻器、瓷器；按釉色分为青瓷、白瓷、彩瓷；按用途分为日用瓷、艺术瓷、建筑瓷、工业瓷等。',
    isCollected: false
  },
  {
    id: 13,
    era: '世界陶瓷',
    title: '世界著名陶瓷产地',
    content: '除中国外，世界著名陶瓷产地有：德国麦森、英国韦奇伍德、日本有田烧、韩国高丽青瓷、意大利法恩扎等，各具特色。',
    isCollected: false
  },
  {
    id: 14,
    era: '陶瓷装饰',
    title: '陶瓷装饰技法',
    content: '主要装饰技法有：刻花、划花、印花、贴花、彩绘、釉下彩、釉上彩、斗彩、粉彩、珐琅彩等，各时期有不同特色。',
    isCollected: false
  },
  {
    id: 15,
    era: '名窑介绍',
    title: '宋代五大名窑',
    content: '汝窑(天青釉)、官窑(紫口铁足)、哥窑(金丝铁线)、钧窑(窑变釉)、定窑(白瓷刻花)并称宋代五大名窑，代表宋代制瓷最高水平。',
    isCollected: false
  },
  {
    id: 16,
    era: '陶瓷贸易',
    title: '海上陶瓷之路',
    content: '自唐代起，中国瓷器通过海上丝绸之路远销东亚、东南亚、中东、非洲和欧洲。明代郑和下西洋促进了瓷器贸易，欧洲贵族以收藏中国瓷器为荣。',
    isCollected: false
  },
  {
    id: 17,
    era: '陶瓷科技',
    title: '陶瓷技术创新',
    content: '历代技术创新包括：商周发明釉料、汉代发明龙窑、唐代发明匣钵、宋代发明覆烧法、元代发明二元配方、清代发明珐琅彩等。',
    isCollected: false
  },
  {
    id: 18,
    era: '陶瓷鉴定',
    title: '古陶瓷鉴定要点',
    content: '鉴定古陶瓷需考察：胎质、釉色、造型、纹饰、款识、工艺特征等，还需了解各时期风格特点和作伪手法。',
    isCollected: false
  }
];