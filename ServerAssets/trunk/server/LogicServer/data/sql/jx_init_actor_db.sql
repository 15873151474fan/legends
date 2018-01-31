CREATE DATABASE IF NOT EXISTS jx_actor default charset utf8 COLLATE utf8_general_ci; 

CREATE DATABASE IF NOT EXISTS `gstatic` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
grant all on `gstatic`.* to 'gamestatic'@'%' identified by 'xianhaiwangluo';

use jx_actor;
drop procedure if exists addbrothergroup;

drop procedure if exists addcharfriend;

drop procedure if exists addcharmsg;

drop procedure if exists addcharmsgbyactorname;

drop procedure if exists addcharnewfinishrole;

drop procedure if exists addcharnewroleitem;

drop procedure if exists addcombatgameinfo;

drop procedure if exists addcombatrecord;

drop procedure if exists addguildenvent;

drop procedure if exists addguildmember;

drop procedure if exists addguildwar;

drop procedure if exists addguildwarhistory;

drop procedure if exists addofflineguildmember;

drop procedure if exists cleanactorpets;

drop procedure if exists cleancamptoprank;

drop procedure if exists cleancharfinishroles;

drop procedure if exists cleancharfriends;

drop procedure if exists cleancharitems;

drop procedure if exists cleancharroleitems;

drop procedure if exists cleancharskills;

drop procedure if exists cleangemitems;

drop procedure if exists cleangemsuit;

drop procedure if exists cleanguildevent;

drop procedure if exists cleanjobdata;

drop procedure if exists cleanpetskills;

drop procedure if exists cleanrelation;

drop procedure if exists cleanzydata;

drop procedure if exists cleargemtoprank;

drop procedure if exists clientcreatenewcharactor;

drop procedure if exists clientdeletecharactor;

drop procedure if exists clientstartplay;

drop procedure if exists createguild;

drop procedure if exists deletebrothergroup;

drop procedure if exists deletecharmsg;

drop procedure if exists deletecombatgame;

drop procedure if exists deletecombatrecord;

drop procedure if exists deleteconsignment;

drop procedure if exists deleteguild;

drop procedure if exists deleteguildskill;

drop procedure if exists deleteguildwar;

drop procedure if exists deleteuseritem;

drop procedure if exists delguildmember;

drop procedure if exists getactorlastloginserverid;

drop procedure if exists getcharactoridbyname;

drop procedure if exists getlessjob;

drop procedure if exists getuseritem;

drop procedure if exists initdb;

drop procedure if exists initguildskill;

drop procedure if exists loadactorlistbyaccountid;

drop procedure if exists loadactorpets;

drop procedure if exists loadbattlepowerrank;

drop procedure if exists loadbrothergroupdetail;

drop procedure if exists loadbrothergrouplist;

drop procedure if exists loadcharbasicdata;

drop procedure if exists loadcharfinishroles;

drop procedure if exists loadcharfriends;

drop procedure if exists loadcharitems;

drop procedure if exists loadcharmsglist;

drop procedure if exists loadcharofflinedata;

drop procedure if exists loadcharroleitems;

drop procedure if exists loadcharskills;

drop procedure if exists loadcombatgameinfo;

drop procedure if exists loadcombatrecord;

drop procedure if exists loadconsignmentext;

drop procedure if exists loadequipedgem;

drop procedure if exists loadfilternames;

drop procedure if exists loadgemitemdata;

drop procedure if exists loadgemrankdata;

drop procedure if exists loadgemsuitdata;

drop procedure if exists loadguildbasicdata;

drop procedure if exists loadguildevent;

drop procedure if exists loadguildmemberbasic;

drop procedure if exists loadguildmembers;

drop procedure if exists loadguildskill;

drop procedure if exists loadguildwar;

drop procedure if exists loadguildwarhistory;

drop procedure if exists loadjobdata;

drop procedure if exists loadmainquest;

drop procedure if exists loadpetskills;

drop procedure if exists loadrelation;

drop procedure if exists loaduseritem;

drop procedure if exists loadzydata;

drop procedure if exists querymybrothergroup;

drop procedure if exists queryzylist;

drop procedure if exists rankingchallenge;

drop procedure if exists rankingcoin;

drop procedure if exists rankingfamecontribute;

drop procedure if exists rankingguildexp;

drop procedure if exists rankingguildlevel;

drop procedure if exists rankingguildwar;

drop procedure if exists rankinglevel;

drop procedure if exists rankingzhanhunvalue;

drop procedure if exists savebrother;

drop procedure if exists saverank;

drop procedure if exists selectguildid;

drop procedure if exists updatebrothergroup;

drop procedure if exists updatecamprankdata;

drop procedure if exists updatechallengedata;

drop procedure if exists updatecharbasicdata;

drop procedure if exists updatecombatgame;

drop procedure if exists updategemrankdata;

drop procedure if exists updateguildbasicdata;

drop procedure if exists updateguildmember;

drop procedure if exists updateguildskill;

/*==============================================================*/
/* Table: actorbagitem                                          */
/*==============================================================*/
create  table  if not exists  actorbagitem
(
   actorid              int unsigned comment '角色ID',
   itemguid             bigint comment '物品的Guid是',
   itemidquastrong      int comment '物品的ID，品质等级，强化等级',
   itemduration         int comment '物品的耐久以及耐久上限',
   itemcountflag        int comment '物品的数量以及标记',
   iteminlayhole        int comment '物品的打孔信息',
   itemtime             int comment '物品的过期时间',
   itemreservs          int comment '保留',
   itemsmith1           int default 0 comment '装备的精锻的第1个属性',
   itemsmith2           int default 0 comment '装备的精锻的第2个属性',
   itemsmith3           int default 0 comment '装备的精锻的第3个属性',
   itemreservs2         int default 0 comment '保留字节2'
)
type = MYISAM;

alter table actorbagitem comment '玩家的背包物品';

/*==============================================================*/
/* Index: bagitem_id                                            */
/*==============================================================*/
create index bagitem_id on actorbagitem
(
   actorid
);

/*==============================================================*/
/* Table: actorbinarydata                                       */
/*==============================================================*/
create  table  if not exists  actorbinarydata
(
   actorid              bigint unsigned not null comment '玩家的actorid',
   quest                varbinary(1000) default NULL comment '任务数据',
   achievefinishstate   varbinary(256) default NULL comment '成就完成和是否领取奖励的字段',
   achieveeventdata     varbinary(256) default NULL comment '成就事件的触发次数字段',
   titles               varbinary(32) default NULL comment '玩家的称号列表',
   primary key (actorid)
)
type = MYISAM;

alter table actorbinarydata comment '角色的2进制数据存放的表格';

/*==============================================================*/
/* Table: actorbrother                                          */
/*==============================================================*/
create  table  if not exists  actorbrother
(
   id                   bigint comment '结拜的id',
   actorid              int unsigned comment '玩家id',
   reser1               int default 0 comment '保留字段'
)
type = MYISAM;

alter table actorbrother comment '保存玩家的结拜兄弟的信息';

/*==============================================================*/
/* Index: actorbrotherid                                        */
/*==============================================================*/
create index actorbrotherid on actorbrother
(
   actorid
);

/*==============================================================*/
/* Table: actorconsignment                                      */
/*==============================================================*/
create  table  if not exists  actorconsignment
(
   actorid              int unsigned comment '角色ID',
   itemguid             bigint not null comment '物品的Guid是',
   itemIdquastrong      int comment '物品的ID，品质等级，强化等级',
   itemduration         int comment '物品的耐久以及耐久上限',
   itemcountflag        int comment '物品的数量以及标记',
   iteminlayhole        int comment '物品的打孔信息',
   itemtime             int comment '物品的过期时间',
   itemreservs          int comment '保留',
   itemsmith1           int default 0 comment '装备的精锻的第1个属性',
   itemsmith2           int default 0 comment '装备的精锻的第2个属性',
   itemsmith3           int default 0 comment '装备的精锻的第3个属性',
   itemreservs2         int default 0 comment '保留字节2',
   resttime             int unsigned default 0 comment '寄卖的剩余时间',
   price                int comment '寄卖的价格',
   typestatus           int comment '金钱类型和此物品的状态，高位是金钱类型',
   serverindex          int comment '服务器id，比如6服的数据，则这个值是6'
)
type = MYISAM;

alter table actorconsignment comment '寄卖系统的物品表';

/*==============================================================*/
/* Index: consi_id                                              */
/*==============================================================*/
create index consi_id on actorconsignment
(
   actorid
);

/*==============================================================*/
/* Index: consi_guid                                            */
/*==============================================================*/
create index consi_guid on actorconsignment
(
   itemguid
);

/*==============================================================*/
/* Table: actordepotitem                                        */
/*==============================================================*/
create  table  if not exists  actordepotitem
(
   actorid              int unsigned comment '角色ID',
   itemguid             bigint comment '物品的Guid是',
   itemidquastrong      int comment '物品的ID，品质等级，强化等级',
   itemduration         int comment '物品的耐久以及耐久上限',
   itemcountflag        int comment '物品的数量以及标记',
   iteminlayhole        int comment '物品的打孔信息',
   itemtime             int comment '物品的过期时间',
   itemreservs          int comment '保留',
   itemsmith1           int default 0 comment '装备的精锻的第1个属性',
   itemsmith2           int default 0 comment '装备的精锻的第2个属性',
   itemsmith3           int default 0 comment '装备的精锻的第3个属性',
   itemreservs2         int default 0 comment '保留字节2'
)
type = MYISAM;

alter table actordepotitem comment '玩家的仓库物品';

/*==============================================================*/
/* Index: depot_id                                              */
/*==============================================================*/
create index depot_id on actordepotitem
(
   actorid
);

/*==============================================================*/
/* Table: actordmkjitem                                         */
/*==============================================================*/
create  table  if not exists  actordmkjitem
(
   actorid              int unsigned comment '角色ID',
   itemguid             bigint comment '物品的Guid是',
   itemidquastrong      int comment '物品的ID，品质等级，强化等级',
   itemduration         int comment '物品的耐久以及耐久上限',
   itemcountflag        int comment '物品的数量以及标记',
   iteminlayhole        int comment '物品的打孔信息',
   itemtime             int comment '物品的过期时间',
   itemreservs          int comment '保留',
   itemsmith1           int default 0 comment '装备的精锻的第1个属性',
   itemsmith2           int default 0 comment '装备的精锻的第2个属性',
   itemsmith3           int default 0 comment '装备的精锻的第3个属性',
   itemreservs2         int default 0 comment '保留字节2'
)
type = MYISAM;

alter table actordmkjitem comment '盗梦系统仓库';

/*==============================================================*/
/* Index: dmkj_idx                                              */
/*==============================================================*/
create index dmkj_idx on actordmkjitem
(
   actorid
);

/*==============================================================*/
/* Table: actorequipitem                                        */
/*==============================================================*/
create  table  if not exists  actorequipitem
(
   actorid              int unsigned comment '角色ID',
   itemguid             bigint comment '物品的Guid是',
   itemidquastrong      int comment '物品的ID，品质等级，强化等级',
   itemduration         int comment '物品的耐久以及耐久上限',
   itemcountflag        int comment '物品的数量以及标记',
   iteminlayhole        int comment '物品的打孔信息',
   itemtime             int comment '物品的过期时间',
   itemreservs          int comment '保留',
   itemsmith1           int default 0 comment '装备的精锻的第1个属性',
   itemsmith2           int default 0 comment '装备的精锻的第2个属性',
   itemsmith3           int default 0 comment '装备的精锻的第3个属性',
   itemreservs2         int default 0 comment '保留字节2',
   score                int default 0 comment '评分'
)
type = MYISAM;

alter table actorequipitem comment '玩家的装备物品';

/*==============================================================*/
/* Index: equip_id                                              */
/*==============================================================*/
create index equip_id on actorequipitem
(
   actorid
);

/*==============================================================*/
/* Table: actorfriends                                          */
/*==============================================================*/
create  table  if not exists  actorfriends
(
   actorid              integer unsigned default 0 comment '角色id',
   rstype               integer comment '关系类型，如0表示伴侣，1表示师父',
   friendid             integer comment '对方的id，如关系是师徒，则这个是师傅的角色id
            ',
   friendname           varchar(32) character set utf8 comment '角色名，对应Friendid字段',
   param                integer unsigned default 0 comment '用于操作的参数值'
)
type = MYISAM;

alter table actorfriends comment '记录玩家的伴侣、师父、结拜兄弟等数据';

/*==============================================================*/
/* Index: Index_actor                                           */
/*==============================================================*/
create index Index_actor on actorfriends
(
   actorid
);

/*==============================================================*/
/* Table: actorgemitem                                          */
/*==============================================================*/
create  table  if not exists  actorgemitem
(
   actorid              int unsigned comment '角色id',
   gemid                int comment '宝物id',
   level                int default 1 comment '宝物等级',
   exp                  bigint default 0 comment '宝物经验',
   ss                   int default 0 comment '宝物灵力值',
   grade                int default 1 comment '宝物档次',
   quality              int default 1 comment '宝物品质',
   scattack             int default 0 comment '宝物攻击灵性值',
   scdefence            int default 0 comment '宝物防御灵性',
   scagility            int default 0 comment '宝物敏捷灵性',
   schp                 int default 0 comment '宝物血量灵性',
   uid                  bigint default 0 comment '宝物唯一标识',
   slotidx              int default 0,
   lefttime             int default 0,
   wish                 int default 0,
   gemscore             int default 0,
   smithcount           int default 0,
   smith1               int default 0,
   smith2               int default 0,
   smith3               int default 0,
   smith4               int default 0,
   upgradeval           int default 0 comment '宝物进阶度'
)
type = MYISAM;

alter table actorgemitem comment '玩家宝物表';

/*==============================================================*/
/* Index: actorgemindex                                         */
/*==============================================================*/
create index actorgemindex on actorgemitem
(
   actorid
);

/*==============================================================*/
/* Table: actorguild                                            */
/*==============================================================*/
create  table  if not exists  actorguild
(
   actorid              int unsigned not null comment '角色id',
   guildid              int unsigned comment '帮派的id',
   typetk               int comment '帮派地位和堂口id，高16位是帮派地位值，低16位表示所属堂口',
   zjnext               int unsigned default 0 comment '下次可领取 召集令的 时间',
   zznext               int unsigned default 0 comment '下次可升职（降职）的 时间',
   zscore               int default 0 comment '膜拜积分',
   zguildgx             int default 0 comment '帮派累计贡献',
   primary key (actorid)
)
type = MYISAM;

/*==============================================================*/
/* Index: actorguild_id                                         */
/*==============================================================*/
create index actorguild_id on actorguild
(
   actorid
);

/*==============================================================*/
/* Table: actormsg                                              */
/*==============================================================*/
create  table  if not exists  actormsg
(
   msgid                bigint not null auto_increment,
   actorid              integer unsigned comment '消息对应的角色id，表示这个消息要发送的对象',
   msgtype              integer comment '消息的类型',
   msg                  varbinary(1024) comment '消息的内容，二进制数据',
   primary key (msgid)
)
type = MYISAM;

alter table actormsg comment '角色的消息信息表,邮件系统';

/*==============================================================*/
/* Index: actormsg_id                                           */
/*==============================================================*/
create index actormsg_id on actormsg
(
   actorid
);

/*==============================================================*/
/* Table: actorpetitem                                          */
/*==============================================================*/
create  table  if not exists  actorpetitem
(
   actorid              int unsigned comment '角色ID',
   itemguid             bigint comment '物品的Guid是',
   itemidquastrong      int comment '物品的ID，品质等级，强化等级',
   itemduration         int comment '物品的耐久以及耐久上限',
   itemcountflag        int comment '物品的数量以及标记',
   iteminlayhole        int comment '物品的打孔信息',
   itemtime             int comment '物品的过期时间',
   itemreservs          int comment '保留',
   itemsmith1           int default 0 comment '装备的精锻的第1个属性',
   itemsmith2           int default 0 comment '装备的精锻的第2个属性',
   itemsmith3           int default 0 comment '装备的精锻的第3个属性',
   itemreservs2         int default 0 comment '保留字节2'
)
type = MYISAM;

alter table actorpetitem comment 'petitem';

