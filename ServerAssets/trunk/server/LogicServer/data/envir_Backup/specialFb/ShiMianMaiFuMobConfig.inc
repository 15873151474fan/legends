--lua script

--[[键入'ss'并按分号即可按模板生成脚本]]--
--常量配置 
WAVEID = 5
ROUNDID = 6
WAVECOMP = 7
FBconf =
{
  OpenMonId = 422,	--刷怪开始触发怪物ID
  mobId = {423, 424, 488, 489, 490, 491, 492, 493, 494, 495, 496, 497, 498, 499, 500, 501, 502, 503},	--怪物死亡触发ID表
  MobNpc = Lang.EntityName.n00369,	--注册怪物死亡延时NPC载体
}

--十面埋伏 刷怪表
--翠竹林                                        
MobConf = 
{
--第1波
{
mobInterval = 4*1000,  --刷怪间隔时间  每mobInterval毫秒刷一次(最低间隔为5s，小于5s自动调整为5s)
mobRound = 3, --刷怪次数  用于每波怪分多少次刷
monLimit = 0, --限制怪物数  用于少于次限制数是触发下一波怪
  notice = Lang.FBTalk.f00051,      --本波刷怪后公告
mon =
{
{sid=142, mid=488, x1=5, x2=12, y=19, num=1, liveTime=3600, path = {28,19},}, --飞刀门猛鳄
{sid=142, mid=488, x1=38, x2=46, y=19, num=1, liveTime=3600, path = {23,19},}, --飞刀门猛鳄
},
},

--第2波
{
mobInterval = 5*1000,  --刷怪间隔时间  每mobInterval毫秒刷一次(最低间隔为5s，小于5s自动调整为5s)
mobRound = 3, --刷怪次数  用于每波怪分多少次刷
monLimit = 0, --限制怪物数  用于少于次限制数是触发下一波怪
  notice = Lang.FBTalk.f00052,      --本波刷怪后公告
mon =
{
{sid=142, mid=489, x1=7, x2=12, y=15, num=2, liveTime=3600, path = {28,19},}, --飞刀门饿狼
{sid=142, mid=489, x1=38, x2=43, y=15, num=2, liveTime=3600, path = {23,19},}, --飞刀门饿狼
},
},

--第3波
{
mobInterval = 5*1000,  --刷怪间隔时间  每mobInterval毫秒刷一次(最低间隔为5s，小于5s自动调整为5s)
mobRound = 3, --刷怪次数  用于每波怪分多少次刷
monLimit = 0, --限制怪物数  用于少于次限制数是触发下一波怪
  notice = Lang.FBTalk.f00053,      --本波刷怪后公告
mon =
{
{sid=142, mid=490, x1=4, x2=12, y=23, num=2, liveTime=3600, path = {28,19},}, --飞刀门毒蝎
{sid=142, mid=490, x1=38, x2=47, y=23, num=2, liveTime=3600, path = {23,19},}, --飞刀门毒蝎
},
},

--第4波
{
mobInterval = 5*1000,  --刷怪间隔时间  每mobInterval毫秒刷一次(最低间隔为5s，小于5s自动调整为5s)
mobRound = 1, --刷怪次数  用于每波怪分多少次刷
monLimit = 0, --限制怪物数  用于少于次限制数是触发下一波怪
  notice = Lang.FBTalk.f00054,      --本波刷怪后公告
mon =
{
{sid=142, mid=491, x1=7, x2=12, y=15, num=1, liveTime=3600, path = {27,19},}, --飞刀门猛虎
{sid=142, mid=491, x1=4, x2=12, y=23, num=1, liveTime=3600, path = {26,19},}, --飞刀门猛虎
{sid=142, mid=491, x1=38, x2=43, y=15, num=1, liveTime=3600, path = {24,19},}, --飞刀门猛虎
{sid=142, mid=491, x1=38, x2=47, y=23, num=1, liveTime=3600, path = {25,19},}, --飞刀门猛虎
},
},

--第5波
{
mobInterval = 5*1000,  --刷怪间隔时间  每mobInterval毫秒刷一次(最低间隔为5s，小于5s自动调整为5s)
mobRound = 2, --刷怪次数  用于每波怪分多少次刷
monLimit = 0, --限制怪物数  用于少于次限制数是触发下一波怪
  notice = Lang.FBTalk.f00055,      --本波刷怪后公告
mon =
{
{sid=142, mid=492, x1=5, x2=12, y=19, num=2, liveTime=3600, path = {26,19},}, --飞刀门杂兵
{sid=142, mid=492, x1=38, x2=43, y=15, num=2, liveTime=3600, path = {24,19},}, --飞刀门杂兵
{sid=142, mid=492, x1=38, x2=46, y=19, num=2, liveTime=3600, path = {25,19},}, --飞刀门杂兵
},
},


--第6波
{
mobInterval = 5*1000,  --刷怪间隔时间  每mobInterval毫秒刷一次(最低间隔为5s，小于5s自动调整为5s)
mobRound = 2, --刷怪次数  用于每波怪分多少次刷
monLimit = 0, --限制怪物数  用于少于次限制数是触发下一波怪
  notice = Lang.FBTalk.f00056,      --本波刷怪后公告
mon =
{
{sid=142, mid=493, x1=5, x2=12, y=19, num=2, liveTime=3600, path = {27,19},}, --飞刀门弟子
{sid=142, mid=493, x1=4, x2=12, y=23, num=2, liveTime=3600, path = {26,19},}, --飞刀门弟子
{sid=142, mid=493, x1=38, x2=46, y=19, num=2, liveTime=3600, path = {24,19},}, --飞刀门弟子
{sid=142, mid=493, x1=38, x2=47, y=23, num=2, liveTime=3600, path = {25,19},}, --飞刀门弟子
},
},

--第7波
{
mobInterval = 5*1000,  --刷怪间隔时间  每mobInterval毫秒刷一次(最低间隔为5s，小于5s自动调整为5s)
mobRound = 3, --刷怪次数  用于每波怪分多少次刷
monLimit = 0, --限制怪物数  用于少于次限制数是触发下一波怪
  notice = Lang.FBTalk.f00057,      --本波刷怪后公告
mon =
{
{sid=142, mid=494, x1=7, x2=12, y=15, num=2, liveTime=3600, path = {27,19},}, --飞刀门高手
{sid=142, mid=494, x1=4, x2=12, y=23, num=2, liveTime=3600, path = {26,19},}, --飞刀门高手
{sid=142, mid=494, x1=38, x2=43, y=15, num=2, liveTime=3600, path = {24,19},}, --飞刀门高手
{sid=142, mid=494, x1=38, x2=47, y=23, num=2, liveTime=3600, path = {25,19},}, --飞刀门高手
},
},
--第8波
{
mobInterval = 6*1000,  --刷怪间隔时间  每mobInterval毫秒刷一次(最低间隔为5s，小于5s自动调整为5s)
mobRound = 1, --刷怪次数  用于每波怪分多少次刷
monLimit = 0, --限制怪物数  用于少于次限制数是触发下一波怪
  notice = Lang.FBTalk.f00058,      --本波刷怪后公告
mon =
{
{sid=142, mid=495, x1=7, x2=12, y=15, num=1, liveTime=3600, path = {27,19},}, --飞刀门堂主
{sid=142, mid=495, x1=4, x2=12, y=23, num=1, liveTime=3600, path = {26,19},}, --飞刀门堂主
{sid=142, mid=495, x1=38, x2=47, y=23, num=1, liveTime=3600, path = {25,19},}, --飞刀门堂主
},
},

--第9波
{
mobInterval = 5*1000,  --刷怪间隔时间  每mobInterval毫秒刷一次(最低间隔为5s，小于5s自动调整为5s)
mobRound = 4, --刷怪次数  用于每波怪分多少次刷
monLimit = 0, --限制怪物数  用于少于次限制数是触发下一波怪
  notice = Lang.FBTalk.f00059,      --本波刷怪后公告
mon =
{
{sid=142, mid=496, x1=5, x2=12, y=19, num=2, liveTime=3600, path = {27,19},}, --飞刀门杀手
{sid=142, mid=496, x1=4, x2=12, y=23, num=2, liveTime=3600, path = {26,19},}, --飞刀门杀手
{sid=142, mid=496, x1=38, x2=46, y=19, num=2, liveTime=3600, path = {24,19},}, --飞刀门杀手
{sid=142, mid=496, x1=38, x2=47, y=23, num=2, liveTime=3600, path = {25,19},}, --飞刀门杀手
},
},
--第10波
{
mobInterval = 5*1000,  --刷怪间隔时间  每mobInterval毫秒刷一次(最低间隔为5s，小于5s自动调整为5s)
mobRound = 4, --刷怪次数  用于每波怪分多少次刷
monLimit = 0, --限制怪物数  用于少于次限制数是触发下一波怪
  notice = Lang.FBTalk.f00060,      --本波刷怪后公告
mon =
{
{sid=142, mid=497, x1=7, x2=12, y=15, num=3, liveTime=3600, path = {27,19},}, --飞刀门杀人熊
{sid=142, mid=497, x1=5, x2=12, y=19, num=3, liveTime=3600, path = {26,19},}, --飞刀门杀人熊
{sid=142, mid=497, x1=38, x2=43, y=15, num=3, liveTime=3600, path = {24,19},}, --飞刀门杀人熊
{sid=142, mid=497, x1=38, x2=46, y=19, num=3, liveTime=3600, path = {25,19},}, --飞刀门杀人熊
},
},

--第11波
{
mobInterval = 6*1000,  --刷怪间隔时间  每mobInterval毫秒刷一次(最低间隔为5s，小于5s自动调整为5s)
mobRound = 4, --刷怪次数  用于每波怪分多少次刷
monLimit = 0, --限制怪物数  用于少于次限制数是触发下一波怪
  notice = Lang.FBTalk.f00061,      --本波刷怪后公告
mon =
{
{sid=142, mid=498, x1=7, x2=12, y=15, num=4, liveTime=3600, path = {27,19},}, --飞刀门杀人豹
{sid=142, mid=498, x1=4, x2=12, y=23, num=4, liveTime=3600, path = {26,19},}, --飞刀门杀人豹
{sid=142, mid=498, x1=38, x2=43, y=15, num=4, liveTime=3600, path = {24,19},}, --飞刀门杀人豹
{sid=142, mid=498, x1=38, x2=47, y=23, num=4, liveTime=3600, path = {25,19},}, --飞刀门杀人豹
},
},
--第12波
{
mobInterval = 6*1000,  --刷怪间隔时间  每mobInterval毫秒刷一次(最低间隔为5s，小于5s自动调整为5s)
mobRound = 1, --刷怪次数  用于每波怪分多少次刷
monLimit = 0, --限制怪物数  用于少于次限制数是触发下一波怪
  notice = Lang.FBTalk.f00062,      --本波刷怪后公告
mon =
{
{sid=142, mid=499, x1=5, x2=12, y=19, num=1, liveTime=3600, path = {28,19},}, --飞刀门护法
{sid=142, mid=499, x1=38, x2=46, y=19, num=1, liveTime=3600, path = {23,19},}, --飞刀门护法
},
},

--第13波
{
mobInterval = 4*1000,  --刷怪间隔时间  每mobInterval毫秒刷一次(最低间隔为5s，小于5s自动调整为5s)
mobRound = 3, --刷怪次数  用于每波怪分多少次刷
monLimit = 0, --限制怪物数  用于少于次限制数是触发下一波怪
  notice = Lang.FBTalk.f00063,      --本波刷怪后公告
mon =
{
{sid=142, mid=500, x1=7, x2=12, y=15, num=2, liveTime=3600, path = {27,19},}, --飞刀门鬼兵
{sid=142, mid=500, x1=5, x2=12, y=19, num=2, liveTime=3600, path = {28,19},}, --飞刀门鬼兵
{sid=142, mid=500, x1=4, x2=12, y=23, num=2, liveTime=3600, path = {26,19},}, --飞刀门鬼兵
{sid=142, mid=500, x1=38, x2=43, y=15, num=2, liveTime=3600, path = {24,19},}, --飞刀门鬼兵
{sid=142, mid=500, x1=38, x2=46, y=19, num=2, liveTime=3600, path = {23,19},}, --飞刀门鬼兵
{sid=142, mid=500, x1=38, x2=47, y=23, num=2, liveTime=3600, path = {25,19},}, --飞刀门鬼兵
},
},
--第14波
{
mobInterval = 4*1000,  --刷怪间隔时间  每mobInterval毫秒刷一次(最低间隔为5s，小于5s自动调整为5s)
mobRound = 4, --刷怪次数  用于每波怪分多少次刷
monLimit = 0, --限制怪物数  用于少于次限制数是触发下一波怪
  notice = Lang.FBTalk.f00064,      --本波刷怪后公告
mon =
{
{sid=142, mid=501, x1=7, x2=12, y=15, num=2, liveTime=3600, path = {27,19},}, --飞刀门冤死鬼
{sid=142, mid=501, x1=5, x2=12, y=19, num=2, liveTime=3600, path = {28,19},}, --飞刀门冤死鬼
{sid=142, mid=501, x1=4, x2=12, y=23, num=2, liveTime=3600, path = {26,19},}, --飞刀门冤死鬼
{sid=142, mid=501, x1=38, x2=43, y=15, num=2, liveTime=3600, path = {24,19},}, --飞刀门冤死鬼
{sid=142, mid=501, x1=38, x2=46, y=19, num=2, liveTime=3600, path = {23,19},}, --飞刀门冤死鬼
{sid=142, mid=501, x1=38, x2=47, y=23, num=2, liveTime=3600, path = {25,19},}, --飞刀门冤死鬼
},
},
--第15波
{
mobInterval = 4*1000,  --刷怪间隔时间  每mobInterval毫秒刷一次(最低间隔为5s，小于5s自动调整为5s)
mobRound = 5, --刷怪次数  用于每波怪分多少次刷
monLimit = 0, --限制怪物数  用于少于次限制数是触发下一波怪
  notice = Lang.FBTalk.f00065,      --本波刷怪后公告
mon =
{
{sid=142, mid=502, x1=7, x2=12, y=15, num=2, liveTime=3600, path = {27,19},}, --飞刀门怨灵
{sid=142, mid=502, x1=5, x2=12, y=19, num=2, liveTime=3600, path = {28,19},}, --飞刀门怨灵
{sid=142, mid=502, x1=4, x2=12, y=23, num=2, liveTime=3600, path = {26,19},}, --飞刀门怨灵
{sid=142, mid=502, x1=38, x2=43, y=15, num=2, liveTime=3600, path = {24,19},}, --飞刀门怨灵
{sid=142, mid=502, x1=38, x2=46, y=19, num=2, liveTime=3600, path = {23,19},}, --飞刀门怨灵
{sid=142, mid=502, x1=38, x2=47, y=23, num=2, liveTime=3600, path = {25,19},}, --飞刀门怨灵
},
},
--第16波
{
mobInterval = 4*1000,  --刷怪间隔时间  每mobInterval毫秒刷一次(最低间隔为5s，小于5s自动调整为5s)
mobRound = 1, --刷怪次数  用于每波怪分多少次刷
monLimit = 0, --限制怪物数  用于少于次限制数是触发下一波怪
  notice = Lang.FBTalk.f00066,      --本波刷怪后公告
mon =
{
{sid=142, mid=503, x1=38, x2=46, y=19, num=1, liveTime=3600, path = {23,19},}, --飞刀门门主
},
},

}