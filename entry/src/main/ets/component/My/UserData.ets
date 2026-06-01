

export class UserData {
  public name: string;
  public avatar: Resource | string;
  public memberLevel: string;
  public points: number;
  public phone: string;

  constructor(
    name: string,
    avatar: Resource | string,
    memberLevel: string,
    points: number,
    phone: string = ''
  ) {
    this.name = name;
    this.avatar = avatar;
    this.memberLevel = memberLevel;
    this.points = points;
    this.phone = phone;
  }
}
//快捷路由
export class  QuickAction {
  public icon: Resource | string;
  public name: string;
  public page: string;
  constructor(
    icon: Resource | string,
    name: string,
    page: string,
  ) {
    this.name = name;
    this.icon = icon;
    this.page = page;
  }
}
// 博物馆收藏类型
export class MuseumCollection {
  public id: string;
  public name: string;
  public count: number;
  public cover: Resource | string;

  constructor(
  id: string,
  name: string,
  count: number,
  cover: Resource | string
  ) {
  this.id = id;
  this.name = name;
  this.count = count;
  this.cover = cover;
}
}

// 最近参观类型
export class RecentVisit {
  public id: string;
  public name: string;
  public date: string;
  public image: Resource | string

  constructor(
  id: string,
  name: string,
  date: string,
  image: Resource | string
  ) {
  this.id = id;
  this.name = name;
  this.date = date;
  this.image = image;
}
}

// 博物馆基础信息
export class MuseumInfo {
  public id: string;
  public name: string;
  public location: string;
  public coverImage: string;
  public description: string;
  public openingHours: string;
  public ticketPrice: string;

  constructor(
  id: string,
  name: string,
  location: string,
  coverImage: string,
  description: string,
  openingHours: string,
  ticketPrice: string
  ) {
  this.id = id;
  this.name = name;
  this.location = location;
  this.coverImage = coverImage;
  this.description = description;
  this.openingHours = openingHours;
  this.ticketPrice = ticketPrice;
}
}

// 活动信息
export class EventInfo {
  public id: string;
  public title: string;
  public museumId: string;
  public museumName: string;
  public startTime: string;
  public endTime: string;
  public coverImage: string;
  public description: string;
  public isRegistered: boolean;

  constructor(
  id: string,
  title: string,
  museumId: string,
  museumName: string,
  startTime: string,
  endTime: string,
  coverImage: string,
  description: string,
  isRegistered: boolean
  ) {
  this.id = id;
  this.title = title;
  this.museumId = museumId;
  this.museumName = museumName;
  this.startTime = startTime;
  this.endTime = endTime;
  this.coverImage = coverImage;
  this.description = description;
  this.isRegistered = isRegistered;
}
}

// 门票信息
export class TicketInfo {
  public id: string;
  public museumId: string;
  public museumName: string;
  public ticketType: string;
  public visitDate: string;
  public price: number;
  public status: '未使用' | '已使用' | '已过期';
  public qrCode: string;

  constructor(
  id: string,
  museumId: string,
  museumName: string,
  ticketType: string,
  visitDate: string,
  price: number,
  status: '未使用' | '已使用' | '已过期',
  qrCode: string
  ) {
  this.id = id;
  this.museumId = museumId;
  this.museumName = museumName;
  this.ticketType = ticketType;
  this.visitDate = visitDate;
  this.price = price;
  this.status = status;
  this.qrCode = qrCode;
}
}

// ==================== 数据返回类型 ====================

interface AllData {
  userInfo: UserData;
  collections: MuseumCollection[];
  recentVisits: RecentVisit[];
}

// ==================== 模拟数据服务 ====================

export class MockDataService {
  // 获取用户信息
  static getUserInfo(): UserData {
    return new UserData(
      '博物馆爱好者',
      '/common/images/default_avatar.png',
      '普通会员',
      450
    );
  }

  // 获取收藏列表
  static getCollections(): MuseumCollection[] {
    return [
      new MuseumCollection('1', '青铜器收藏', 12, '/common/images/collection1.jpg'),
      new MuseumCollection('2', '瓷器珍品', 8, '/common/images/collection2.jpg'),
      new MuseumCollection('3', '书画艺术', 5, '/common/images/collection3.jpg')
    ];
  }

  // 获取最近参观记录
  static getRecentVisits(): RecentVisit[] {
    return [
      new RecentVisit('1', '国家博物馆', '2023-05-15', '/common/images/museum1.jpg'),
      new RecentVisit('2', '故宫博物院', '2023-04-22', '/common/images/museum2.jpg'),
      new RecentVisit('3', '上海博物馆', '2023-03-10', '/common/images/museum3.jpg')
    ];
  }

  // 获取所有数据
  static getAllData(): AllData {
    return {
      userInfo: MockDataService.getUserInfo(),       // 使用类名
      collections: MockDataService.getCollections(), // 使用类名
      recentVisits: MockDataService.getRecentVisits() // 使用类名
    };
  }

  // 获取博物馆信息示例
  static getMuseumInfo(): MuseumInfo {
    return new MuseumInfo(
      '1',
      '国家博物馆',
      '北京市东城区',
      '/common/images/national_museum.jpg',
      '中国最大的综合性博物馆',
      '9:00-17:00（周一闭馆）',
      '免费'
    );
  }

  // 获取活动信息示例
  static getEventInfo(): EventInfo {
    return new EventInfo(
      '1',
      '青铜器特展',
      '1',
      '国家博物馆',
      '2023-10-01',
      '2023-12-31',
      '/common/images/bronze_exhibition.jpg',
      '中国古代青铜器精品展览',
      false
    );
  }

  // 获取门票信息示例
  static getTicketInfo(): TicketInfo {
    return new TicketInfo(
      '1',
      '1',
      '国家博物馆',
      '成人票',
      '2023-11-15',
      0,
      '未使用',
      '/common/qrcodes/ticket_123.png'
    );
  }
}