/*==============================================================*/
/* Index: actor_id                                              */
/*==============================================================*/
create index actor_id on actorpetitem
(
   actorid
);

/*==============================================================*/
/* Table: actorpets                                             */
/*==============================================================*/
create  table  if not exists  actorpets
(
   actorid              int unsigned comment '玩家的actorid',
   attack               int unsigned default 0 comment '附加攻击资质',
   defence              int unsigned default 0 comment '附加防御资质',
   agility              int unsigned default 0 comment '附加敏捷资质',
   physique             int unsigned default 0 comment '附加体魄资质',
   exp                  int unsigned default 0 comment '经验',
   hp                   int unsigned default 0 comment '当前的血',
   mp                   int unsigned default 0 comment '当前的蓝',
   name                 char(32) character set utf8 comment '名字',
   quality              int default 0 comment '品质',
   strong               int default 0 comment '强化等级',
   circle               int unsigned default 0 comment '转数',
   level                int unsigned default 0 comment '等级',
   ids                  int default 0 comment '攻击类型，id,配置id',
   loyalty              int default 0 comment '忠诚度',
   reserver1            int default 0 comment '保留',
   reserver2            int default 0 comment '保留',
   baseattack           int default 0 comment '基础攻击资质',
   basedefence          int default 0 comment '基础防御资质',
   baseagility          int default 0 comment '基础敏捷资质',
   basephysique         int default 0 comment '基础体魄资质',
   score                int default 0 comment '评分'
)
type = MYISAM;

alter table actorpets comment '宠物数据';

/*==============================================================*/
/* Index: Index_1                                               */
/*==============================================================*/
create index Index_1 on actorpets
(
   actorid
);

/*==============================================================*/
/* Table: actorrelation                                         */
/*==============================================================*/
create  table  if not exists  actorrelation
(
   actorid              integer unsigned default 0,
   relationtype         int default 0,
   relationid           integer default 0,
   param                int default 0
)
type = MYISAM;

/*==============================================================*/
/* Index: actor_id                                              */
/*==============================================================*/
create index actor_id on actorrelation
(
   actorid
);

/*==============================================================*/
/* Table: actors                                                */
/*==============================================================*/
create  table  if not exists  actors
(
   accountid            int unsigned comment '账户ID',
   actorid              int unsigned not null auto_increment comment '角色ID',
   actorname            varchar(32) character set utf8 comment '玩家名字',
   icon                 int default 0 comment '头像ID',
   sex                  int default 0 comment '性别',
   level                int default 0 comment '等级',
   job                  int default 0 comment '职业',
   posx                 int default 0 comment '位置x',
   posy                 int default 0 comment '位置y',
   exp                  bigint default 0 comment '玩家的经验',
   fbhandle             int default 0 comment '副本的handle',
   sceneid              int default 0 comment '场景id',
   pkvalue              int default 0 comment '玩家的PK值',
   baggridcount         int default 0 comment '背包的格子数量',
   zhanhunvalue         int default 0 comment '战魂值',
   bindcoin             int default 0 comment '绑定金钱',
   bindyuanbao          int default 0 comment '绑定元宝',
   nonbindyuanbao       int default 0 comment '非绑定元宝',
   nonbindcoin          int default 0 comment '非绑定金钱',
   xiuwei               int default 0 comment '玩家的修为',
   status               int default 1 comment '0位:已删除,1位:已禁用,2位:有效,3位:首选',
   hp                   int default 1 comment '玩家的血',
   mp                   int default 1 comment '玩家的内力',
   energy               int default 0 comment '玩家的活力，挂机用的',
   qianlongling         int default 0 comment '潜龙令，一种代币，战场获得',
   guildid              int unsigned default 0 comment '玩家的帮派ID',
   teamid               int default 0 comment '队伍的ID',
   socialmask           int default 0 comment '玩家的社会关系，按位存储的',
   guildexp             int default 0 comment '玩家的工会贡献度',
   createtime           datetime comment '角色的创建时间',
   lastloginip          bigint unsigned default 0 comment '上次登录的ip',
   updatetime           datetime comment '服务器的存盘时间，在这个点最后一次更新db',
   deport2expiredtime   int default 0 comment '第2个仓库背包的过期时间',
   deport3expiredtime   int default 0 comment '第3个仓库背包的过期时间',
   deport4expiredtime   int default 0 comment '第4个仓库背包的过期时间',
   accountname          varchar(80) character set utf8 comment '账户的名字',
   enterfbsceneid       int default 0 comment '进入副本前的场景的ID',
   enterfbpos           int default 0 comment '进入副本前的位置(X,y合并起来)',
   dirrelated           int default 0 comment '玩家的朝向相关',
   mountexp             int default 0 comment '坐骑的经验',
   lastlogouttime       int default 0 comment '上次从逻辑服务器的退出时间,minitime格式的',
   serverindex          int default 0 comment '玩家所在的服务器的编号',
   jumppower            int default 0 comment '跳跃体力和最大跳跃体力',
   ltvicweek            int default 0 comment '本周的擂台胜利次数',
   ltmaxvicweek         int default 0 comment '本周擂台最大连胜数',
   itdurvictimes        int default 0 comment '擂台战连胜数',
   csrevivepoint        bigint default 0 comment '普通场景的复活点，是场景id,x,y的组合',
   fbrevivepoint        bigint default 0 comment '副本复活点,场景id,x,y的复合体',
   cityrevivepoint      bigint default 0 comment '城镇的复活点，是场景id，x,y的复合体',
   achievepoint         int default 0 comment '玩家的成就点',
   zycont               int default 0 comment '阵营的贡献度',
   curtitleid           int default 0 comment '玩家当前的称号的ID',
   viplevel             int default 0 comment 'vip的等级',
   vipdurtime           int unsigned default 0 comment '本级vip已经持续的时间',
   vipcreatetime        int unsigned default 0 comment '成为本机vip的时间',
   exptoday             int default 0 comment '玩家当天获得的经验的数值',
   zhanhunvaluetoday    int default 0 comment '当日累计获取的战魂值',
   zy                   int default 0 comment '玩家的阵营',
   ybplant1             int default 0 comment '元宝的种植1',
   ybplant2             int default 0 comment '元宝的种植2',
   ybplant3             int default 0 comment '元宝的种植3',
   equipscore           int unsigned default 0 comment '装备的总分',
   consumeyb            int unsigned default 0 comment '消费的元宝',
   acupoint             int unsigned default 0 comment '经脉的总和',
   zycontrtoday         int default 0 comment '今天获得的阵营贡献',
   drawybcount          int default 0 comment '玩家提取的元宝的数目',
   activity             int default 0 comment '活跃度',
   battlepower          int default 0 comment '战力',
   lastloginserverid    int default 0 comment '最后一次上线所在的服务器Id',
   primary key (actorid),
   key AK_Key_2 (accountid)
)
type = MYISAM;

alter table actors comment '玩家的角色表';

/*==============================================================*/
/* Index: actor_name                                            */
/*==============================================================*/
create unique index actor_name on actors
(
   actorname
);

/*==============================================================*/
/* Index: account_name                                          */
/*==============================================================*/
create index account_name on actors
(
   accountname
);

/*==============================================================*/
/* Index: Index_3                                               */
/*==============================================================*/
create index Index_3 on actors
(
   accountid
);

/*==============================================================*/
/* Table: actorvariable                                         */
/*==============================================================*/
create  table  if not exists  actorvariable
(
   actorid              bigint not null comment '玩家的角色id',
   variable             mediumblob,
   acupoint             mediumblob default NULL comment '保存经脉系统的数据',
   primary key (actorid)
)
type = MYISAM;

alter table actorvariable comment '角色的存脚本的数据，是二进制的buff数据';

/*==============================================================*/
/* Table: brothgrouplist                                        */
/*==============================================================*/
create  table  if not exists  brothgrouplist
(
   id                   bigint not null,
   gname                varchar(32) character set utf8 default NULL,
   serverindex          int default 0 comment '逻辑服的索引号',
   updatetime           int default 0 comment '更新称谓的时间，有限定一天改一次',
   reser1               int default 0 comment '保留字段',
   reser2               int default 0 comment '保留字段2'
)
type = MYISAM;

alter table brothgrouplist comment '保存结拜的列表';

/*==============================================================*/
/* Table: combatgame                                            */
/*==============================================================*/
create  table  if not exists  combatgame
(
   actorid              int unsigned default 0 comment '玩家id',
   winningtimes         int default 0 comment '连胜次数',
   chagangetimes        int default 0 comment '今日已挑战的次数',
   nextchagangetime     int default 0 comment '下次可以挑战的时间',
   refreshtimes         int default 0 comment '今天银两刷新的次数',
   awardrank            int default 0 comment '领取奖励的排名',
   addchagneTimes       int default 0 comment '增加的挑战次数',
   bshowflag            int default 0 comment '是否显示提示',
   reserver             int default 0 comment '预留'
)
type = MYISAM;

alter table combatgame comment '战力竞技基本信息';

/*==============================================================*/
/* Index: index_actorid                                         */
/*==============================================================*/
create index index_actorid on combatgame
(
   actorid
);

/*==============================================================*/
/* Table: combatrecord                                          */
/*==============================================================*/
create  table  if not exists  combatrecord
(
   actorid              int unsigned default 0 comment '玩家id',
   tagetId              int default 0 comment '对方的id',
   tagetname            varchar(32) comment '对方的姓名',
   nvictory             int default 0 comment '胜负关系',
   ntime                int default 0 comment '挑战的时间',
   nranking             int default 0 comment '挑战后的排名',
   nawardtype1          int default 0 comment '奖励的参数类型1',
   nawardtype2          int default 0 comment '奖励的参数类型2',
   nawardtype3          int default 0 comment '奖励的参数类型3',
   nawardvalue1         int default 0 comment '奖励的值1',
   nawardvalue2         int default 0 comment '奖励的值2',
   nawardvalue3         int default 0 comment '奖励的值3',
   reserver             int default 0 comment '预留'
)
type = MYISAM;

alter table combatrecord comment '竞技日志';

/*==============================================================*/
/* Index: index_actorid                                         */
/*==============================================================*/
create index index_actorid on combatrecord
(
   actorid
);

/*==============================================================*/
/* Table: filternames                                           */
/*==============================================================*/
create  table  if not exists  filternames
(
   namestr              varchar(64) character set utf8 not null comment '屏蔽词',
   primary key (namestr)
)
type = MYISAM;

alter table filternames comment '名称屏蔽词表';

/*==============================================================*/
/* Table: gameserveraddress                                     */
/*==============================================================*/
create  table  if not exists  gameserveraddress
(
   serverindex          int,
   serveraddress        char(128),
   serverport           int
)
type = MYISAM;

alter table gameserveraddress comment '服务器的端口';

/*==============================================================*/
/* Table: gemsuit                                               */
/*==============================================================*/
create  table  if not exists  gemsuit
(
   actorid              int unsigned default 0 comment '角色id',
   suitid               int default 0 comment '宝物命盘类型id',
   openslotcount        int default 0 comment '开启镶嵌槽数量',
   slot1uid             bigint default 0 comment '镶嵌槽1宝物uid',
   slot2uid             bigint default 0 comment '镶嵌槽2宝物uid',
   slot3uid             bigint default 0 comment '镶嵌槽3宝物uid',
   slot4uid             bigint default 0 comment '镶嵌槽4宝物uid',
   slot5uid             bigint default 0 comment '镶嵌槽5宝物uid',
   slot6uid             bigint default 0 comment '镶嵌槽6宝物uid',
   slot7uid             bigint default 0 comment '镶嵌槽7宝物uid',
   slot8uid             bigint default 0 comment '镶嵌槽8宝物uid'
)
type = MYISAM;

alter table gemsuit comment '宝物命盘表';

/*==============================================================*/
/* Index: gemsuitindex                                          */
/*==============================================================*/
create index gemsuitindex on gemsuit
(
   actorid
);

/*==============================================================*/
/* Table: goingquest                                            */
/*==============================================================*/
create  table  if not exists  goingquest
(
   actorid              int unsigned comment '角色id',
   idtask               int comment '任务id以及需求id',
   id                   int comment '对应的id',
   value                int comment '任务进度值',
   key AK_Key_1 (actorid)
)
type = MYISAM;

/*==============================================================*/
/* Table: guildevent                                            */
/*==============================================================*/
create  table  if not exists  guildevent
(
   guildid              int unsigned default 0 comment '帮派id',
   ntime                int default 0 comment '发生的时间',
   eventid              int default 0 comment '事件id',
   nparam1              int default 0 comment '参数1',
   nparam2              int default 0 comment '参数2',
   nparam3              int default 0 comment '参数3',
   nparam4              varchar(32) default NULL comment '参数4',
   nparam5              varchar(32) default NULL comment '参数5',
   reserver             int default 0 comment '保留'
)
type = MYISAM;

alter table guildevent comment '帮派事件';

/*==============================================================*/
/* Table: guildlist                                             */
/*==============================================================*/
create  table  if not exists  guildlist
(
   guildid              int unsigned not null comment '帮派的id',
   guildname            varchar(32) character set utf8 comment '帮派的名字',
   foundname            varchar(32) character set utf8 comment '创建者的名字',
   level                int default 1 comment '帮派的等级',
   fanrong              int default 0 comment '帮派的繁荣度',
   zytype               int comment '帮派的阵营的类型',
   inmemo               varchar(500) character set utf8 comment '内部公告',
   outmemo              varchar(500) character set utf8 comment '外部公告',
   status               int default 1 comment '帮派的状态',
   createtime           datetime comment '帮派创建时间',
   icon                 int default 0 comment '帮派的图片',
   serverindex          int comment '帮派所在的服务器编号',
   guildcoin            int default 0 comment '帮派资金',
   guildys              int default 0 comment '玥石',
   bosstype             int default 0 comment '帮派boss类型',
   bossscore            int default 0 comment '神 威 值'
)
type = MYISAM;

alter table guildlist comment '帮派表';

/*==============================================================*/
/* Table: guildskill                                            */
/*==============================================================*/
create  table  if not exists  guildskill
(
   guildid              int unsigned not null default 0 comment '帮派id',
   skillid              int not null default 0 comment '帮派技能',
   skilllevel           int default 0 comment '帮派技能等级',
   reserver             int default 0 comment '保留'
)
type = MYISAM;

alter table guildskill comment '帮派技能';

/*==============================================================*/
/* Table: guildstore                                            */
/*==============================================================*/
create  table  if not exists  guildstore
(
   guildid              int unsigned,
   type                 int default 0 comment '物品类型（道具0、金钱1等）',
   itemid               int default 0 comment '物品id号',
   count                int default 0 comment '数量'
)
type = MYISAM;

alter table guildstore comment '帮派仓库信息表 ';

/*==============================================================*/
/* Table: guildstorerecord                                      */
/*==============================================================*/
create  table  if not exists  guildstorerecord
(
   guildid              int unsigned,
   type                 int comment '物品类型（道具0、金钱1等）',
   itemid               int comment '物品id号',
   count                int comment '数量',
   inouttype            int comment '0表示进库，1是出库'
)
type = MYISAM;

/*==============================================================*/
/* Table: guildwar                                              */
/*==============================================================*/
create  table  if not exists  guildwar
(
   guildid              int unsigned comment '帮派id',
   relationship         int comment '目前两帮派的关系',
   warguildId           int comment '对方帮派的id',
   pkcount              int default 0 comment '杀敌数目',
   diecount             int default 0 comment '己方死亡数量',
   nexttime             int unsigned default 0 comment '改变状态的时间，状态包括和平、宣战、战争'
)
type = MYISAM;

alter table guildwar comment '保存帮派战相关的信息';

/*==============================================================*/
/* Table: guildwarhistory                                       */
/*==============================================================*/
create  table  if not exists  guildwarhistory
(
   guildid              int unsigned comment '帮派id',
   warguildid           int comment '帮派战对方的帮派id',
   pkcount              int default 0 comment '杀敌数量',
   diecount             int default 0 comment '己方死亡数量',
   endtime              datetime comment '结束时间'
)
type = MYISAM;

alter table guildwarhistory comment '帮战历史记录';

