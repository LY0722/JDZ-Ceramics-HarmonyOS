// ExhibitionData.ets
export interface ExhibitionItem {
  id: number;
  title: string;
  description: string;
  detailDescription: string;
  image: ResourceStr;
  category: number;
  isFree: boolean;
  price: number;
  date: string;
  openingHours: string;
  location: string;
  curator: string;
  organizer: string;
  contact: string;
  liked: boolean;
  tags: string[];
  audioGuide: boolean;
  vrTour: boolean;
  rating: number;
  reviews: number;
  childrenActivity?: boolean;
  nightSession?: boolean;
  livePerformance?: boolean;
  specialEvent?: string;
}

export interface FilterOption {
  id: number;
  name: string;
}

// 定义所有展览数据
export const EXHIBITION_DATA: ExhibitionItem[] = [
  {
    id: 1,
    title: "意象墨彩 泥火天成 —— 冯林华陶瓷艺术作品展",
    description: "本次展览精选冯林华先生近年来创作的 100 余幅陶瓷作品，以高温颜色釉‘意象墨彩’作品为主",
    detailDescription: "冯林华在继承景德镇传统陶瓷装饰技艺基础上，首创高温颜色釉‘意象墨彩’技法，为陶瓷艺术发展开辟创新之路。展出作品如《墨影含芳》《扶摇》等，运笔洒脱，构思新颖，形式多样，古典雅致，清新自然，意韵无穷。作品将绘画与窑变融为一体，独具个性，兼具视觉冲击力与感染力。冯林华力求融合西方绘画技法与中国陶瓷文化审美意蕴，形成独特艺术风格，备受美术界和社会各界高度评价。他 1954 年生于景德镇陶瓷之家，受父亲影响自幼酷爱艺术，曾进入景德镇陶瓷学院美术系工作，受胡献雅、施于人等前辈画家艺术影响，将国画与陶瓷装饰艺术有机结合。虽曾离开陶瓷学院，却从未间断对陶瓷艺术的追求探索。2011 年重回景德镇陶瓷学院后，对高温颜色釉把控有新突破，使 1280℃高温颜色釉达最佳艺术效果，形成陶艺界独特的‘意象墨彩’技艺，开创景德镇新的陶瓷艺术门类。",
    image: $r ('app.media.exhibits_e1') as ResourceStr,
    category: 2,
    isFree: false,
    price: 0,
    date: "2013.08.18-2013.08.25",
    openingHours: "",
    location: "北区二层 11 号展厅",
    curator: "",
    organizer: "",
    contact: "",
    liked: false,
    tags: ["陶瓷艺术", "高温颜色釉", "意象墨彩"],
    audioGuide: true,
    vrTour: false,
    rating: 0,
    reviews: 0
  },
  {
    id: 2,
    title: "浮槎万里 —— 中国古代陶瓷海上贸易展",
    description: "展览以中国古代海上贸易瓷器为主体，通过制度、生产、运输等内容展示古代陶瓷海上贸易盛景",
    detailDescription: "2000 多年前先辈开辟海上丝绸之路，2013 年习近平总书记提出‘21 世纪海上丝绸之路’战略构想。此次展览承担博物馆连接历史、现在和未来的使命，让文物和历史说话，呈现海上丝路繁盛景象，讲述丝路故事，弘扬丝路精神。展览分为三个单元：第一单元‘鲸波浩渺 —— 唐五代时期的陶瓷海上贸易’，唐代起海上丝路繁荣，陶瓷器开始大规模外销，长沙窑、越窑等开启外销辉煌历程；第二单元‘帆樯如林 —— 宋元时期的陶瓷海上贸易’，宋元时期对外贸易重心转向海洋，南海贸易体系形成，龙泉窑、景德镇窑等主导陶瓷海上贸易，瓷器进入大规模外销阶段；第三单元‘瀛涯万里 —— 明清时期的陶瓷海上贸易’，全球航路开辟后，中国瓷器贸易网络延伸至欧美，景德镇窑、德化窑等外销瓷风靡世界，成为对外文化传播载体，丰富了中华文化内涵。展览展出 189 件 / 套以中国古代外销瓷器为主的精品文物，包括‘南海 I 号’等沉船出水瓷器和国家博物馆传世珍品，全方位展示古代陶瓷外销面貌及文化对外影响。",
    image: $r ('app.media.exhibits_e2') as ResourceStr,
    category: 1,
    isFree: false,
    price: 0,
    date: "2022.12.30-2023.04.02",
    openingHours: "",
    location: "南山博物馆一层一号专题展厅",
    curator: "",
    organizer: "",
    contact: "",
    liked: true,
    tags: ["古代陶瓷", "海上贸易", "海上丝绸之路"],
    audioGuide: true,
    vrTour: false,
    rating: 0,
    reviews: 0
  },
{
    id: 3,
    title: "一色万象——白瓷艺术展",
    description: "展览遴选300余件（套）白瓷珍品，分“瓷风古韵”与“美美与共”单元，展现古代白瓷技艺发展与现当代创新风貌",
    detailDescription: "2025年1月12日开幕，由中国国家博物馆、河北省文化和旅游厅、河北省文物局主办，河北博物院承办。荟萃河北、福建两地古代瓷器及当代工艺大师作品，以时间为轴、空间为纬，梳理古代白瓷技艺发展历程，凸显现当代创新风貌。",
    image: $r('app.media.exhibits_e3') as ResourceStr,
    category: 3,
    isFree: false,
    price: 0,
    date: "2025.01.12-2025.05.06",
    openingHours: "",
    location: "河北博物院北区1号展厅、2号展厅",
    curator: "",
    organizer: "中国国家博物馆、河北省文化和旅游厅、河北省文物局",
    contact: "",
    liked: false,
    tags: ["白瓷", "陶瓷艺术", "河北博物院"],
    audioGuide: true,
    vrTour: false,
    rating: 0,
    reviews: 0
},
{
    id: 4,
    title: "中国古代瓷器艺术",
    description: "展览展示中国古代瓷器美轮美奂的艺术魅力，分为青瓷、颜色釉瓷、青花瓷和彩绘瓷四个部分",
    detailDescription: "中国国家博物馆改扩建竣工开馆后首轮推出的展览，体现对古代瓷器艺术的重视。中国是世界上制造陶器和发明瓷器最早的国家，瓷器发明是对世界物质文明的重大贡献。考古发现夏代有近似瓷器的青釉陶器，东汉后期烧制成功真正瓷器。陶瓷文化是唯一贯穿中华文明发展进程未中断的物质文明，历代窑场竞胜、名品辈出，形成独具特色的制瓷中心，隋唐邢窑白瓷、越窑青瓷，两宋五大名窑，元明清青花、彩瓷，工艺精湛。国家博物馆作为世界建筑面积最大的博物馆，举办此展览，让观众通过百余件展品了解瓷器品种演变、历史内涵，欣赏艺术魅力。",
    image: $r('app.media.exhibits_e4') as ResourceStr,
    category: 1,
    isFree: true,
    price: 0,
    date: "2011.03.26-2012.02.06",
    openingHours: "",
    location: "北区三层17号展厅",
    curator: "",
    organizer: "中国国家博物馆",
    contact: "",
    liked: false,
    tags: ["古代瓷器", "青瓷", "青花瓷"],
    audioGuide: true,
    vrTour: false,
    rating: 0,
    reviews: 0
},
{
    id: 5,
    title: "归来·丝路瓷典",
    description: "展览展现中国外销瓷贯穿唐宋元明清五朝一千年的生产和贸易历史",
    detailDescription: "由中共景德镇市委宣传部主办，中国外销瓷从明末到清中期大规模销往欧美市场，成为“世界商品”和“中国制造”遗留在海外的最大财富。其身兼实用品、商品和艺术收藏品，是文化聚焦物，记录全球化进程冲击，成为多民族、多宗教、多习俗共同参与创造的文化载体，印证丝路精神。",
    image: $r('app.media.exhibits_e5') as ResourceStr,
    category: 1,
    isFree: false,
    price: 0,
    date: "2017.05.13-2017.06.30",
    openingHours: "",
    location: "北11展厅",
    curator: "",
    organizer: "中共景德镇市委宣传部",
    contact: "",
    liked: false,
    tags: ["外销瓷", "丝绸之路", "景德镇"],
    audioGuide: true,
    vrTour: false,
    rating: 0,
    reviews: 0
},
{
    id: 6,
    title: "钧瓷艺术展·中国钧瓷四海行",
    description: "展览展示钧瓷艺术魅力，促进钧瓷文化产业互动与繁荣",
    detailDescription: "钧瓷作为中国文化重要元素，宋代位列五大名瓷之首，曾受皇室青睐，后因战火濒临技绝。新中国成立后进入第二个辉煌期，成为国家领导人赠礼。本次展览由中国国际书画艺术研究会、禹州市人民政府、河南省美术馆、河南省钧瓷文化研究会主办，于2014年5月30日至6月10日在南3展厅举办。展览旨在展现钧瓷从宋代鼎盛到当代复兴的历程，呈现其‘入窑一色，出窑万彩’的独特窑变艺术。展品涵盖宋代钧窑古瓷、明清复刻珍品及当代大师创新作品，包括《尊古鼎》《荷韵瓶》等经典器型，系统梳理钧瓷的工艺传承与艺术演变。同时通过实物展示、工艺演示和学术研讨，搭建钧瓷研发、制作、收藏的互动平台，推动钧瓷文化产业的扩展与繁荣。",
    image: $r('app.media.exhibits_e6') as ResourceStr,
    category: 3,
    isFree: false,
    price: 0,
    date: "2014.05.30 - 2014.06.10",
    openingHours: "",
    location: "南3展厅",
    curator: "",
    organizer: "中国国际书画艺术研究会、禹州市人民政府、河南省美术馆、河南省钧瓷文化研究会",
    contact: "",
    liked: false,
    tags: ["钧瓷", "宋代名瓷", "陶瓷艺术"],
    audioGuide: true,
    vrTour: false,
    rating: 0,
    reviews: 0
},
{
    id: 7,
    title: "食味中华——中华古代饮食文化展",
    description: "全方位、多角度阐释中国古代源远流长、丰富多彩的饮食文化",
    detailDescription: "2025年4月10日开幕，是'中俄文化年'的重要交流项目。展览精选中国国家博物馆145件（套）珍贵文物，包括金银器、玉石器、瓷器、青铜器、丝织品、书画等多个品类，从'食自八方''茶韵酒香''琳琅美器''烹饪有术''礼始饮食'五个单元，从食材、器具、技艺、审美、礼仪等多个方面,刻画了中国古人充满烟火气息的日常生活，阐释了中国古代饮食的发展变迁与文化内涵。",
    image: $r('app.media.exhibits_e7') as ResourceStr,
    category: 4,
    isFree: true,
    price: 0,
    date: "2025.04.11—2025.08.17",
    openingHours: "",
    location: "莫斯科克里姆林宫博物馆 圣母升天钟楼展览馆、牧首宫独柱厅展览馆",
    curator: "",
    organizer: "中国国家博物馆、俄罗斯莫斯科克里姆林宫博物馆",
    contact: "",
    liked: true,
    tags: ["饮食文化", "中俄交流", "文物展"],
    audioGuide: true,
    vrTour: false,
    rating: 0,
    reviews: 0
},
{
    id: 8,
    title: "清风万里——中国古代廉洁文化",
    description: "从思想溯源、典范传扬、文化浸润三个维度，系统梳理先秦至明清时期廉洁思想演进脉络",
    detailDescription: "展览由中央纪委国家监委驻文化和旅游部纪检监察组指导，文化和旅游部机关党委和中国国家博物馆联合主办。精选中国国家博物馆藏300余件珍贵文物，同时特别呈现故宫博物院、甘肃省博物馆、宝鸡青铜器博物院、邯郸市博物馆、磁州窑博物馆五家博物馆10余件代表性文物。展览分'历史镜鉴''廉洁风范''崇廉风尚'三个单元，生动诠释古代清官廉吏的峻洁风骨，深刻解读廉洁文化对社会风尚的陶染化育，立体呈现中华民族'廉为政本、持廉守正'的价值理念。",
    image: $r('app.media.exhibits_e8') as ResourceStr,
    category: 4,
    isFree: true,
    price: 0,
    date: "2025.04.29-展出中",
    openingHours: "",
    location: "南8、南9展厅",
    curator: "",
    organizer: "中央纪委国家监委驻文化和旅游部纪检监察组、文化和旅游部机关党委和中国国家博物馆",
    contact: "",
    liked: true,
    tags: ["廉洁文化", "历史文物", "廉政教育"],
    audioGuide: true,
    vrTour: false,
    rating: 0,
    reviews: 0
}
];

// 定义筛选选项
export const FILTER_OPTIONS: FilterOption[] = [
  { id: 0, name: '全部展览' },
  { id: 1, name: '历史陶瓷' }, // 古代陶瓷历史、考古发现等
  { id: 2, name: '当代陶艺' }, // 现代艺术家作品、创新技法
  { id: 3, name: '陶瓷工艺' }, // 制作技法、窑变、釉色等工艺专题
  { id: 4, name: '文化专题' }, // 与陶瓷相关的文化主题展览
  { id: 5, name: '免费展览' },
  { id: 6, name: '景德镇本地' } // 特别突出景德镇相关的展览
];


// 根据ID获取展览详情
export function getExhibitionById(id: number): ExhibitionItem | undefined {
  return EXHIBITION_DATA.find(item => item.id === id);
}