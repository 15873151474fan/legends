
--lua script

--活动开启状态的配置  每个项代表一个活动 true 为开启 false为关闭
--配置后请重启服务器 

--#ifndef _COMMON_SERVER_	--普通逻辑服配置
	TasksConfig =
	{
		--常规活动
		TianShanBoYi = true,	--天山博弈
		RobberAttackCity = false,  --怪物袭城 
		MonBoss = false, --世界刷BOSS2
		one00oneWish = true,  --一千零一个愿望 
		specialMeeting = true, --奇遇系统
		HolyFlameDefend = true,	--圣火保卫战
		WuLinZhengBa = true,	--武林争霸
		AthleticsPoint = true,	--竞技积分
		GuardAction = true,	--千里运镖
		HuaShanLunJian = true,	--华山论剑
		MiZongDong = true,	--迷踪洞
		EverydayWelfare = true,	--每日福利
		QingGongZongShi = true,	--轻功宗师
		VIPFashionDress = true,	--VIP时装兑换

		--阵营活动
		CampSpy = true,		--阵营刺探
		CampDart = true, --阵营运镖
		GroupLeaderConquest = true, --阵营盟主争夺战活动 
		GroupMasterAttack = true,   --阵营领袖攻击战活动
		GetCampAwards = true, --阵营俸禄
		CampStatueWorship = true, --阵营雕像膜拜

		--节日活动
		MidAutumnFestival = true,	--中秋节活动
		MidAutumnFestival_HuaHaoYueYuan = false, --中秋节活动_花好月圆
		NationalDay = true, --国庆节活动
		PrayTree = true,	--祈福树
		PraySnowman = true, --雪人娃娃
		RoseRain = true,	--情人玫瑰雨
		
		--跨服活动
		CrossServerBoss = true, --跨服BOSS战
		CrossServerSingle = true, --跨服BOSS个人赛
	}
	
--#else	--跨服服务器配置
	TasksConfig =
	{
		--常规活动
		TianShanBoYi = false,	--天山博弈
		RobberAttackCity = false,  --怪物袭城 
		MonBoss = false, --世界刷BOSS2
		one00oneWish = false,  --一千零一个愿望 
		specialMeeting = false, --奇遇系统
		HolyFlameDefend = false,	--圣火保卫战
		WuLinZhengBa = false,	--武林争霸
		AthleticsPoint = false,	--竞技积分
		GuardAction = false,	--千里运镖
		HuaShanLunJian = false,	--华山论剑
		MiZongDong = false,	--迷踪洞
		EverydayWelfare = false,	--每日福利
		QingGongZongShi = false,	--轻功宗师
		VIPFashionDress = false,	--VIP时装兑换

		--阵营活动
		CampSpy = false,		--阵营刺探
		CampDart = false, --阵营运镖
		GroupLeaderConquest = false, --阵营盟主争夺战活动 
		GroupMasterAttack = false,   --阵营领袖攻击战活动
		GetCampAwards = false, --阵营俸禄
		CampStatueWorship = false, --阵营雕像膜拜

		--节日活动
		MidAutumnFestival = false,	--中秋节活动
		MidAutumnFestival_HuaHaoYueYuan = false, --中秋节活动_花好月圆
		NationalDay = false, --国庆节活动
		PrayTree = false,	--祈福树
		PraySnowman = false, --雪人娃娃
		RoseRain = false,	--情人玫瑰雨
		
		--跨服活动
		CrossServerBoss = true, --跨服BOSS战
		CrossServerSingle = true, --跨服个人赛
	}
--#endif