/*==============================================================*/
/* Table: jobcount                                              */
/*==============================================================*/
create  table  if not exists  jobcount
(
   job                  int default 0 comment '职业id',
   usercount            int default 1 comment '对应职业的用户数，表示多少人选择了这个职业',
   serverindex          int default 0 comment '服务器的id'
)
type = MYISAM;

alter table jobcount comment '记录选择每个职业的用户的人数';

/*==============================================================*/
/* Table: petskills                                             */
/*==============================================================*/
create  table  if not exists  petskills
(
   actorid              int unsigned default 0 comment 'actorid',
   petid                int default 0 comment '宠物的Id',
   skillid              int default 0 comment '技能的Id',
   skilllevel           int default 0 comment '技能的等级',
   reserver             int default 0 comment '保留'
)
type = MYISAM;

alter table petskills comment '宠物的技能数据';

/*==============================================================*/
/* Index: Index_actorid                                         */
/*==============================================================*/
create index Index_actorid on petskills
(
   actorid
);

/*==============================================================*/
/* Table: repeatquest                                           */
/*==============================================================*/
create  table  if not exists  repeatquest
(
   actorid              int unsigned comment '角色id',
   idtime               int comment '低16任务id，高16完成次数',
   qtime                int comment '任务计次归零的时间',
   key AK_Key_1 (actorid)
)
type = MYISAM;

/*==============================================================*/
/* Table: skill                                                 */
/*==============================================================*/
create  table  if not exists  skill
(
   actorid              int unsigned comment '玩家的ID',
   skillidlvmj          int comment '技能ID,等级，秘籍',
   cdtime               int comment 'CD时间',
   reserve              int comment '保留',
   mjexpiretime         int unsigned default 0 comment '秘籍的过期时间',
   miji                 int default 0 comment '秘籍的ID'
)
type = MYISAM;

alter table skill comment '玩家的技能表';

/*==============================================================*/
/* Index: skill_id                                              */
/*==============================================================*/
create index skill_id on skill
(
   actorid
);

/*==============================================================*/
/* Table: toprank                                               */
/*==============================================================*/
create  table  if not exists  toprank
(
   actorid              int unsigned default 0 comment '玩家的actorid',
   rankid               int default 0 comment '排名的id',
   rank                 int unsigned default 0 comment '排行名次',
   serverindex          int default 0 comment '服务器编号',
   val                  bigint default 0 comment '记录排行key1的值 各个排行榜有不同的定义',
   val2                 bigint default 0 comment '记录排行key2的值 各个排行榜有不同的定义',
   desc1                varchar(2048) default NULL comment '描述字符串1',
   desc2                varchar(2048) default NULL comment '描述字符串2'
)
type = MYISAM;

alter table toprank comment '头衔排行榜表';

/*==============================================================*/
/* Index: Index_1                                               */
/*==============================================================*/
create index Index_1 on toprank
(
   actorid
);

/*==============================================================*/
/* Table: useritem                                              */
/*==============================================================*/
create  table  if not exists  useritem
(
   id                   bigint not null auto_increment,
   accountid            int unsigned default 0 comment '帐户id，如果是角色绑定，这个填0',
   actorid              int unsigned default 0 comment '角色id，如果是账户id绑定的物品，这个写0',
   itemid               int default 0 comment '物品的id,大于100000表示金钱',
   bind                 tinyint default 0 comment '绑定属性',
   strong               tinyint default 0 comment '强化值',
   quality              tinyint default 0 comment '品质',
   itemcount            int default 1 comment '送的物品(金钱的）数量',
   serverindex          int default 0 comment '服务器id',
   memo                 varchar(32) character set utf8 default NULL comment '简单的注释，比如活动的名称',
   reser1               int default 0 comment '保留字段1',
   reser2               int default 0 comment '保留字段2',
   primary key (id)
)
type = MYISAM;

alter table useritem comment '后台奖励给用户的物品表，每个代表一个物品';

/*==============================================================*/
/* Index: useritem_accountid                                    */
/*==============================================================*/
create index useritem_accountid on useritem
(
   accountid
);

/*==============================================================*/
/* Index: useritem_actorid                                      */
/*==============================================================*/
create index useritem_actorid on useritem
(
   actorid
);

/*==============================================================*/
/* Table: zycount                                               */
/*==============================================================*/
create  table  if not exists  zycount
(
   zy                   int default 0 comment '阵营id',
   usercount            int default 1 comment '对应阵营的用户数，表示多少人选择了这个阵营',
   serverindex          int default 0 comment '服务器的id'
)
type = MYISAM;

alter table zycount comment '每个服里各个阵营玩家数量';


 delimiter $$ 
create procedure addbrothergroup (in sname varchar(32),in ut integer,in sr integer,in nid bigint)
begin
    insert into brothgrouplist(id,gname,serverindex,updatetime) values(nid,sname,sr,ut);
    select nid;
end $$ 
delimiter ;


 delimiter $$ 
create procedure addcharfriend (in nactorid integer,in nrstype integer,in nfriendid integer,in sfriendname varchar(32),in nparam  integer unsigned)
begin
    insert into actorfriends(actorid,rstype,friendid,friendname,param) values(nactorid,nrstype,nfriendid,sfriendname,nparam);
end $$ 
delimiter ;


 delimiter $$ 
create procedure addcharmsg (in nactorid integer, in nmsgtype integer,in smsg varbinary(1024))
begin
    insert into actormsg(actorid,msgtype,msg) values(nactorid,nmsgtype,smsg);
    select LAST_INSERT_ID();
end$$ 
delimiter ;


 delimiter $$ 
create procedure addcharmsgbyactorname (in nsvridx integer, in sactorname varchar(32),  in nmsgtype integer,in smsg varbinary(1024) )
begin
    declare actid int;
    select actorid into actid from actors where nsvridx=serverindex and actorname=sactorname;
    if (actid is not null) then
        insert into actormsg(actorid,msgtype,msg) values(actid,nmsgtype,smsg);
        select actid, LAST_INSERT_ID();
    end if;
end$$ 
delimiter ;


 delimiter $$ 
create procedure addcharnewfinishrole (in nactorid integer,in nidtime integer,in nqtime integer)
begin
   insert into repeatquest(actorid,idtime,qtime) values(nactorid,nidtime,nqtime);
end $$ 
delimiter ;


 delimiter $$ 
create procedure addcharnewroleitem 
(
    in nactorid integer,
    in ntaskid integer,
    in nid integer,
    in nvalue integer
 )
begin
  insert into goingquest(actorid,idtask,id,value) values(nactorid,ntaskid,nid,nvalue);
end $$ 
delimiter ;


 delimiter $$ 
create procedure addcombatgameinfo 
(
    in nactorid integer,
    in wtimes integer,
    in ctimes integer,
    in ntimes integer,
    in rtimes integer,
    in nrank integer,
    in naddtimes integer,
    in nshowflag integer
)

begin
    insert into combatgame(actorid,winningtimes,chagangetimes,nextchagangetime,refreshtimes,awardrank,addchagneTimes,bshowflag) 
    values(nactorid,wtimes,ctimes,ntimes,rtimes,nrank,naddtimes,nshowflag);

end$$ 
delimiter ;


 delimiter $$ 
create procedure addcombatrecord 
(
    in nactorid integer,
    in ntagetId integer,
    in nname varchar(32),
    in nvictory integer,
    in rtime integer,
    in nrank integer,
    in nawardtype1 integer,
    in nawardtype2 integer,
    in nawardtype3 integer,
    in nawardvalue1 integer,
    in nawardvalue2 integer,
    in nawardvalue3 integer
)

begin
    insert into combatrecord(actorid,tagetId,tagetname,nvictory,ntime,nranking,nawardtype1,nawardtype2,nawardtype3,nawardvalue1,nawardvalue2,nawardvalue3) 
    values(nactorid,ntagetId,nname,nvictory,rtime,nrank,nawardtype1,nawardtype2,nawardtype3,nawardvalue1,nawardvalue2,nawardvalue3);

end$$ 
delimiter ;


 delimiter $$ 
create procedure addguildenvent 
(
    in gid integer,
    in ntime integer,
    in zeventid integer,
    in zparam1 integer,
    in zparam2 integer,
    in zparam3 integer,
    in zparam4 varchar(32),
    in zparam5 varchar(32)
)

begin
    insert into guildevent(guildid,ntime,eventid,nparam1,nparam2,nparam3,nparam4,nparam5) 
    values(gid,ntime,zeventid,zparam1,zparam2,zparam3,zparam4,zparam5);

end$$ 
delimiter ;


 delimiter $$ 
create procedure addguildmember (in ngid integer,in nactorid integer,in ntype integer)
begin
    insert into actorguild(actorid,guildid,typetk) values(nactorid,ngid,ntype);
end$$ 
delimiter ;


 delimiter $$ 
create procedure addguildwar 
(
    in ngid integer,
    in rs integer,
    in nwarguildid integer,
    in npkcount integer,
    in ndiecount integer,
    in nnexttime integer unsigned
)

begin
    insert into guildwar(guildid,relationship,warguildid,pkcount,diecount,nexttime) 
    values(ngid,rs,nwarguildid,npkcount,ndiecount,nnexttime);

end$$ 
delimiter ;



create procedure addguildwarhistory (in ngid integer,in nwarguildid integer,
in npkcount integer,in ndiecount integer)
insert into guildwarhistory(guildid,warguildid,pkcount,diecount,endtime) values(ngid,nwarguildid,npkcount,ndiecount,now());


 delimiter $$ 
create procedure addofflineguildmember (in ngid integer,in nactorid integer,in ntype integer)
begin
declare actid int;
select actorid into actid from actors where guildid=0 and actorid=nactorid and (status & 2)=2;
if (actid is not null) then
    update actors set guildid=ngid where actorid=nactorid and (status & 2)=2;
     insert into actorguild(actorid,guildid,typetk) values(nactorid,ngid,ntype);
  select actors.actorid,actorname,guildexp,typetk,sex,level,job,zznext,zjnext from 
  actorguild,guildlist,actors where actorguild.guildid=ngid and actors.actorid=nactorid and actorguild.guildid=guildlist.guildid and guildlist.status>1  and actors.actorid=actorguild.actorid
  and (actors.status & 2) =2 limit 1; 
 end if;
end$$ 
delimiter ;


 delimiter $$ 
create procedure cleanactorpets 
(
    in nactorid integer
    
)
begin
   update actorpets set `actorid` = 0 where `actorid` = nactorid;
end $$ 
delimiter ;


 delimiter $$ 
create procedure cleancamptoprank (in _serveridx integer)
begin
    delete from toprank where serverindex = _serveridx and rankid=5;
end$$ 
delimiter ;


DELIMITER $$
create procedure cleancharfinishroles (in nactorid integer)
begin
   update repeatquest set actorid=0 where `actorid`=nactorid;
end $$
delimiter ;


delimiter $$ 
create procedure cleancharfriends (in nactorid integer)
begin
    update actorfriends set actorid=0 where actorid=nactorid;
end$$ 
delimiter ;


 delimiter $$ 
create procedure cleancharitems 
(
    in nactorid integer,
    in nitemtableid integer
)

begin
     declare boexists integer default null;
    
 
     if nitemtableid =1 then
        update actorbagitem set `actorid` = 0 where `actorid` = nactorid;
     end if;
     if nitemtableid =2 then
         update actorequipitem set `actorid` = 0 where `actorid` = nactorid;
     
     end if;
     if nitemtableid =3 then
          update actordepotitem set `actorid` = 0 where `actorid` = nactorid;
      end if;
       if nitemtableid =5 then
          update actorpetitem set `actorid` = 0 where `actorid` = nactorid;
      end if;
      if nitemtableid =6 then
          update actordmkjitem set `actorid` = 0 where `actorid` = nactorid;
      end if;
end$$ 
delimiter ;


 delimiter $$ 
create procedure cleancharroleitems 
(
    in nactorid integer
)

begin
    update goingquest set actorid=0 where `actorid`=nactorid;
end$$ 
delimiter ;


 delimiter $$ 
create procedure cleancharskills 
(
    in nactorid integer
    
)
begin
   update skill set `actorid` = 0 where `actorid` = nactorid;
end $$ 
delimiter ;


delimiter $$ 
create procedure cleangemitems 
(
    in nactorid integer    
)

begin     
    update actorgemitem set `actorid` = 0 where `actorid` = nactorid;    
end$$ 
delimiter ;


delimiter $$ 
create procedure cleangemsuit 
(
    in nactorid integer    
)

begin     
    update gemsuit set `actorid` = 0 where `actorid` = nactorid;    
end$$ 
delimiter ;


DELIMITER $$
create procedure cleanguildevent (in gid integer)
begin
   delete from guildevent where guildid=gid;
end $$
delimiter ;


 delimiter $$ 
create procedure cleanjobdata (in serveridx integer)
begin
    delete from jobcount where serverindex = serveridx;
end$$ 
delimiter ;


 delimiter $$ 
create procedure cleanpetskills 
(
    in nactorid integer
    
)
begin
   update petskills set `actorid` = 0 where `actorid` = nactorid;
end $$ 
delimiter ;


delimiter $$
create procedure cleanrelation (in _actorid integer)
begin
    update actorrelation set actorid = 0
        where actorid = _actorid;
end $$

delimiter ;


 delimiter $$ 
create procedure cleanzydata (in serveridx integer)
begin
    delete from zycount where serverindex=serveridx;
end$$ 
delimiter ;


 delimiter $$ 
create procedure cleargemtoprank (in _serveridx integer)
begin
    delete from toprank where serverindex = _serveridx and rankid=17;
end$$ 
delimiter ;


 delimiter $$ 
create procedure clientcreatenewcharactor (in naccountid integer,
in saccount varchar(64),
in ip	bigint unsigned,
in nactorid integer,
in sactorname varchar(32),
in nicon integer,
in nsex integer ,
in njob integer,
in nzy integer,
in nserverindex integer)
begin
 declare boexists integer default null;
 declare nowcount integer default 0;
 
 set nowcount = (select count(*) from actors where status<>0 and accountname=saccount and serverindex=nserverindex);
 
 if nowcount < 3 then
 
     insert into actors(`accountid`,`actorid`,`actorname`,`icon`,`sex`,`job`,`zy`,`updatetime`,`createtime`,`lastloginip`,`accountname`,status,serverindex) 
     values(naccountid,nactorid,sactorname,nicon,nsex,njob,nzy,now(),now(),ip,saccount,2,nserverindex);
     insert into actorbinarydata(actorid) values(nactorid);
     insert into actorvariable(actorid) values(nactorid);

     set boexists = (select count(job)  from jobcount where `serverindex`=nserverindex and job=njob limit 1);
     if boexists = 0 then
        insert into jobcount(job,serverindex) values(njob,nserverindex);
     else
        update jobcount set usercount=usercount+1 where `serverindex`=nserverindex and job=njob;
     end if;
 
       set boexists = (select count(zy)  from zycount where `serverindex`=nserverindex and zy=nzy limit 1);
     if boexists = 0 then
        insert into zycount(zy,serverindex) values(nzy,nserverindex);
     else
        update zycount set usercount=usercount+1 where `serverindex`=nserverindex and zy=nzy;
     end if;
     
 end if;
end;$$ 
delimiter ;


 delimiter $$ 
create procedure clientdeletecharactor ( in ncharid integer,
  in saccount varchar(64))
  
  begin
  
  update actors
  set status=0
  where actorid = ncharid and accountname=saccount limit 1;
 
  
end $$ 
delimiter ;


 delimiter $$ 
create procedure clientstartplay (	in nserverindex integer,
  in ncharid integer,
  in saccount varchar(64),
  in naccountid integer,
  in ip	bigint unsigned)
 begin
  declare boexists integer default 0;
	declare ncharstate integer default 0;

	select actorid, status into boexists, ncharstate
	from actors
	where actorid = ncharid and
		accountid = naccountid and (status & 2)=2  limit 1;
	
	/*是否有这个用户*/
	if (boexists <> 0) then
		/*先改这个账户id下的其他角色的状态，把第三位变成0*/
		update actors
		set status = (status & 0xffffff03)
		where accountid = naccountid and
			  (status & 2)=2 and
			  actorid <> ncharid;
		/*再改选中的这个角色*/
		update actors
		set status = (status | 4),lastloginip=ip 
		where accountid = naccountid and
			  (status & 2)=2  and
			  actorid = ncharid;

		select 1;
	else
		select 0;
	end if;      
 end$$ 
delimiter ;


 delimiter $$ 
create procedure createguild (in ngid integer,
    in nactorid integer,
	in sguildname varchar(32),
	in sfoundname varchar(32),
	in nzytype integer,
    in nserverindex integer,
    in nicon integer)
begin
    insert into guildlist(guildid,guildname,foundname,zytype,createtime,serverindex,icon) values(ngid,sguildname,sfoundname,nzytype,now(),nserverindex,nicon); 
end$$ 
delimiter ;


 delimiter $$ 
create procedure deletebrothergroup 
(
    in ngid bigint
)

begin
  delete from brothgrouplist where id=ngid;
  delete from actorbrother where id=ngid;

end$$ 
delimiter ;


 delimiter $$ 
create procedure deletecharmsg (IN nactorid integer, IN nmsgid bigint)
begin
     delete  from  actormsg where msgid=nmsgid and actorid=nactorid;
end;
$$ 
delimiter ;


 delimiter $$ 
create procedure deletecombatgame (in nactorid integer)

begin
    delete from combatgame where actorid=nactorid;

end$$ 
delimiter ;


 delimiter $$ 
create procedure deletecombatrecord (in nactorid integer)

begin
    delete from combatrecord where actorid=nactorid;

end$$ 
delimiter ;


 delimiter $$ 
create procedure deleteconsignment (IN nGuid bigint,IN nType int)
begin
    if nType = 1 then
    delete  from actorconsignment where itemguid=nguid;
    end if;
    if nType = 2 then
    update actorconsignment set typestatus = (typestatus | 1) where itemguid=nguid;
    end if;
end$$ 
delimiter ;


 delimiter $$ 
create procedure deleteguild (in ngid integer)
begin
update  guildlist set status=0 where guildid=ngid; 
delete from actorguild where guildid=ngid;
delete from guildstore where guildid=ngid;
delete from guildwar where  guildid=ngid;
update actors set guildid=0 where guildid=ngid;
end$$ 
delimiter ;


 delimiter $$ 
create procedure deleteguildskill (in ngid integer,in nskill integer)
begin
delete from guildskill where guildid=ngid and skillid=nskill;
end$$ 
delimiter ;


 delimiter $$ 
create procedure deleteguildwar (in ngid integer)
begin
   delete from guildwar where guildid=ngid;
end $$ 
delimiter ;


delimiter $$
create procedure deleteuseritem (in nid bigint)
begin
    delete from useritem where id=nid;
end $$

delimiter ;


 delimiter $$ 
create procedure delguildmember (in nactorid integer)
begin
delete from actorguild  where actorid=nactorid;
update actors set guildid=0 where actorid=nactorid;
end$$ 
delimiter ;


delimiter $$ 
create procedure getactorlastloginserverid 
(
    in nactorid integer, in naccountid integer, in nserverid integer
)

begin
    select lastloginserverid from actors where accountid=naccountid and serverindex=nserverid and actorid=nactorid limit 1;
end$$ 
delimiter ;


delimiter $$
create procedure getcharactoridbyname (IN sname varchar(32), in nserverindex integer)
begin
    select actorid from actors where actorname=sname and serverindex=nserverindex;
end$$

delimiter ;


 delimiter $$
create procedure getlessjob (IN nserverindex integer)
begin
    select job from jobcount  where serverindex=nserverindex order by usercount asc limit 1;
end$$ 
delimiter ;


delimiter $$
create procedure getuseritem (in naccountid integer,in nactorid integer,in nid bigint,in nserverindex integer)
begin
    declare nitemid int default null;
    declare nbind int default 0;
    declare nquality int default 0;
    declare nstrong int default 0;
    declare ncount int default 0;
    declare smemo varchar(32) default '';
    select itemid,bind,strong,quality,itemcount,memo into nitemid,nbind,nstrong,nquality,ncount,smemo from useritem where id=nid and ((accountid=0 and actorid=nactorid) or (accountid=naccountid)) and (serverindex=0 or serverindex=nserverindex);
    if nitemid is null then
        select 0,0,0,0,0,null;
    else
        select nitemid,nbind,nstrong,nquality,ncount,smemo;
    end if;
end $$

delimiter ;


 delimiter $$ 
create procedure initdb ( in nserverindex integer)
begin
    declare total integer default 0;
    set total = (select usercount from jobcount where job=2 and serverindex=nserverindex);
    if total is null then
    	insert into jobcount(usercount,job,serverindex) values(0,2,nserverindex);
    end if;
    set total = (select usercount from jobcount where job=4 and serverindex=nserverindex);
    if total is null then
    	insert into jobcount(usercount,job,serverindex) values(0,4,nserverindex);
    end if;
    set total = (select usercount from jobcount where job=7 and serverindex=nserverindex);
    if total is null then
    	insert into jobcount(usercount,job,serverindex) values(0,7,nserverindex);
    end if;
    set total = (select usercount from jobcount where job=8 and serverindex=nserverindex);
    if total is null then
    	insert into jobcount(usercount,job,serverindex) values(0,8,nserverindex);
    end if;
    set total = (select usercount from zycount where zy=1 and serverindex=nserverindex);
    if total is null then
    	insert into zycount(usercount,zy,serverindex) values(0,1,nserverindex);
    end if;   
    set total = (select usercount from zycount where zy=2 and serverindex=nserverindex);
    if total is null then
    	insert into zycount(usercount,zy,serverindex) values(0,2,nserverindex);
    end if;   
    set total = (select usercount from zycount where zy=3 and serverindex=nserverindex);
    if total is null then
    	insert into zycount(usercount,zy,serverindex) values(0,3,nserverindex);
    end if;   
end $$ 
delimiter ;


 delimiter $$ 
create procedure initguildskill (in ngid integer, in nskillid integer,in nskilllevel integer)
begin
    insert into guildskill(guildid,skillid,skilllevel) 
    values(ngid,nskillid,nskilllevel);
end$$ 
delimiter ;


 delimiter $$ 
create procedure loadactorlistbyaccountid (in naccountid integer,in nserverindex integer)
BEGIN
select `actorid`,`actorname`,`icon`,`sex`,`level`,`job`,`accountid`,`status`,`zy` from actors where accountid=naccountid and serverindex=nserverindex and (status & 2)=2 order by `level` desc;
END$$ 
delimiter ;


 delimiter $$ 
create procedure loadactorpets 
(
    in nactorid integer
    
)
begin
    select attack,defence,agility,physique,exp,hp, mp,name,quality,strong,circle,level,ids,loyalty,baseattack,basedefence,baseagility,basephysique,reserver1, reserver2,score from actorpets  where `actorid` = nactorid;
end $$ 
delimiter ;


delimiter $$ 
create procedure loadbattlepowerrank (in nlev integer)
begin
    select actorid,actorname,job,level,zy,battlepower,sex,icon from actors where battlepower>0 and level>=nlev and (status & 2)=2 order by battlepower desc limit 1000;
end $$ 
delimiter ;


delimiter $$ 
create procedure loadbrothergroupdetail (IN nid bigint)
begin
   select actors.actorid,sex,level,job,zy,actorname from 
  actorbrother,actors where actorbrother.id=nid and actors.actorid=actorbrother.actorid;
end $$ 
delimiter ;


 delimiter $$ 
create procedure loadbrothergrouplist (in nserverindex integer)
begin  
   select id,updatetime,gname  from brothgrouplist where serverindex=nserverindex;
end$$ 
delimiter ;


 delimiter $$ 
create procedure loadcharbasicdata 
(
    in nactorid integer
)
begin
   
    select posx,posy,sex,job,level,icon,exp,actorname,fbhandle,sceneid,
     pkvalue,baggridcount,zhanhunvalue,bindcoin,
     bindyuanbao,nonbindyuanbao,nonbindcoin,xiuwei,b.quest,hp,mp,energy,qianlongling,guildid,teamid,socialmask,guildexp,
     lastlogouttime,lastloginip,lastlogouttime,deport2expiredtime,deport3expiredtime,deport4expiredtime,
     accountname,enterfbsceneid,enterfbpos,dirrelated,mountexp,accountid,jumppower,ltvicweek,ltmaxvicweek,itdurvictimes,
     b.achieveeventdata,b.achievefinishstate,csrevivepoint,fbrevivepoint,cityrevivepoint,achievepoint,zycont,b.titles,
     a.curtitleid,a.viplevel,a.vipdurtime,a.vipcreatetime,a.exptoday,a.zhanhunvaluetoday,a.zy,a.ybplant1,a.ybplant2,a.ybplant3,
     a.consumeyb,a.zycontrtoday,a.drawybcount,a.activity, a.lastloginserverid from actors as a left outer join actorbinarydata as b on a.actorid=b.actorid  where a.actorid=nactorid and (a.status & 2)=2 ;
end $$ 
delimiter ;


 delimiter $$ 
create procedure loadcharfinishroles (IN nactorid INTEGER)
BEGIN
   select idtime,qtime from repeatquest  where `actorid`=nactorid;
END $$ 
delimiter ;


 delimiter $$ 
create procedure loadcharfriends (in nactorid integer)
begin
    select rstype,friendid,friendname,param from actorfriends where actorid=nactorid;
end$$ 
delimiter ;


 delimiter $$ 
create procedure loadcharitems 
(
    in nactorid integer,
    in nitemtableid integer
)

begin
     declare boexists integer default null;
    
 
     if nitemtableid =1 then
         select itemguid,itemidquastrong,itemduration,itemcountflag,iteminlayhole,itemtime,itemreservs,itemsmith1,itemsmith2,itemsmith3,itemreservs2  from actorbagitem  where `actorid` = nactorid;
     end if;
     if nitemtableid =2 then
         select itemguid,itemidquastrong,itemduration,itemcountflag,iteminlayhole,itemtime,itemreservs,itemsmith1,itemsmith2,itemsmith3,itemreservs2  from actorequipitem  where `actorid` = nactorid;
     end if;
     if nitemtableid =3 then
          select itemguid,itemidquastrong,itemduration,itemcountflag,iteminlayhole,itemtime,itemreservs,itemsmith1,itemsmith2,itemsmith3,itemreservs2  from actordepotitem  where `actorid` = nactorid;
     end if;
     if nitemtableid =4 then
          select itemguid,itemidquastrong,itemduration,itemcountflag,iteminlayhole,itemtime,itemreservs,itemsmith1,itemsmith2,itemsmith3,itemreservs2  from actorconsignment;
     end if;
     if nitemtableid =5 then
          select itemguid,itemidquastrong,itemduration,itemcountflag,iteminlayhole,itemtime,itemreservs,itemsmith1,itemsmith2,itemsmith3,itemreservs2  from actorpetitem where `actorid` = nactorid;
     end if;
     if nitemtableid =6 then
          select itemguid,itemidquastrong,itemduration,itemcountflag,iteminlayhole,itemtime,itemreservs,itemsmith1,itemsmith2,itemsmith3,itemreservs2  from actordmkjitem where `actorid` = nactorid;
     end if;
end$$ 
delimiter ;


 delimiter $$ 
create procedure loadcharmsglist (in nactorid integer,in nmsgid bigint)
begin
    if nmsgid = 0 then
        select msgid,msgtype,msg from actormsg where actorid=nactorid;
    else
        select msgid,msgtype,msg from actormsg where actorid=nactorid and msgid=nmsgid;
    end if;
end;$$ 
delimiter ;


 delimiter $$ 
create procedure loadcharofflinedata 
(
    in nactorid integer
)
begin
   
    select sex,job,level,actorname,zy,battlepower,equipscore  from actors where `actorid`= nactorid  ;
end $$ 
delimiter ;


 delimiter $$ 
create procedure loadcharroleitems 
(
    in nactorid integer
    
)
begin
   select idtask,id,value from goingquest where `actorid`=nactorid ;
end $$ 
delimiter ;


 delimiter $$ 
create procedure loadcharskills 
(
    in nactorid integer
    
)
begin
    select skillidlvmj,cdtime,reserve,mjexpiretime,miji  from skill  where `actorid` = nactorid;
end $$ 
delimiter ;


delimiter $$ 
create procedure loadcombatgameinfo (IN nactorid integer)
begin
    select winningtimes,chagangetimes,nextchagangetime,refreshtimes,awardrank,addchagneTimes,bshowflag from combatgame where actorid=nactorid;
end $$ 
delimiter ;


 delimiter $$ 
create procedure loadcombatrecord (IN nactorid integer)
begin
    select tagetId,tagetname,nvictory,ntime,nranking,nawardtype1,nawardtype2,nawardtype3,nawardvalue1,nawardvalue2,nawardvalue3 from combatrecord where actorid=nactorid;
end $$ 
delimiter ;


 delimiter $$ 
create procedure loadconsignmentext (in nactorid int,in nserverindex int)
begin
    if nactorid = 0 then
    select itemguid,itemidquastrong,itemduration,itemcountflag,iteminlayhole,itemtime,itemreservs,itemsmith1,itemsmith2,itemsmith3,itemreservs2,resttime,price,actorconsignment.actorid,actorname,typestatus  
      from actorconsignment,actors where (typestatus & 1) = 0 and actorconsignment.actorid=actors.actorid and actorconsignment.serverindex=nserverindex;
     else
     select itemguid,itemidquastrong,itemduration,itemcountflag,iteminlayhole,itemtime,itemreservs,itemsmith1,itemsmith2,itemsmith3,itemreservs2,resttime,price,actorconsignment.actorid,actorname,typestatus  
      from actorconsignment,actors where actorconsignment.actorid =nactorid and actorconsignment.actorid=actors.actorid and (typestatus & 1) = 1;
    end if;
    
end$$ 
delimiter ;


delimiter $$ 
create procedure loadequipedgem 
(
    in _actorid integer    
)

begin     
    select uid, gemid, level, exp, ss, grade, quality, scattack, scdefence, scagility, schp, 
    smithcount, smith1, smith2, smith3, smith4, gemscore, wish, lefttime, upgradeval 
    from actorgemitem as u, gemsuit as v where u.actorid=_actorid and u.actorid=v.actorid and v.slot1uid = u.uid limit 1; 
end$$ 
delimiter ;


delimiter $$

create procedure loadfilternames ()

begin
  select namestr from filternames;
end$$
delimiter ;


 delimiter $$ 
create procedure loadgemitemdata 
(
    in nactorid integer    
)
begin
    select uid, gemid, level, exp, ss, grade, quality, scattack, scdefence, scagility, schp, smithcount, smith1, smith2, smith3, smith4, gemscore, wish, lefttime, upgradeval from actorgemitem  where `actorid` = nactorid order by slotidx asc;     
end$$ 
delimiter ;


 delimiter $$ 
create procedure loadgemrankdata (in _serverindex integer)
begin
   select u.actorname, u.actorid, v.gemscore, v.scattack+v.scdefence+v.scagility+v.schp as sc, 
	v.uid, v.gemid, v.level, v.exp, v.ss, v.grade, v.quality, v.scattack, v.scdefence, v.scagility, v.schp, 
	v.smithcount, v.smith1, v.smith2, v.smith3, v.smith4, v.gemscore, v.wish, v.lefttime, v.upgradeval
	from actorgemitem as v left join actors as u on v.actorid = u.actorid where u.serverindex = _serverindex and (u.status & 2)=2
    order by v.gemscore desc, u.exp desc limit 30 ;
    
end$$ 
delimiter ;


drop procedure if exists loadgemsuitdata;


 delimiter $$ 
create procedure loadgemsuitdata 
(
    in nactorid integer    
)
begin
    select suitid, openslotcount, slot1uid, slot2uid, slot3uid, slot4uid, slot5uid, slot6uid, slot7uid, slot8uid from gemsuit  where `actorid` = nactorid;     
end$$ 
delimiter ;


 delimiter $$ 
create procedure loadguildbasicdata (in nserverindex integer)
begin  
   select guildid,level,fanrong,zytype,guildname,foundname,inmemo,outmemo,icon,guildcoin,guildys,bosstype,bossscore from guildlist where status=1 and serverindex=nserverindex;
end$$ 
delimiter ;


delimiter $$ 
create procedure loadguildevent (IN gid bigint)
begin
    select ntime,eventid,nparam1,nparam2,nparam3,nparam4,nparam5 from guildevent where guildid=gid;
end $$ 
delimiter ;


create procedure loadguildmemberbasic (in nactorid integer)
select guildid,gx,typetk,zjnext,zznext from actorguild where actorid=nactorid;


 delimiter $$ 
create procedure loadguildmembers (in ngid integer)
begin
select actors.actorid,actorname,guildexp,typetk,actors.sex,actors.level,actors.job,zznext,zjnext,zscore,lastlogouttime,zguildgx,actors.icon from 
  actorguild,guildlist,actors where actorguild.guildid=ngid and actorguild.guildid=guildlist.guildid and guildlist.status=1  and actors.actorid=actorguild.actorid
  and (actors.status & 2) =2 order by typetk>>16 desc; 
 end$$ 
delimiter ;


 delimiter $$ 
create procedure loadguildskill (in ngid integer)
begin
select skillid,skilllevel from guildskill where guildid=ngid;
end$$ 
delimiter ;


 delimiter $$ 
create procedure loadguildwar (in ngid integer)
begin
  select relationship,warguildid,pkcount,diecount,nexttime from 
  guildwar where guildid=ngid; 
end$$ 
delimiter ;


 delimiter $$ 
create procedure loadguildwarhistory (in ngid integer)
begin
  select warguildid,guildname,pkcount,diecount,endtime from 
  guildwarhistory,guildlist where guildwarhistory.guildid=ngid 
  and guildlist.guildid = guildwarhistory.warguildid order by endtime desc limit 100; 
end$$ 
delimiter ;


 delimiter $$ 
create procedure loadjobdata 
(    
)
begin
    select * from jobcount  order by serverindex;
end$$ 
delimiter ;


 delimiter $$ 
create procedure loadmainquest 
(
    in nactorid integer
    
)
begin
   select quest from actors where `actorid`=nactorid and (status & 2)=2  limit 1;
end $$ 
delimiter ;


 delimiter $$ 
create procedure loadpetskills 
(
    in nactorid integer
    
)
begin
    select petid,skillid,skilllevel,reserver  from petskills  where `actorid` = nactorid;
end $$ 
delimiter ;


delimiter $$
create procedure loadrelation (
    in _actorid integer
)
begin
    select a.relationtype,a.relationid,b.actorname,a.param from
        actorrelation as a,
        actors as b
        where a.actorid = _actorid
        and a.relationid = b.actorid;
end $$

delimiter ;


delimiter $$
create procedure loaduseritem (in naccountid integer,in nactorid integer,in nserverindex integer)
begin
   select id,itemid,bind,strong,quality,itemcount from useritem where ((accountid=0 and actorid=nactorid) or (accountid=naccountid)) and (serverindex=0 or serverindex=nserverindex);
end $$

delimiter ;


 delimiter $$ 
create procedure loadzydata 
(    
)
begin
    select * from zycount  order by serverindex;
end$$ 
delimiter ;



 delimiter $$ 
create procedure querymybrothergroup (IN nactorid int)
begin
    select id from actorbrother where actorid=nactorid;
end $$ 
delimiter ;


 delimiter $$ 
create procedure queryzylist (in nserverindex integer)
begin
 declare total integer default 0;
   declare zy1 integer default 0;
   declare zy2 integer default 0;
   declare zy3 integer default 0;
   set total = (select sum(usercount) from zycount where serverindex=nserverindex);
   set zy1 = (select usercount from zycount where serverindex=nserverindex and zy=1);
   set zy2 = (select usercount from zycount where serverindex=nserverindex and zy=2);
   set zy3 = (select usercount from zycount where serverindex=nserverindex and zy=3);
   
   if total = 0 then
        select 1,1,1;
   else
    if zy1/total < 0.35 then
        set zy1 = 1;
     else
        set zy1 = 0;
    end if;
    if zy2/total < 0.35 then
        set zy2 = 1;
    else
        set zy2 = 0;        
    end if;
    if zy3/total < 0.35 then
        set zy3 = 1;
    else
        set zy3 = 0;
    end if;
        select zy1,zy2,zy3;
   end if;

end$$ 
delimiter ;


delimiter $$ 
create procedure rankingchallenge 
(
    in serveridx integer,
    in count integer
)
begin
    set @sqlstr = concat('select actorid, actorname, sex, job, ltvicweek from actors where serverindex=',serveridx,' and ltvicweek > 0 order by ltvicweek desc limit ', count);
    prepare stmt from @sqlstr;
    execute stmt;
end $$ 
delimiter ;


delimiter $$ 
create procedure rankingcoin 
(
    in serveridx integer,
    in count integer
)
begin
    set @sqlstr = concat('select actorid, actorname, sex, job, level, (bindcoin+nonbindcoin) as coin, zy from actors where serverindex=',serveridx,' and (bindcoin+nonbindcoin) > 0 order by coin desc, exp desc limit ', count);
    prepare stmt from @sqlstr;
    execute stmt;
end $$ 
delimiter ;


 delimiter $$ 
create procedure rankingfamecontribute 
(
    in serveridx integer, 
    in count integer
    
)
begin
     set @sqlstr = concat('select actorid, actorname, sex, job, zycont from actors where serverindex=',serveridx,' and zycont > 0 order by zycont desc limit ', count);
	 prepare stmt from @sqlstr;
	 execute stmt;
end $$ 
delimiter ;


 delimiter $$ 
create procedure rankingguildexp 
(
    in serveridx integer
    
)
begin
   select actorname, sex, job, guildexp from actors where serverindex=serveridx order by guildexp desc limit 100;
end $$ 
delimiter ;


 delimiter $$ 
create procedure rankingguildlevel 
(
    in serveridx integer
    
)
begin
   select guildname, zytype, level, foundname from guildlist where serverindex=serveridx order by level desc limit 100;
end $$ 
delimiter ;


 delimiter $$ 
create procedure rankingguildwar 
(
    in serveridx integer
    
)
begin
    select  A.guildname, A.foundname, A.zytype, sum(B.pkcount) as total_pk  from   guildwar   as   B inner join  guildlist   as   A  on   A.guildid=B.guildid  where A.serverindex = serveridx  group by B.guildid order   by   total_pk desc limit 100;
end $$ 
delimiter ;


 delimiter $$ 
create procedure rankinglevel 
(
    in serveridx integer,
    in count integer
)
begin
    set @sqlstr = concat('select actorid, actorname, sex, job, level, zy from actors where serverindex=',serveridx,' order by level desc, exp desc limit ', count);
    prepare stmt from @sqlstr;
    execute stmt;
end $$ 
delimiter ;


delimiter $$ 
create procedure rankingzhanhunvalue 
(
    in serveridx integer,
    in count integer
)
begin
    set @sqlstr = concat('select actorid, actorname, sex, job, zhanhunvalue, zy from actors where serverindex=',serveridx,' and zhanhunvalue > 0 order by zhanhunvalue desc limit ', count);
    prepare stmt from @sqlstr;
    execute stmt;
end $$ 
delimiter ;


 delimiter $$ 
create procedure savebrother 
(
    in ngid bigint,
    in nactorid int,
    in ntype int
)

begin
    if ntype = 0 then
        insert into actorbrother(id,actorid) values(ngid,nactorid);
    else
        delete from actorbrother where id=ngid and actorid=nactorid;
    end if;

end$$ 
delimiter ;


delimiter $$ 
create procedure saverank 
(
    in _serveridx integer
)

begin
    delete from toprank where serverindex=_serveridx;

	insert into toprank(actorid, rankid, rank, serverindex, val) select u.actorid, 1, (@i:=@i+1) as i, u.serverindex, u.battlepower from actors as u, (select @i:=0) as it where u.serverindex = _serveridx and (u.status & 2) = 2 and u.battlepower > 0 order by u.battlepower  desc, u.exp desc limit 30;
	insert into toprank(actorid, rankid, rank, serverindex, val) select u.actorid, 2, (@i:=@i+1) as i, u.serverindex, u.level from actors as u, (select @i:=0) as it where u.serverindex = _serveridx and (u.status & 2) = 2 and u.level > 0 order by u.level desc, u.exp desc limit 30;
	insert into toprank(actorid, rankid, rank, serverindex, val) select u.actorid, 3, (@i:=@i+1) as i, u.serverindex, u.nonbindcoin from actors as u, (select @i:=0) as it where u.serverindex = _serveridx and (u.status & 2) = 2 and u.nonbindcoin > 0 order by u.nonbindcoin desc, u.exp desc limit 30;
	insert into toprank(actorid, rankid, rank, serverindex, val) select u.actorid, 4, (@i:=@i+1) as i, u.serverindex, u.acupoint from actors as u, (select @i:=0) as it where u.serverindex = _serveridx and (u.status & 2) = 2 and u.acupoint > 0 order by u.acupoint desc, u.exp desc limit 30;				
	insert into toprank(actorid, rankid, rank, serverindex, val) select u.actorid, 6, (@i:=@i+1) as i, u.serverindex, u.equipscore from actors as u, (select @i:=0) as it where u.serverindex = _serveridx and (u.status & 2) = 2 and u.equipscore > 0 order by u.equipscore desc, u.exp desc limit 30;
	insert into toprank(actorid, rankid, rank, serverindex, val, desc1) select p.actorid, 18,(@i:=@i+1) as i, u.serverindex, p.score, p.name from actorpets as p inner join actors as u on p.actorid = u.actorid, (select @i:=0) as it where u.serverindex = _serveridx and (u.status & 2) = 2 and p.score > 0 order by p.score desc limit 30;
	insert into toprank(actorid, rankid, rank, serverindex, val) select u.actorid, 19,(@i:=@i+1) as i, u.serverindex, u.energy from actors as u, (select @i:=0) as it where u.serverindex = _serveridx and (u.status & 2) = 2 and u.sex = 1 and u.energy > 0 order by u.energy desc, u.exp desc limit 30;
	insert into toprank(actorid, rankid, rank, serverindex, val) select u.actorid, 20,(@i:=@i+1) as i, u.serverindex, u.energy from actors as u, (select @i:=0) as it where u.serverindex = _serveridx and (u.status & 2) = 2 and u.sex = 0 and u.energy > 0 order by u.energy desc, u.exp desc limit 30;
	insert into toprank(actorid, rankid, rank, serverindex, val) select u.actorid, 21,(@i:=@i+1) as i, u.serverindex, u.ltvicweek from actors as u, (select @i:=0) as it where u.serverindex = _serveridx and (u.status & 2) = 2 and u.ltvicweek > 0 order by u.ltvicweek desc, u.exp desc limit 30;

end$$ 
delimiter ;


delimiter $$ 
create procedure selectguildid  (in ngid integer)
begin
select count(guildid) from actorguild where actorid=ngid;
end$$ 
delimiter ;


 delimiter $$ 
create procedure updatebrothergroup 
(
    in nid bigint,
    in sname varchar(32),
    in ut int    
)
begin
   update brothgrouplist set gname=sname,updatetime=ut where id=nid;
end $$ 
delimiter ;


 delimiter $$ 
create procedure updatecamprankdata (in _serveridx integer, in _actorid integer, in _rank integer, in _val integer)
begin
    insert into toprank(actorid, rankid, rank, serverindex, val, val2, desc1, desc2) 
            values(_actorid, 5, _rank, _serveridx, _val, 0, "", "");    
end$$ 
delimiter ;


 delimiter $$ 
create procedure updatechallengedata 
(
    in _serveridx integer    
)
begin
    update actors set `ltvicweek`=0, `ltmaxvicweek`=0,  `itdurvictimes`=0 where `serverindex`=_serveridx;
end $$ 
delimiter ;


 delimiter $$ 
create procedure updatecharbasicdata (in nactorid integer,in nposx integer,in nposy integer,in nsex integer ,in njob integer,
in nlevel integer,in nicon integer, in nlexp bigint, in nfbhandle integer, in nsceneid integer,
in npkvalue integer,
in nzhanhunvalue integer,
in nbaggridcount integer,
in nbindcoin integer,
in nbindyuanbao integer,
in nnonbindcoin integer,
in nnonbindyuanbao integer,
in nxiuwei integer,
in nhp integer,
in nmp integer,
in nenergy integer,
in nqianlongling integer,
in nguildid integer,
in nteamid integer,
in nsocialmask integer,
in nguildexp integer,
in nlastlogouttime integer,
in ndeport2expiredtime integer,
in ndeport3expiredtime integer,
in ndeport4expiredtime integer,
in nenterfbsceneid integer,
in nenterfbpos integer,
in ndirrelated integer,
in nmountexp integer,
in jumppower integer,
in ltvicweek integer,
in ltmaxvicweek integer,
in itdurvictimes integer,
in csrevivepoint bigint,
in fbrevivepoint bigint,
in cityrevivepoint bigint,
in achievepoint integer,
in zycont integer,
in curtitleid integer,
in viplevel integer,
in vipdurtime integer,
in vipcreatetime integer,
in exptoday integer,
in zhanhunvaltoday integer,
in zy integer,
in ybplant1 integer,
in ybplant2 integer,
in ybplant3 integer,
in equipscore integer,
in consumeyb integer,
in acupoint integer,
in zycontritoday integer,
in drawybcount integer,
in activity integer,
in battlepower integer,
in lastloginserverid integer,

in quest varbinary(1000) ,
in achievefinishstate varbinary(256) ,
in achieveeventdata varbinary(256) ,
in titles varbinary(32)
)

begin
   
  update actors set `icon`=nicon,`sex`=nsex,`level`=nlevel,`job`=njob,`posx`=nposx,`posy`=nposy,`exp`=nlexp,`fbhandle`=nfbhandle,`sceneid`=nsceneid, 
  `pkvalue`=npkvalue, 
  `baggridcount`=nbaggridcount, 
  `zhanhunvalue`=nzhanhunvalue, 
  `bindcoin`=nbindcoin, 
  `bindyuanbao`=nbindyuanbao, 
  `nonbindyuanbao`=nnonbindyuanbao, 
  `nonbindcoin`=nnonbindcoin, 
  `xiuwei`=nxiuwei,
  `hp`=nhp,
  `mp`=nmp,
  `energy`=nenergy,
  `qianlongling`=nqianlongling,
  `guildid`=nguildid,
  `teamid`=nteamid,
   `socialmask`=nsocialmask,
  `guildexp`=nguildexp,
  `lastlogouttime`=nlastlogouttime,
  `deport2expiredtime`=ndeport2expiredtime,
  `deport3expiredtime`=ndeport3expiredtime,
  `deport4expiredtime`=ndeport4expiredtime,
  `enterfbsceneid`=nenterfbsceneid,
  `enterfbpos`=nenterfbpos,
  `dirrelated`=ndirrelated,
  `mountexp`=nmountexp,
 `updatetime`=now(),
 `jumppower`=jumppower,
 `ltvicweek`=ltvicweek,
 `ltmaxvicweek`=ltmaxvicweek,
 `itdurvictimes`=itdurvictimes,
 `csrevivepoint`=csrevivepoint,
 `fbrevivepoint`=fbrevivepoint,
 `cityrevivepoint`=cityrevivepoint,
 `achievepoint`=achievepoint,
 `zycont`=zycont,
 `curtitleid`=curtitleid,
  `viplevel`=viplevel,
  `vipdurtime`=vipdurtime,
  `vipcreatetime`=vipcreatetime,
  `exptoday`=exptoday,
  `zhanhunvaluetoday`=zhanhunvaltoday,
  `zy` =zy,
  `ybplant1`=ybplant1,
  `ybplant2`=ybplant2,
  `ybplant3`=ybplant3,
  `equipscore`=equipscore,
  `consumeyb`=consumeyb,
  `acupoint`=acupoint,
  
  `zycontrtoday`=zycontritoday,
  `drawybcount`=drawybcount,
  `activity`=activity,
  `battlepower`=battlepower,  
  `lastloginserverid`=lastloginserverid
  
  where `actorid`=nactorid limit 1;
  

  update actorbinarydata set `quest`=quest,`achievefinishstate`=achievefinishstate,`achieveeventdata`=achieveeventdata,`titles`= titles  where `actorid`=nactorid limit 1;
 
   
end $$ 
delimiter ;


 delimiter $$ 
create procedure updatecombatgame (in nactorid integer,in nrank integer)

begin
    update combatgame set awardrank=nrank where actorid=nactorid;

end$$ 
delimiter ;


 delimiter $$ 
create procedure updategemrankdata (in _serveridx integer, in _actorid integer, in _rank integer,in _val1 integer, in _val2 integer, 
                        in _desc1 varchar(2048), in _desc2 varchar(2048))
begin
    insert into toprank(actorid, rankid, rank, serverindex, val, val2, desc1, desc2) 
            values(_actorid, 17, _rank, _serveridx, _val1, _val2, _desc1, _desc2);    
end$$ 
delimiter ;


 delimiter $$ 
create procedure updateguildbasicdata (in ngid integer,in nlevel integer,in nfr integer,in ncoin integer,in nys integer,in ntype integer,in nscore integer,in sin varchar(500),in sout varchar(500))
begin
   update guildlist set `level`=nlevel,fanrong=nfr,inmemo=sin,outmemo=sout,guildcoin=ncoin,guildys=nys,bosstype=ntype,bossscore=nscore where guildid=ngid;
end $$ 
delimiter ;


 delimiter $$ 
create procedure updateguildmember (in ngid integer, in nactorid integer,in ntypetk integer,in nzjnext integer unsigned, in nzznext integer unsigned,in nscore integer,in zgx integer)
begin
update actorguild set typetk=ntypetk,zjnext=nzjnext,zznext=nzznext,zscore=nscore,zguildgx=zgx where actorid=nactorid and guildid=ngid;
end$$ 
delimiter ;


 delimiter $$ 
create procedure updateguildskill (in ngid integer, in nskillid integer,in nskilllevel integer)
begin
update guildskill set skilllevel=nskilllevel where skillid=nskillid and guildid=ngid;
end$$ 
delimiter ;




SET FOREIGN_KEY_CHECKS=0;

DELETE FROM `filternames`;


INSERT INTO `filternames` VALUES ('37玩');
INSERT INTO `filternames` VALUES ('37wan');
INSERT INTO `filternames` VALUES ('3gm');
INSERT INTO `filternames` VALUES ('4399');
INSERT INTO `filternames` VALUES ('吕玲绮');
INSERT INTO `filternames` VALUES ('吕蒙');
INSERT INTO `filternames` VALUES ('吕秀莲');
INSERT INTO `filternames` VALUES ('烂人');
INSERT INTO `filternames` VALUES ('吕虔');
INSERT INTO `filternames` VALUES ('烂鸟');
INSERT INTO `filternames` VALUES ('烂逼');
INSERT INTO `filternames` VALUES ('吕布');
INSERT INTO `filternames` VALUES ('美国');
INSERT INTO `filternames` VALUES ('美国之音');
INSERT INTO `filternames` VALUES ('览叫');
INSERT INTO `filternames` VALUES ('ADMIN');
INSERT INTO `filternames` VALUES ('Administrator');
INSERT INTO `filternames` VALUES ('列宁');
INSERT INTO `filternames` VALUES ('凌统');
INSERT INTO `filternames` VALUES ('妈比');
INSERT INTO `filternames` VALUES ('凌操');
INSERT INTO `filternames` VALUES ('妈的');
INSERT INTO `filternames` VALUES ('蒙古鞑子');
INSERT INTO `filternames` VALUES ('肏');
INSERT INTO `filternames` VALUES ('老毛子');
INSERT INTO `filternames` VALUES ('劳拉');
INSERT INTO `filternames` VALUES ('李岚清');
INSERT INTO `filternames` VALUES ('马岱');
INSERT INTO `filternames` VALUES ('马良');
INSERT INTO `filternames` VALUES ('AIDS');
INSERT INTO `filternames` VALUES ('李瑞环');
INSERT INTO `filternames` VALUES ('李儒');
INSERT INTO `filternames` VALUES ('老土');
INSERT INTO `filternames` VALUES ('马腾');
INSERT INTO `filternames` VALUES ('李通');
INSERT INTO `filternames` VALUES ('李严');
INSERT INTO `filternames` VALUES ('梦遗');
INSERT INTO `filternames` VALUES ('马英九');
INSERT INTO `filternames` VALUES ('马谡');
INSERT INTO `filternames` VALUES ('李鹏');
INSERT INTO `filternames` VALUES ('老母');
INSERT INTO `filternames` VALUES ('马忠');
INSERT INTO `filternames` VALUES ('李长春');
INSERT INTO `filternames` VALUES ('马超');
INSERT INTO `filternames` VALUES ('孟达');
INSERT INTO `filternames` VALUES ('李大师');
INSERT INTO `filternames` VALUES ('李大钊');
INSERT INTO `filternames` VALUES ('李催');
INSERT INTO `filternames` VALUES ('李登辉');
INSERT INTO `filternames` VALUES ('李典');
INSERT INTO `filternames` VALUES ('里根');
INSERT INTO `filternames` VALUES ('李洪志');
INSERT INTO `filternames` VALUES ('孟获');
INSERT INTO `filternames` VALUES ('李恢');
INSERT INTO `filternames` VALUES ('老虎机');
INSERT INTO `filternames` VALUES ('廖化');
INSERT INTO `filternames` VALUES ('马加爵');
INSERT INTO `filternames` VALUES ('马克思');
INSERT INTO `filternames` VALUES ('民运');
INSERT INTO `filternames` VALUES ('民主');
INSERT INTO `filternames` VALUES ('民主潮');
INSERT INTO `filternames` VALUES ('民主党');
INSERT INTO `filternames` VALUES ('民国');
INSERT INTO `filternames` VALUES ('民进党');
INSERT INTO `filternames` VALUES ('刘岱');
INSERT INTO `filternames` VALUES ('刘协');
INSERT INTO `filternames` VALUES ('刘晔');
INSERT INTO `filternames` VALUES ('刘少奇');
INSERT INTO `filternames` VALUES ('刘禅');
INSERT INTO `filternames` VALUES ('糜竺');
INSERT INTO `filternames` VALUES ('卖淫');
INSERT INTO `filternames` VALUES ('刘云山');
INSERT INTO `filternames` VALUES ('刘淇');
INSERT INTO `filternames` VALUES ('卖逼');
INSERT INTO `filternames` VALUES ('刘备');
INSERT INTO `filternames` VALUES ('刘伯承');
INSERT INTO `filternames` VALUES ('刘封');
INSERT INTO `filternames` VALUES ('迷幻药');
INSERT INTO `filternames` VALUES ('乱交');
INSERT INTO `filternames` VALUES ('ASS');
INSERT INTO `filternames` VALUES ('六四');
INSERT INTO `filternames` VALUES ('六四运动');
INSERT INTO `filternames` VALUES ('满宠');
INSERT INTO `filternames` VALUES ('淋病');
INSERT INTO `filternames` VALUES ('曼德拉');
INSERT INTO `filternames` VALUES ('密宗');
INSERT INTO `filternames` VALUES ('滥交');
INSERT INTO `filternames` VALUES ('轮流干');
INSERT INTO `filternames` VALUES ('轮盘赌');
INSERT INTO `filternames` VALUES ('林彪');
INSERT INTO `filternames` VALUES ('轮干');
INSERT INTO `filternames` VALUES ('轮奸');
INSERT INTO `filternames` VALUES ('乐进');
INSERT INTO `filternames` VALUES ('林肯');
INSERT INTO `filternames` VALUES ('毛泽东');
INSERT INTO `filternames` VALUES ('毛玠');
INSERT INTO `filternames` VALUES ('连战');
INSERT INTO `filternames` VALUES ('拉姆斯菲尔德');
INSERT INTO `filternames` VALUES ('鲁肃');
INSERT INTO `filternames` VALUES ('来爽我');
INSERT INTO `filternames` VALUES ('来插我');
INSERT INTO `filternames` VALUES ('来干');
INSERT INTO `filternames` VALUES ('赖昌星');
INSERT INTO `filternames` VALUES ('路易');
INSERT INTO `filternames` VALUES ('梅毒');
INSERT INTO `filternames` VALUES ('陆逊');
INSERT INTO `filternames` VALUES ('两个中国');
INSERT INTO `filternames` VALUES ('嗑药');
INSERT INTO `filternames` VALUES ('雷铜');
INSERT INTO `filternames` VALUES ('罗荣桓');
INSERT INTO `filternames` VALUES ('罗干');
INSERT INTO `filternames` VALUES ('摸咪咪');
INSERT INTO `filternames` VALUES ('明慧网');
INSERT INTO `filternames` VALUES ('baidu');
INSERT INTO `filternames` VALUES ('baofeng');
INSERT INTO `filternames` VALUES ('Bitch');
INSERT INTO `filternames` VALUES ('BLOW');
INSERT INTO `filternames` VALUES ('cao');
INSERT INTO `filternames` VALUES ('氢弹');
INSERT INTO `filternames` VALUES ('抢劫');
INSERT INTO `filternames` VALUES ('情色');
INSERT INTO `filternames` VALUES ('China');
INSERT INTO `filternames` VALUES ('Client');
INSERT INTO `filternames` VALUES ('桥瑁');
INSERT INTO `filternames` VALUES ('欠人骑');
INSERT INTO `filternames` VALUES ('欠骑');
INSERT INTO `filternames` VALUES ('欠干');
INSERT INTO `filternames` VALUES ('强奸');
INSERT INTO `filternames` VALUES ('强奸犯');
INSERT INTO `filternames` VALUES ('亲民党');
INSERT INTO `filternames` VALUES ('daywan');
INSERT INTO `filternames` VALUES ('新党');
INSERT INTO `filternames` VALUES ('新疆独立');
INSERT INTO `filternames` VALUES ('新疆分裂');
INSERT INTO `filternames` VALUES ('新疆国');
INSERT INTO `filternames` VALUES ('DICK');
INSERT INTO `filternames` VALUES ('徐庶');
INSERT INTO `filternames` VALUES ('徐盛');
INSERT INTO `filternames` VALUES ('徐向前');
INSERT INTO `filternames` VALUES ('许禇');
INSERT INTO `filternames` VALUES ('徐晃');
INSERT INTO `filternames` VALUES ('许攸');
INSERT INTO `filternames` VALUES ('性欲');
INSERT INTO `filternames` VALUES ('性虐');
INSERT INTO `filternames` VALUES ('性高潮');
INSERT INTO `filternames` VALUES ('性交');
INSERT INTO `filternames` VALUES ('小乔');
INSERT INTO `filternames` VALUES ('小泉');
INSERT INTO `filternames` VALUES ('小穴');
INSERT INTO `filternames` VALUES ('小参考');
INSERT INTO `filternames` VALUES ('校内网');
INSERT INTO `filternames` VALUES ('肉棒');
INSERT INTO `filternames` VALUES ('肉壶');
INSERT INTO `filternames` VALUES ('世纪天成');
INSERT INTO `filternames` VALUES ('如来');
INSERT INTO `filternames` VALUES ('人民报');
INSERT INTO `filternames` VALUES ('人人网');
INSERT INTO `filternames` VALUES ('乳头');
INSERT INTO `filternames` VALUES ('乳晕');
INSERT INTO `filternames` VALUES ('乳峰');
INSERT INTO `filternames` VALUES ('乳房');
INSERT INTO `filternames` VALUES ('乳交');
INSERT INTO `filternames` VALUES ('孙乾');
INSERT INTO `filternames` VALUES ('孙尚香');
INSERT INTO `filternames` VALUES ('孙权');
INSERT INTO `filternames` VALUES ('孙文');
INSERT INTO `filternames` VALUES ('孙逸仙');
INSERT INTO `filternames` VALUES ('释迦牟尼');
INSERT INTO `filternames` VALUES ('上你');
INSERT INTO `filternames` VALUES ('孙中山');
INSERT INTO `filternames` VALUES ('上妳');
INSERT INTO `filternames` VALUES ('孙策');
INSERT INTO `filternames` VALUES ('宋楚瑜');
INSERT INTO `filternames` VALUES ('孙坚');
INSERT INTO `filternames` VALUES ('神婆');
INSERT INTO `filternames` VALUES ('蜀国');
INSERT INTO `filternames` VALUES ('神汉');
INSERT INTO `filternames` VALUES ('神经病');
INSERT INTO `filternames` VALUES ('日死');
INSERT INTO `filternames` VALUES ('审配');
INSERT INTO `filternames` VALUES ('日你');
INSERT INTO `filternames` VALUES ('审查');
INSERT INTO `filternames` VALUES ('苏家屯');
INSERT INTO `filternames` VALUES ('他妈的');
INSERT INTO `filternames` VALUES ('他娘');
INSERT INTO `filternames` VALUES ('他干');
INSERT INTO `filternames` VALUES ('赛他娘');
INSERT INTO `filternames` VALUES ('赛她娘');
INSERT INTO `filternames` VALUES ('升天');
INSERT INTO `filternames` VALUES ('三陪');
INSERT INTO `filternames` VALUES ('赛你娘');
INSERT INTO `filternames` VALUES ('她娘');
INSERT INTO `filternames` VALUES ('赛妳娘');
INSERT INTO `filternames` VALUES ('三国梦');
INSERT INTO `filternames` VALUES ('射精');
INSERT INTO `filternames` VALUES ('撒切尔');
INSERT INTO `filternames` VALUES ('手淫');
INSERT INTO `filternames` VALUES ('去死');
INSERT INTO `filternames` VALUES ('去他妈');
INSERT INTO `filternames` VALUES ('去她妈');
INSERT INTO `filternames` VALUES ('圣战');
INSERT INTO `filternames` VALUES ('去你妈');
INSERT INTO `filternames` VALUES ('去你的');
INSERT INTO `filternames` VALUES ('圣母');
INSERT INTO `filternames` VALUES ('去妳妈');
INSERT INTO `filternames` VALUES ('去妳的');
INSERT INTO `filternames` VALUES ('骚B');
INSERT INTO `filternames` VALUES ('骚货');
INSERT INTO `filternames` VALUES ('湿了');
INSERT INTO `filternames` VALUES ('色情');
INSERT INTO `filternames` VALUES ('爽你');
INSERT INTO `filternames` VALUES ('杀人');
INSERT INTO `filternames` VALUES ('瘸腿帮');
INSERT INTO `filternames` VALUES ('傻B');
INSERT INTO `filternames` VALUES ('傻比');
INSERT INTO `filternames` VALUES ('傻子');
INSERT INTO `filternames` VALUES ('斯大林');
INSERT INTO `filternames` VALUES ('屎');
INSERT INTO `filternames` VALUES ('屎你娘');
INSERT INTO `filternames` VALUES ('屎妳娘');
INSERT INTO `filternames` VALUES ('私人服务器');
INSERT INTO `filternames` VALUES ('山本五十六');
INSERT INTO `filternames` VALUES ('私服');
INSERT INTO `filternames` VALUES ('司马朗');
INSERT INTO `filternames` VALUES ('司马懿');
INSERT INTO `filternames` VALUES ('示威');
INSERT INTO `filternames` VALUES ('萨马兰奇');
INSERT INTO `filternames` VALUES ('萨达姆');
INSERT INTO `filternames` VALUES ('塔利班');
INSERT INTO `filternames` VALUES ('FUCK');
INSERT INTO `filternames` VALUES ('funshion');
INSERT INTO `filternames` VALUES ('game');
INSERT INTO `filternames` VALUES ('GAMEMASTER');
INSERT INTO `filternames` VALUES ('GM');
INSERT INTO `filternames` VALUES ('屠杀');
INSERT INTO `filternames` VALUES ('吴仪');
INSERT INTO `filternames` VALUES ('吴懿');
INSERT INTO `filternames` VALUES ('吴邦国');
INSERT INTO `filternames` VALUES ('外挂');
INSERT INTO `filternames` VALUES ('吴国');
INSERT INTO `filternames` VALUES ('吴国太');
INSERT INTO `filternames` VALUES ('吴官正');
INSERT INTO `filternames` VALUES ('温家宝');
INSERT INTO `filternames` VALUES ('下注');
INSERT INTO `filternames` VALUES ('乡巴佬');
INSERT INTO `filternames` VALUES ('先奸后杀');
INSERT INTO `filternames` VALUES ('天主教');
INSERT INTO `filternames` VALUES ('天安门事件');
INSERT INTO `filternames` VALUES ('田丰');
INSERT INTO `filternames` VALUES ('向朗');
INSERT INTO `filternames` VALUES ('王乐泉');
INSERT INTO `filternames` VALUES ('陶谦');
INSERT INTO `filternames` VALUES ('我日');
INSERT INTO `filternames` VALUES ('我日你');
INSERT INTO `filternames` VALUES ('王双');
INSERT INTO `filternames` VALUES ('王兆国');
INSERT INTO `filternames` VALUES ('王莆');
INSERT INTO `filternames` VALUES ('王平');
INSERT INTO `filternames` VALUES ('王八蛋');
INSERT INTO `filternames` VALUES ('我操');
INSERT INTO `filternames` VALUES ('向宠');
INSERT INTO `filternames` VALUES ('王丹');
INSERT INTO `filternames` VALUES ('王刚');
INSERT INTO `filternames` VALUES ('王洪文');
INSERT INTO `filternames` VALUES ('我奸');
INSERT INTO `filternames` VALUES ('王匡');
INSERT INTO `filternames` VALUES ('我咧干');
INSERT INTO `filternames` VALUES ('吸毒');
INSERT INTO `filternames` VALUES ('文殊');
INSERT INTO `filternames` VALUES ('文丑');
INSERT INTO `filternames` VALUES ('夏侯渊');
INSERT INTO `filternames` VALUES ('夏侯惇');
INSERT INTO `filternames` VALUES ('文化部');
INSERT INTO `filternames` VALUES ('唐家璇');
INSERT INTO `filternames` VALUES ('沃尔开西');
INSERT INTO `filternames` VALUES ('希拉克');
INSERT INTO `filternames` VALUES ('希特勒');
INSERT INTO `filternames` VALUES ('台联');
INSERT INTO `filternames` VALUES ('台湾民国');
INSERT INTO `filternames` VALUES ('台湾岛国');
INSERT INTO `filternames` VALUES ('台湾独立');
INSERT INTO `filternames` VALUES ('台独');
INSERT INTO `filternames` VALUES ('台独万岁');
INSERT INTO `filternames` VALUES ('台独分子');
INSERT INTO `filternames` VALUES ('太史慈');
INSERT INTO `filternames` VALUES ('太子党');
INSERT INTO `filternames` VALUES ('维护');
INSERT INTO `filternames` VALUES ('伟哥');
INSERT INTO `filternames` VALUES ('习近平');
INSERT INTO `filternames` VALUES ('系统');
INSERT INTO `filternames` VALUES ('系统公告');
INSERT INTO `filternames` VALUES ('魏延');
INSERT INTO `filternames` VALUES ('魏国');
INSERT INTO `filternames` VALUES ('尉健行');
INSERT INTO `filternames` VALUES ('跳大神');
INSERT INTO `filternames` VALUES ('威而柔');
INSERT INTO `filternames` VALUES ('威而钢');
INSERT INTO `filternames` VALUES ('西藏独立');
INSERT INTO `filternames` VALUES ('西藏分裂');
INSERT INTO `filternames` VALUES ('西藏国');
INSERT INTO `filternames` VALUES ('西哈努克');
INSERT INTO `filternames` VALUES ('JOB');
INSERT INTO `filternames` VALUES ('kao');
INSERT INTO `filternames` VALUES ('KEFU');
INSERT INTO `filternames` VALUES ('K他命');
INSERT INTO `filternames` VALUES ('KISS');
INSERT INTO `filternames` VALUES ('kugou');
INSERT INTO `filternames` VALUES ('kuwo');
INSERT INTO `filternames` VALUES ('master');
INSERT INTO `filternames` VALUES ('MY');
INSERT INTO `filternames` VALUES ('亚历山大');
INSERT INTO `filternames` VALUES ('杨修');
INSERT INTO `filternames` VALUES ('严颜');
INSERT INTO `filternames` VALUES ('NMD');
INSERT INTO `filternames` VALUES ('NND');
INSERT INTO `filternames` VALUES ('颜良');
INSERT INTO `filternames` VALUES ('阳痿');
INSERT INTO `filternames` VALUES ('颜射');
INSERT INTO `filternames` VALUES ('阳物');
INSERT INTO `filternames` VALUES ('阳具');
INSERT INTO `filternames` VALUES ('阎王');
INSERT INTO `filternames` VALUES ('学运');
INSERT INTO `filternames` VALUES ('学潮');
INSERT INTO `filternames` VALUES ('穴');
INSERT INTO `filternames` VALUES ('巡查');
INSERT INTO `filternames` VALUES ('押小');
INSERT INTO `filternames` VALUES ('押大');
INSERT INTO `filternames` VALUES ('鸦片');
INSERT INTO `filternames` VALUES ('伊斯兰');
INSERT INTO `filternames` VALUES ('俞正声');
INSERT INTO `filternames` VALUES ('伊籍');
INSERT INTO `filternames` VALUES ('早泄');
INSERT INTO `filternames` VALUES ('铀');
INSERT INTO `filternames` VALUES ('运营');
INSERT INTO `filternames` VALUES ('游行');
INSERT INTO `filternames` VALUES ('游戏管理员');
INSERT INTO `filternames` VALUES ('造反');
INSERT INTO `filternames` VALUES ('阴门');
INSERT INTO `filternames` VALUES ('镇压');
INSERT INTO `filternames` VALUES ('赵云');
INSERT INTO `filternames` VALUES ('郁慕明');
INSERT INTO `filternames` VALUES ('貂蝉');
INSERT INTO `filternames` VALUES ('阴部');
INSERT INTO `filternames` VALUES ('阴唇');
INSERT INTO `filternames` VALUES ('阴道');
INSERT INTO `filternames` VALUES ('阴蒂');
INSERT INTO `filternames` VALUES ('阴核');
INSERT INTO `filternames` VALUES ('阴户');
INSERT INTO `filternames` VALUES ('阴茎');
INSERT INTO `filternames` VALUES ('赵紫阳');
INSERT INTO `filternames` VALUES ('淫');
INSERT INTO `filternames` VALUES ('淫乱');
INSERT INTO `filternames` VALUES ('淫湿');
INSERT INTO `filternames` VALUES ('淫水');
INSERT INTO `filternames` VALUES ('淫娃');
INSERT INTO `filternames` VALUES ('淫穴');
INSERT INTO `filternames` VALUES ('淫液');
INSERT INTO `filternames` VALUES ('淫汁');
INSERT INTO `filternames` VALUES ('淫洞');
INSERT INTO `filternames` VALUES ('淫秽');
INSERT INTO `filternames` VALUES ('再奸');
INSERT INTO `filternames` VALUES ('于禁');
INSERT INTO `filternames` VALUES ('渣波波');
INSERT INTO `filternames` VALUES ('张郃');
INSERT INTO `filternames` VALUES ('张辽');
INSERT INTO `filternames` VALUES ('张纮');
INSERT INTO `filternames` VALUES ('张立昌');
INSERT INTO `filternames` VALUES ('张梁');
INSERT INTO `filternames` VALUES ('张松');
INSERT INTO `filternames` VALUES ('张杨');
INSERT INTO `filternames` VALUES ('张翼');
INSERT INTO `filternames` VALUES ('张昭');
INSERT INTO `filternames` VALUES ('张邈');
INSERT INTO `filternames` VALUES ('张苞');
INSERT INTO `filternames` VALUES ('张宝');
INSERT INTO `filternames` VALUES ('张春桥');
INSERT INTO `filternames` VALUES ('张德江');
INSERT INTO `filternames` VALUES ('张飞');
INSERT INTO `filternames` VALUES ('张既');
INSERT INTO `filternames` VALUES ('张角');
INSERT INTO `filternames` VALUES ('遗精');
INSERT INTO `filternames` VALUES ('真理教');
INSERT INTO `filternames` VALUES ('真善忍');
INSERT INTO `filternames` VALUES ('真主安拉');
INSERT INTO `filternames` VALUES ('摇头丸');
INSERT INTO `filternames` VALUES ('姚文元');
INSERT INTO `filternames` VALUES ('元宝');
INSERT INTO `filternames` VALUES ('袁尚');
INSERT INTO `filternames` VALUES ('袁术');
INSERT INTO `filternames` VALUES ('袁绍');
INSERT INTO `filternames` VALUES ('袁熙');
INSERT INTO `filternames` VALUES ('袁谭');
INSERT INTO `filternames` VALUES ('袁遗');
INSERT INTO `filternames` VALUES ('原子弹');
INSERT INTO `filternames` VALUES ('耶稣');
INSERT INTO `filternames` VALUES ('耶和华');
INSERT INTO `filternames` VALUES ('援交');
INSERT INTO `filternames` VALUES ('援交妹');
INSERT INTO `filternames` VALUES ('圆满');
INSERT INTO `filternames` VALUES ('叶剑英');
INSERT INTO `filternames` VALUES ('一夜情');
INSERT INTO `filternames` VALUES ('一中一台');
INSERT INTO `filternames` VALUES ('一党专政');
INSERT INTO `filternames` VALUES ('一贯道');
INSERT INTO `filternames` VALUES ('罂粟');
INSERT INTO `filternames` VALUES ('曾庆红');
INSERT INTO `filternames` VALUES ('曾培炎');
INSERT INTO `filternames` VALUES ('政治');
INSERT INTO `filternames` VALUES ('政治反对派');
INSERT INTO `filternames` VALUES ('政治犯');
INSERT INTO `filternames` VALUES ('政变');
INSERT INTO `filternames` VALUES ('政府');
INSERT INTO `filternames` VALUES ('penis');
INSERT INTO `filternames` VALUES ('pps');
INSERT INTO `filternames` VALUES ('sb');
INSERT INTO `filternames` VALUES ('Server');
INSERT INTO `filternames` VALUES ('sex');
INSERT INTO `filternames` VALUES ('shit');
INSERT INTO `filternames` VALUES ('SM');
INSERT INTO `filternames` VALUES ('SUCK');
INSERT INTO `filternames` VALUES ('tmd');
INSERT INTO `filternames` VALUES ('tnnd');
INSERT INTO `filternames` VALUES ('verycd');
INSERT INTO `filternames` VALUES ('荀或');
INSERT INTO `filternames` VALUES ('荀攸');
INSERT INTO `filternames` VALUES ('尻');
INSERT INTO `filternames` VALUES ('潘璋');
INSERT INTO `filternames` VALUES ('屙');
INSERT INTO `filternames` VALUES ('彭德怀');
INSERT INTO `filternames` VALUES ('庞统');
INSERT INTO `filternames` VALUES ('庞德');
INSERT INTO `filternames` VALUES ('牛头马面');
INSERT INTO `filternames` VALUES ('牛金');
INSERT INTO `filternames` VALUES ('你妈了妹');
INSERT INTO `filternames` VALUES ('你妈逼');
INSERT INTO `filternames` VALUES ('穆斯林');
INSERT INTO `filternames` VALUES ('拿破仑');
INSERT INTO `filternames` VALUES ('穆罕默德');
INSERT INTO `filternames` VALUES ('尼克松');
INSERT INTO `filternames` VALUES ('起义');
INSERT INTO `filternames` VALUES ('纳粹');
INSERT INTO `filternames` VALUES ('南蛮');
INSERT INTO `filternames` VALUES ('骑他');
INSERT INTO `filternames` VALUES ('骑她');
INSERT INTO `filternames` VALUES ('骑你');
INSERT INTO `filternames` VALUES ('奶娘');
INSERT INTO `filternames` VALUES ('嫖娼');
INSERT INTO `filternames` VALUES ('南华早报');
INSERT INTO `filternames` VALUES ('仆街');
INSERT INTO `filternames` VALUES ('奶子');
INSERT INTO `filternames` VALUES ('尿');
INSERT INTO `filternames` VALUES ('聂荣臻');
INSERT INTO `filternames` VALUES ('普贤');
INSERT INTO `filternames` VALUES ('普京');
INSERT INTO `filternames` VALUES ('嫩b');
INSERT INTO `filternames` VALUES ('破鞋');
INSERT INTO `filternames` VALUES ('摩门教');
INSERT INTO `filternames` VALUES ('屁眼');
INSERT INTO `filternames` VALUES ('墨索里尼');
INSERT INTO `filternames` VALUES ('默克尔');
INSERT INTO `filternames` VALUES ('谋杀');
INSERT INTO `filternames` VALUES ('婊子');
INSERT INTO `filternames` VALUES ('中国之春');
INSERT INTO `filternames` VALUES ('中共');
INSERT INTO `filternames` VALUES ('猪猡');
INSERT INTO `filternames` VALUES ('朱镕基');
INSERT INTO `filternames` VALUES ('朱德');
INSERT INTO `filternames` VALUES ('诸葛亮');
INSERT INTO `filternames` VALUES ('诸葛瑾');
INSERT INTO `filternames` VALUES ('朱桓');
INSERT INTO `filternames` VALUES ('钟繇');
INSERT INTO `filternames` VALUES ('钟会');
INSERT INTO `filternames` VALUES ('周瑜');
INSERT INTO `filternames` VALUES ('周泰');
INSERT INTO `filternames` VALUES ('周永康');
INSERT INTO `filternames` VALUES ('周仓');
INSERT INTO `filternames` VALUES ('周恩来');
INSERT INTO `filternames` VALUES ('支那');
INSERT INTO `filternames` VALUES ('指导员');
INSERT INTO `filternames` VALUES ('妳老母的');
INSERT INTO `filternames` VALUES ('妳娘的');
INSERT INTO `filternames` VALUES ('屄');
INSERT INTO `filternames` VALUES ('屌');
INSERT INTO `filternames` VALUES ('掯');
INSERT INTO `filternames` VALUES ('ＧＭ');
INSERT INTO `filternames` VALUES ('奥马尔');
INSERT INTO `filternames` VALUES ('班禅');
INSERT INTO `filternames` VALUES ('奥巴马');
INSERT INTO `filternames` VALUES ('百度');
INSERT INTO `filternames` VALUES ('阿弥陀佛');
INSERT INTO `filternames` VALUES ('阿拉法特');
INSERT INTO `filternames` VALUES ('阿罗约');
INSERT INTO `filternames` VALUES ('阿扁');
INSERT INTO `filternames` VALUES ('挨球');
INSERT INTO `filternames` VALUES ('艾森豪威尔');
INSERT INTO `filternames` VALUES ('爱液');
INSERT INTO `filternames` VALUES ('爱滋');
INSERT INTO `filternames` VALUES ('安南');
INSERT INTO `filternames` VALUES ('安非他命');
INSERT INTO `filternames` VALUES ('白莲教');
INSERT INTO `filternames` VALUES ('白痴');
INSERT INTO `filternames` VALUES ('白粉');
INSERT INTO `filternames` VALUES ('冰毒');
INSERT INTO `filternames` VALUES ('逼');
INSERT INTO `filternames` VALUES ('逼毛');
INSERT INTO `filternames` VALUES ('变态');
INSERT INTO `filternames` VALUES ('逼你老母');
INSERT INTO `filternames` VALUES ('暴风');
INSERT INTO `filternames` VALUES ('鲍信');
INSERT INTO `filternames` VALUES ('鲍威尔');
INSERT INTO `filternames` VALUES ('本拉登');
INSERT INTO `filternames` VALUES ('笨蛋');
INSERT INTO `filternames` VALUES ('测拿');
INSERT INTO `filternames` VALUES ('册那');
INSERT INTO `filternames` VALUES ('蔡琰');
INSERT INTO `filternames` VALUES ('柴玲');
INSERT INTO `filternames` VALUES ('操');
INSERT INTO `filternames` VALUES ('操林');
INSERT INTO `filternames` VALUES ('操他');
INSERT INTO `filternames` VALUES ('操他妈');
INSERT INTO `filternames` VALUES ('操她');
INSERT INTO `filternames` VALUES ('操她妈');
INSERT INTO `filternames` VALUES ('操你');
INSERT INTO `filternames` VALUES ('操你妈');
INSERT INTO `filternames` VALUES ('操妳妈');
INSERT INTO `filternames` VALUES ('曹仁');
INSERT INTO `filternames` VALUES ('曹彰');
INSERT INTO `filternames` VALUES ('草你');
INSERT INTO `filternames` VALUES ('草拟妈');
INSERT INTO `filternames` VALUES ('曹植');
INSERT INTO `filternames` VALUES ('曹叡');
INSERT INTO `filternames` VALUES ('曹操');
INSERT INTO `filternames` VALUES ('曹冲');
INSERT INTO `filternames` VALUES ('曹刚川');
INSERT INTO `filternames` VALUES ('曹洪');
INSERT INTO `filternames` VALUES ('曹丕');
INSERT INTO `filternames` VALUES ('插');
INSERT INTO `filternames` VALUES ('插你');
INSERT INTO `filternames` VALUES ('插你妈');
INSERT INTO `filternames` VALUES ('布朗');
INSERT INTO `filternames` VALUES ('布莱尔');
INSERT INTO `filternames` VALUES ('布什');
INSERT INTO `filternames` VALUES ('藏青');
INSERT INTO `filternames` VALUES ('藏青会');
INSERT INTO `filternames` VALUES ('藏独');
INSERT INTO `filternames` VALUES ('藏复');
INSERT INTO `filternames` VALUES ('藏妇会');
INSERT INTO `filternames` VALUES ('陈良宇');
INSERT INTO `filternames` VALUES ('陈水扁');
INSERT INTO `filternames` VALUES ('陈群');
INSERT INTO `filternames` VALUES ('陈武');
INSERT INTO `filternames` VALUES ('陈毅');
INSERT INTO `filternames` VALUES ('陈震');
INSERT INTO `filternames` VALUES ('陈云');
INSERT INTO `filternames` VALUES ('陈至立');
INSERT INTO `filternames` VALUES ('陈到');
INSERT INTO `filternames` VALUES ('陈独秀');
INSERT INTO `filternames` VALUES ('陈宫');
INSERT INTO `filternames` VALUES ('陈娇');
INSERT INTO `filternames` VALUES ('抽头');
INSERT INTO `filternames` VALUES ('筹码');
INSERT INTO `filternames` VALUES ('程昱');
INSERT INTO `filternames` VALUES ('程普');
INSERT INTO `filternames` VALUES ('臭西');
INSERT INTO `filternames` VALUES ('臭机');
INSERT INTO `filternames` VALUES ('臭机八');
INSERT INTO `filternames` VALUES ('臭鸡');
INSERT INTO `filternames` VALUES ('臭鸡巴');
INSERT INTO `filternames` VALUES ('出售');
INSERT INTO `filternames` VALUES ('戳你');
INSERT INTO `filternames` VALUES ('蠢猪');
INSERT INTO `filternames` VALUES ('达赖喇嘛');
INSERT INTO `filternames` VALUES ('大麻');
INSERT INTO `filternames` VALUES ('大乔');
INSERT INTO `filternames` VALUES ('大卫教');
INSERT INTO `filternames` VALUES ('大玩');
INSERT INTO `filternames` VALUES ('大血比');
INSERT INTO `filternames` VALUES ('大参考');
INSERT INTO `filternames` VALUES ('打倒共产党');
INSERT INTO `filternames` VALUES ('大法');
INSERT INTO `filternames` VALUES ('吹喇叭');
INSERT INTO `filternames` VALUES ('吹箫');
INSERT INTO `filternames` VALUES ('纯一郎');
INSERT INTO `filternames` VALUES ('催情药');
INSERT INTO `filternames` VALUES ('道教');
INSERT INTO `filternames` VALUES ('电驴');
INSERT INTO `filternames` VALUES ('叼你');
INSERT INTO `filternames` VALUES ('叼你妈');
INSERT INTO `filternames` VALUES ('邓小平');
INSERT INTO `filternames` VALUES ('邓芝');
INSERT INTO `filternames` VALUES ('邓艾');
INSERT INTO `filternames` VALUES ('吊');
INSERT INTO `filternames` VALUES ('典韦');
INSERT INTO `filternames` VALUES ('荡妇');
INSERT INTO `filternames` VALUES ('导弹');
INSERT INTO `filternames` VALUES ('地藏');
INSERT INTO `filternames` VALUES ('多维');
INSERT INTO `filternames` VALUES ('额尔德尼');
INSERT INTO `filternames` VALUES ('杜冷丁');
INSERT INTO `filternames` VALUES ('杜鲁门');
INSERT INTO `filternames` VALUES ('赌马');
INSERT INTO `filternames` VALUES ('赌球');
INSERT INTO `filternames` VALUES ('赌博');
INSERT INTO `filternames` VALUES ('丁奉');
INSERT INTO `filternames` VALUES ('东条英机');
INSERT INTO `filternames` VALUES ('东突');
INSERT INTO `filternames` VALUES ('东亚病夫');
INSERT INTO `filternames` VALUES ('东正教');
INSERT INTO `filternames` VALUES ('董袭');
INSERT INTO `filternames` VALUES ('董允');
INSERT INTO `filternames` VALUES ('董昭');
INSERT INTO `filternames` VALUES ('董卓');
INSERT INTO `filternames` VALUES ('恩格斯');
INSERT INTO `filternames` VALUES ('风行');
INSERT INTO `filternames` VALUES ('风水');
INSERT INTO `filternames` VALUES ('佛教');
INSERT INTO `filternames` VALUES ('佛祖');
INSERT INTO `filternames` VALUES ('逢纪');
INSERT INTO `filternames` VALUES ('废物');
INSERT INTO `filternames` VALUES ('费祎');
INSERT INTO `filternames` VALUES ('发骚');
INSERT INTO `filternames` VALUES ('法轮');
INSERT INTO `filternames` VALUES ('法轮大法');
INSERT INTO `filternames` VALUES ('法轮功');
INSERT INTO `filternames` VALUES ('法正');
INSERT INTO `filternames` VALUES ('法国');
INSERT INTO `filternames` VALUES ('反党');
INSERT INTO `filternames` VALUES ('反共');
INSERT INTO `filternames` VALUES ('贩毒');
INSERT INTO `filternames` VALUES ('服务天使');
INSERT INTO `filternames` VALUES ('服务器');
INSERT INTO `filternames` VALUES ('服务管理');
INSERT INTO `filternames` VALUES ('干勒');
INSERT INTO `filternames` VALUES ('干林');
INSERT INTO `filternames` VALUES ('干啦');
INSERT INTO `filternames` VALUES ('干死');
INSERT INTO `filternames` VALUES ('干入');
INSERT INTO `filternames` VALUES ('干他');
INSERT INTO `filternames` VALUES ('干他妈');
INSERT INTO `filternames` VALUES ('干她');
INSERT INTO `filternames` VALUES ('干她妈');
INSERT INTO `filternames` VALUES ('干爽');
INSERT INTO `filternames` VALUES ('干我');
INSERT INTO `filternames` VALUES ('干一干');
INSERT INTO `filternames` VALUES ('干X');
INSERT INTO `filternames` VALUES ('干你');
INSERT INTO `filternames` VALUES ('干你妈');
INSERT INTO `filternames` VALUES ('干你妈B');
INSERT INTO `filternames` VALUES ('干你妈逼');
INSERT INTO `filternames` VALUES ('干你娘');
INSERT INTO `filternames` VALUES ('干您');
INSERT INTO `filternames` VALUES ('甘宁');
INSERT INTO `filternames` VALUES ('干妳');
INSERT INTO `filternames` VALUES ('干妳娘');
INSERT INTO `filternames` VALUES ('干牠');
INSERT INTO `filternames` VALUES ('干爆');
INSERT INTO `filternames` VALUES ('干到');
INSERT INTO `filternames` VALUES ('干干');
INSERT INTO `filternames` VALUES ('干机');
INSERT INTO `filternames` VALUES ('干鸡');
INSERT INTO `filternames` VALUES ('冈村秀树');
INSERT INTO `filternames` VALUES ('冈村宁次');
INSERT INTO `filternames` VALUES ('辅助程序');
INSERT INTO `filternames` VALUES ('富兰克林');
INSERT INTO `filternames` VALUES ('肛门');
INSERT INTO `filternames` VALUES ('肛交');
INSERT INTO `filternames` VALUES ('高览');
INSERT INTO `filternames` VALUES ('高丽朴');
INSERT INTO `filternames` VALUES ('高丽棒子');
INSERT INTO `filternames` VALUES ('高顺');
INSERT INTO `filternames` VALUES ('高治联');
INSERT INTO `filternames` VALUES ('高干');
INSERT INTO `filternames` VALUES ('高自联');
INSERT INTO `filternames` VALUES ('龟头');
INSERT INTO `filternames` VALUES ('顾雍');
INSERT INTO `filternames` VALUES ('拐卖');
INSERT INTO `filternames` VALUES ('郭汜');
INSERT INTO `filternames` VALUES ('观世音');
INSERT INTO `filternames` VALUES ('郭图');
INSERT INTO `filternames` VALUES ('国内动态清样');
INSERT INTO `filternames` VALUES ('郭伯雄');
INSERT INTO `filternames` VALUES ('官方');
INSERT INTO `filternames` VALUES ('郭淮');
INSERT INTO `filternames` VALUES ('郭嘉');
INSERT INTO `filternames` VALUES ('郭攸之');
INSERT INTO `filternames` VALUES ('管理');
INSERT INTO `filternames` VALUES ('管理员');
INSERT INTO `filternames` VALUES ('滚');
INSERT INTO `filternames` VALUES ('公孙瓒');
INSERT INTO `filternames` VALUES ('共产党');
INSERT INTO `filternames` VALUES ('共党');
INSERT INTO `filternames` VALUES ('共匪');
INSERT INTO `filternames` VALUES ('狗娘养的');
INSERT INTO `filternames` VALUES ('狗操卖逼');
INSERT INTO `filternames` VALUES ('狗干');
INSERT INTO `filternames` VALUES ('关兴');
INSERT INTO `filternames` VALUES ('关羽');
INSERT INTO `filternames` VALUES ('关平');
INSERT INTO `filternames` VALUES ('郝昭');
INSERT INTO `filternames` VALUES ('核潜艇');
INSERT INTO `filternames` VALUES ('核武器');
INSERT INTO `filternames` VALUES ('核工业基地');
INSERT INTO `filternames` VALUES ('赫鲁晓夫');
INSERT INTO `filternames` VALUES ('河殇');
INSERT INTO `filternames` VALUES ('胡耀邦');
INSERT INTO `filternames` VALUES ('胡志明');
INSERT INTO `filternames` VALUES ('黑白无常');
INSERT INTO `filternames` VALUES ('胡锦涛');
INSERT INTO `filternames` VALUES ('海洛因');
INSERT INTO `filternames` VALUES ('韩馥');
INSERT INTO `filternames` VALUES ('韩遂');
INSERT INTO `filternames` VALUES ('韩当');
INSERT INTO `filternames` VALUES ('韩浩');
INSERT INTO `filternames` VALUES ('贺龙');
INSERT INTO `filternames` VALUES ('贺国强');
INSERT INTO `filternames` VALUES ('活动管理员');
INSERT INTO `filternames` VALUES ('机掰');
INSERT INTO `filternames` VALUES ('机八');
INSERT INTO `filternames` VALUES ('机巴');
INSERT INTO `filternames` VALUES ('基地组织');
INSERT INTO `filternames` VALUES ('基督教');
INSERT INTO `filternames` VALUES ('黄权');
INSERT INTO `filternames` VALUES ('黄色');
INSERT INTO `filternames` VALUES ('黄月英');
INSERT INTO `filternames` VALUES ('黄忠');
INSERT INTO `filternames` VALUES ('黄大仙');
INSERT INTO `filternames` VALUES ('黄盖');
INSERT INTO `filternames` VALUES ('黄巾');
INSERT INTO `filternames` VALUES ('黄菊');
INSERT INTO `filternames` VALUES ('华雄');
INSERT INTO `filternames` VALUES ('华盛顿');
INSERT INTO `filternames` VALUES ('华歆');
INSERT INTO `filternames` VALUES ('华建敏');
INSERT INTO `filternames` VALUES ('回良玉');
INSERT INTO `filternames` VALUES ('回回');
INSERT INTO `filternames` VALUES ('回教');
INSERT INTO `filternames` VALUES ('监狱');
INSERT INTO `filternames` VALUES ('监督');
INSERT INTO `filternames` VALUES ('监管');
INSERT INTO `filternames` VALUES ('奸');
INSERT INTO `filternames` VALUES ('奸他');
INSERT INTO `filternames` VALUES ('奸她');
INSERT INTO `filternames` VALUES ('奸淫');
INSERT INTO `filternames` VALUES ('奸一奸');
INSERT INTO `filternames` VALUES ('妓女');
INSERT INTO `filternames` VALUES ('奸你');
INSERT INTO `filternames` VALUES ('奸暴');
INSERT INTO `filternames` VALUES ('简雍');
INSERT INTO `filternames` VALUES ('贱人');
INSERT INTO `filternames` VALUES ('贱货');
INSERT INTO `filternames` VALUES ('贾庆林');
INSERT INTO `filternames` VALUES ('贾诩');
INSERT INTO `filternames` VALUES ('贾逵');
INSERT INTO `filternames` VALUES ('鸡掰');
INSERT INTO `filternames` VALUES ('鸡歪');
INSERT INTO `filternames` VALUES ('鸡八');
INSERT INTO `filternames` VALUES ('鸡巴');
INSERT INTO `filternames` VALUES ('鸡奸');
INSERT INTO `filternames` VALUES ('鸡鸡');
INSERT INTO `filternames` VALUES ('金日成');
INSERT INTO `filternames` VALUES ('金正日');
INSERT INTO `filternames` VALUES ('姜维');
INSERT INTO `filternames` VALUES ('江青');
INSERT INTO `filternames` VALUES ('江泽民');
INSERT INTO `filternames` VALUES ('疆独');
INSERT INTO `filternames` VALUES ('蒋钦');
INSERT INTO `filternames` VALUES ('蒋琬');
INSERT INTO `filternames` VALUES ('蒋中正');
INSERT INTO `filternames` VALUES ('蒋介石');
INSERT INTO `filternames` VALUES ('蒋经国');
INSERT INTO `filternames` VALUES ('沮授');
INSERT INTO `filternames` VALUES ('茎');
INSERT INTO `filternames` VALUES ('精液');
INSERT INTO `filternames` VALUES ('精子');
INSERT INTO `filternames` VALUES ('酷我');
INSERT INTO `filternames` VALUES ('酷狗');
INSERT INTO `filternames` VALUES ('克林顿');
INSERT INTO `filternames` VALUES ('可卡因');
INSERT INTO `filternames` VALUES ('客.服');
INSERT INTO `filternames` VALUES ('客服');
INSERT INTO `filternames` VALUES ('客户服务');
INSERT INTO `filternames` VALUES ('口交');
INSERT INTO `filternames` VALUES ('卡斯特罗');
INSERT INTO `filternames` VALUES ('开房');
INSERT INTO `filternames` VALUES ('靠');
INSERT INTO `filternames` VALUES ('靠你妈');
INSERT INTO `filternames` VALUES ('孔融');
INSERT INTO `filternames` VALUES ('孔伷');
INSERT INTO `filternames` VALUES ('自焚');
INSERT INTO `filternames` VALUES ('祖茂');
INSERT INTO `filternames` VALUES ('做爱');
INSERT INTO `filternames` VALUES ('祝融');
INSERT INTO `filternames` VALUES ('转法轮');
INSERT INTO `filternames` VALUES ('坐庄');
INSERT INTO `filternames` VALUES ('走私');
INSERT INTO `filternames` VALUES ('走向圆满');
INSERT INTO `filternames` VALUES ('兀突骨');
INSERT INTO `filternames` VALUES ('独立');
INSERT INTO `filternames` VALUES ('分裂');

INSERT INTO `filternames` VALUES ('朱雀堂');
INSERT INTO `filternames` VALUES ('青龙堂');
INSERT INTO `filternames` VALUES ('白虎堂');
INSERT INTO `filternames` VALUES ('玄武堂');
