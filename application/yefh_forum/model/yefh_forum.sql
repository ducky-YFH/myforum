/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : yefh_forum

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 13/12/2019 14:55:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for yefh_mes
-- ----------------------------
DROP TABLE IF EXISTS `yefh_mes`;
CREATE TABLE `yefh_mes`  (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `mtitle` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mcontent` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `unick` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mcreateat` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `mbin` int(2) NOT NULL,
  `mdelat` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`mid`) USING BTREE,
  INDEX `unick`(`unick`) USING BTREE,
  INDEX `sid`(`sid`) USING BTREE,
  CONSTRAINT `yefh_mes_ibfk_1` FOREIGN KEY (`unick`) REFERENCES `yefh_user` (`unick`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `yefh_mes_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `yefh_section` (`sid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yefh_mes
-- ----------------------------
INSERT INTO `yefh_mes` VALUES (1, '黑暗中的一吻', '<p>　　火车进入隧道，整个车厢里一片黑暗。只听一声亲吻，接着便是一记响亮的耳光。<br><br>　　火车迟迟开出隧道后，车厢内四个素不相识的人都没有吱声，唯有德国军官眼圈发青。<br><br>　　中国老太太暗想：“这姑娘人美心灵更美。”<br><br>　　姑娘想：“真奇怪，这德国人宁亲老太婆不亲我。”<br><br>　　德国人想：“罗马尼亚人真狡猾，他偷着亲嘴，我暗里挨打。”<br><br><div style=\"text-align: left;\">　　罗马尼亚人想：“我最聪明，我吻自己的手背，又打了德国人一个耳光，没人发现。”&nbsp;&nbsp;</div></p>', 'yfh', 1572955680, 1, 1, 1576220067);
INSERT INTO `yefh_mes` VALUES (2, '阵容的狗', '<p style=\"text-align: left;\">我本来是一只普通的家狗，我最初的主人是位孤寡老人。为了让我过上更好的生活，临终前，他花了一笔钱，找到一家动物美容医院帮我做了手术，让我变成了名贵的北京狮子狗。<br><br>不久，我就被一位满身名牌、美丽高贵的妇人从宠物店里高价买走，住进了一栋漂亮的别墅。<br><br>我很乖巧，很会揣摩主人的意图，主人也非常喜欢我，给我穿好的、吃好的、住好的、玩好的，还给我起名“艾艾”。我真幸福啊！<br><br>这天，我那当大老板的、忙得很少回家的男主人怒气冲冲地把一个档案袋甩在地上，眼里闪着沾血的刀光：“怪不得孩子长得这么丑，全无我俩的模样，我查了DNA，也查到了你整容的事实。你，你，竟敢骗我！”<br><br>我吓得躲到了角落里。女主人更是一脸的惊慌：“我……我……”<br><br></p><p style=\"text-align: left;\">马上给我滚！越快越好！”男主人吼叫着。</p><p style=\"text-align: left;\">女主人的泪水溢了出来，默默地回里屋收拾去了。<br></p><p style=\"text-align: left;\">“艾艾，来。”男主人招呼我。<br><br>我犹豫了半会儿，还是摇着尾巴跑过去，伸出舌头舔他的手。&nbsp;&nbsp;<br></p>', 'yfh', 1572955985, 1, 1, 1576220067);
INSERT INTO `yefh_mes` VALUES (3, '松鼠的暖房子', '<p><div style=\"text-align: left;\"><span style=\"font-family: 微软雅黑; color: rgb(77, 128, 191); background-color: rgb(238, 236, 224);\">　　冬天的风呼呼的刮，刮到脸上就象用小刀子一下一下的割着，真疼啊。松鼠妈妈要生小宝宝了，可是她还没有找到一个避风的地方。松鼠爸爸很焦急，他在树上跳来跳去，想找一个暖和的树洞，找啊找啊，树洞都住满了动物，他一个空洞也没有找到。</span></div><div style=\"text-align: left;\"><span style=\"font-family: 微软雅黑; color: rgb(77, 128, 191); background-color: rgb(238, 236, 224);\"><br></span></div><div style=\"text-align: left;\"><span style=\"font-family: 微软雅黑; color: rgb(77, 128, 191); background-color: rgb(238, 236, 224);\">　　风越刮越大了，还夹带着雪花。突然，松鼠爸爸看到了一只红色的棉手套。他赶紧叫松鼠妈妈钻了进去，手套里真暖和啊，松鼠妈妈一钻进去就开始生宝宝，一个、二个、三个、四个、五个，松鼠妈妈一共生了五只小松鼠，小松鼠住在手套的五个手指里，一个手指里一个，正合适，松鼠妈妈想叫松鼠爸爸也进来住，可是，手套里没有地方了，松鼠爸爸只好在手套外面蹲下，用尾巴盖住身子，准备睡觉了。</span></div><div style=\"text-align: left;\"><span style=\"font-family: 微软雅黑; color: rgb(77, 128, 191); background-color: rgb(238, 236, 224);\"><br></span></div><div style=\"text-align: left;\"><span style=\"font-family: 微软雅黑; color: rgb(77, 128, 191); background-color: rgb(238, 236, 224);\">　　这时有二个小朋友一边说话，一边向松鼠走过来，那个穿红衣服戴红帽子的小朋友说：我就在这里打雪仗了，手套应该就在这里。那个穿白衣服戴白帽子的小朋友说：我们再找找吧。松鼠爸爸听到了他们的谈话，跳到他们面前说：“你们好，你们是在找一只红手套吗？手套在这里。”“啊，我的手套，手套找到了，谢谢你，小松鼠。”</span></div><div style=\"text-align: left;\"><span style=\"font-family: 微软雅黑; color: rgb(77, 128, 191); background-color: rgb(238, 236, 224);\"><br></span></div><div style=\"text-align: left;\"><span style=\"font-family: 微软雅黑; color: rgb(77, 128, 191); background-color: rgb(238, 236, 224);\">　　穿红衣服的小朋友正准备拿手套，突然，他发现了手套里的松鼠妈妈，他吃惊地说：“啊，又一只松鼠。”松鼠妈妈跳出来，对着手套里面叫道：“孩子们快出来吧，手套的主人来了。”听了松鼠妈妈的话，小朋友明白了，松鼠妈妈刚生了小宝宝，于是穿红衣服的小朋友赶紧说：“不，不，别叫小宝宝出来了，天这么冷，你们就住在里面吗，我不要手套了。”看见松鼠爸爸，他取了带在手上的另一只红手套说：这一只手套也给你们吧。说完，二个小朋友就走了，松鼠爸爸和松鼠妈妈大声地说：谢谢你们。&nbsp;&nbsp;</span></div></p>', 'yfh', 1572956105, 2, 2, 1576220046);
INSERT INTO `yefh_mes` VALUES (4, '显摆的博士', '<p><div style=\"text-align: left;\"><span style=\"font-style: italic; font-family: Verdana; font-size: large;\">　　一天，一个博士坐船欣赏风景。</span></div><div style=\"text-align: left;\"><span style=\"font-style: italic; font-family: Verdana; font-size: large;\"><br></span></div><div style=\"text-align: left;\"><span style=\"font-style: italic; font-family: Verdana; font-size: large;\">　　在船上，博士问渔夫：“你会生物吗？”渔夫说不会，博士就说：“那你的生命就要失去4分之1了。”</span></div><div style=\"text-align: left;\"><span style=\"font-style: italic; font-family: Verdana; font-size: large;\"><br></span></div><div style=\"text-align: left;\"><span style=\"font-style: italic; font-family: Verdana; font-size: large;\">　　过了一会儿博士有问：“你会哲学吗？”渔夫还是不会。博士又说：“那你的生命又要失去4分之1了。”</span></div><div style=\"text-align: left;\"><span style=\"font-style: italic; font-family: Verdana; font-size: large;\"><br></span></div><div style=\"text-align: left;\"><span style=\"font-style: italic; font-family: Verdana; font-size: large;\">　　又过了一会儿，博士又问了：“你会科学吗？”渔夫仍然不会。</span></div><div style=\"text-align: left;\"><span style=\"font-style: italic; font-family: Verdana; font-size: large;\"><br></span></div><div style=\"text-align: left;\"><span style=\"font-style: italic; font-family: Verdana; font-size: large;\">　　就在这时，狂风乱作，卷来一股巨浪，渔夫问博士：“你会游泳吗？”博士说不会，渔夫说：“那你的生命就要玩完了！”</span></div><div style=\"text-align: left;\"><span style=\"font-style: italic; font-family: Verdana; font-size: large;\"><br></span></div><div style=\"text-align: left;\"><span style=\"font-style: italic; font-family: Verdana; font-size: large;\">　　感悟：不怕千招会，就怕一招绝。在职场，有时候只要精通一门手艺你就可以高枕无忧。&nbsp;&nbsp;</span></div></p>', 'yfh', 1572956212, 2, 0, 0);
INSERT INTO `yefh_mes` VALUES (5, '意外惊喜', '<p><div style=\"text-align: left;\">　　女友倩倩被单位派去南方一座大城市学习半年，走后一个月，我便思念难忍，正逢周末，就给她打电话，要去那儿看看她。倩倩一听就笑了：“这么远的路程，就两天时间，忍一忍吧，亲爱的，就当我去了外太空！”“可你没去外太空呀，再说两天不够，我还可以请假嘛。”一听请假，倩倩的口气就变了：“看你那点出息，男子汉当以事业为重，再这么儿女情长的我可真不理你了！”</div><div style=\"text-align: left;\"><br></div><div style=\"text-align: left;\">　　又过了两个月，我去南方出差，可以绕道到她那儿。于是又打电话过去，谁知倩倩竟口气坚决地拒绝我：“不行不行，你千万别来！”“为什么？”“我……我学习太紧张，你一来会影响我的。”一听这话我心里就来气，不就是一个短训班嘛，高考冲刺也不至于这样呀。我冷冷一笑：“好，大学者，请你把心放到肚子里，我不会去打扰你的，你就专心做你的学问吧！”说完，不等她说什么，便狠狠地挂了电话。</div><div style=\"text-align: left;\"><br></div><div style=\"text-align: left;\">　　我觉得倩倩一定有当“陈世美”的嫌疑，我又气愤又倔强地坚持不再理她，盼望着她能有一个电话过来，向我说明情况，赔理道歉，可她偏偏没有一个电话打过来，直到她学习结束的日期到了，我也没收到她一点音讯，看来不幸果然让我猜到了，什么花前月下的海枯石烂，到头来我竟做了可怜巴巴的“秦香莲”！</div><div style=\"text-align: left;\"><br></div><div style=\"text-align: left;\">　　正当我对倩倩心灰意懒的时候，突然接到她打来的电话，要我晚8点去省城机场接她。我压着心中的喜悦，故意赌气地说：“省城离咱这儿不过50多公里，来来往往的车有的是，你坐车来吧。”“不嘛，人家就让你来接嘛！到时，我还会给你一个意外惊喜。”我故意表现出一副不情愿的样子勉强答应了。放下电话，连蹦带跳地收拾自己，并把那辆宝贝私家车刷洗一新，见已傍晚时分，哼着小调开车出了家门。</div><div style=\"text-align: left;\"><br></div><div style=\"text-align: left;\">　　车子刚开出城区，只见路边站一位靓妞使劲朝我挥手。我在她面前停下车，还没说什么，靓妞就娇滴滴地哀求上了：“大哥，天这么晚了，麻烦你捎我一程好吗？”“去哪？”“去省城。”我略一犹豫，随即就放下心来，人家一个漂亮姑娘都不怕，我担哪门子心啊！于是点头答应了。</div><div style=\"text-align: left;\"><br></div><div style=\"text-align: left;\">　　姑娘上车后，我的心里就像有个小兔子蹦来跳去。有这样的女孩在身边，柳下惠也未必心静如水。我偷偷瞥了她一眼，只见她戴一副小巧的眼镜，斯斯文文的，既漂亮又文静，而且，冷不丁那么一瞧，和倩倩长得还有点像，当然，人家可比倩倩年轻漂亮多了。姑娘倒也大方，大概怕我寂寞，天南地北地和我聊了起来，她真是善解人意，说的每句话都那么中听得体，时间不长，我就有了一种相见恨晚的感觉。</div><div style=\"text-align: left;\"><br></div><div style=\"text-align: left;\">　　“大哥，你年轻轻的这么有成就，人长得又帅气，嫂子真让人羡慕死了！”我听着她这么由衷地对我夸赞，心里乐开了花：“还嫂子呢，连对象还没相上呢。”我得意忘形地向她撒了一个小谎。</div><div style=\"text-align: left;\"><br></div><div style=\"text-align: left;\">　　她惊讶地盯了我一眼，叹了口气，说：“你是挑花了眼吧？”“什么挑花了眼，就那小破城市，说出来姑娘可别见怪，就没一个像你这样高雅靓丽的女孩，一方水土养一方人呀，就我们那破地……”投桃报李，我也忍不住夸起她来。</div><div style=\"text-align: left;\"><br></div><div style=\"text-align: left;\">　　本来一小时的路程，让我足足走了两个多小时，到省城时，姑娘说：“多谢大哥捎我，去家里坐坐吧。”看到姑娘含情脉脉的眼睛，我突然想起了倩倩，忙说：“对不起了，我还要去接一个同事。”“女同事吧？”“有哪个女同事需要我接？是我们领导，男的。”我边说心里边乐，末了，我对她说：“我们刚接触，你可能对我不了解，时间长了你就会发现，我是个厚道人！”我急于表白自己。“是真的吗？”姑娘露出一丝意味深长的笑意。临下车时，她顺手写了个手机号码递给我，不好意思地笑着说：“我叫小茜，咱们以后常联系好吗？”“常联系常联系！”我有些受宠若惊，忙把自己的姓名和手机号告诉了她。</div><div style=\"text-align: left;\"><br></div><div style=\"text-align: left;\">　　望着姑娘远去的背影，我深为自己的精彩表现而得意。一想起倩倩电话里那拒人千里的口气，我就有些来气：高傲个啥，咱也是个招蝶引凤的帅哥！</div><div style=\"text-align: left;\"><br></div><div style=\"text-align: left;\">　　来到机场，正是倩倩约定的时间，找遍了角角落落，哪有她的身影，到问询处一打听，倩倩乘的那架班机已是三小时前到达了。</div><div style=\"text-align: left;\"><br></div><div style=\"text-align: left;\">　　我的火气立时就蹿了上来：吹就吹吧，何必这样耍人！我突然想起小茜，忍不住给她打了手机。怪了，连打几次，都提示我拨的是空号。难道她……正当我疑惑间，手机铃响了，是倩倩的号码，我没好气地大声质问：“你搞什么搞，不成就明说吗，何必这样！还意外惊喜，耍谁呢？！”倩倩平静地说：“我在学习期间到医院把自己的容貌整了整，并配了一副适合自己的眼镜，想给你一个意外惊喜，没想到你竟让我有了意外惊喜。”我的心一惊，忙问：“那刚才？”倩倩冷冷一笑：“相处这么久了，真没看出来，你竟然这么厚道！”&nbsp;&nbsp;</div></p>', '大黑帅', 1572956405, 3, 0, 0);
INSERT INTO `yefh_mes` VALUES (6, '生活就像变魔术', '<p><div style=\"text-align: left;\"><div style=\"text-align: left;\">　　最近，单位的小李被上级单位选调走了，很多人觉得意外。</div><div style=\"text-align: left;\"><br></div><div style=\"text-align: left;\">　　记得那一年，单位进了一批新人，小李也是。他们分在不同的处室，开始的时候，小李与其它大学生一样，并不显山露水，可没想到，小李却总是几年一小步，让人猜不透。</div><div style=\"text-align: left;\"><br></div><div style=\"text-align: left;\">　　现在，只要有人员晋升或被上级选调，总会传出这样或那样的故事来。小李也一样，有的说上级某主要领导是他亲戚，有的说他经常给某领导送重礼。</div><div style=\"text-align: left;\"><br></div><div style=\"text-align: left;\">　　小李与我同村，情况我是最了解的，他上下八代也没有出过一个村官，送重礼更不太现实，微薄的工资，除了每月还房贷外，他还定期给读大学的妹妹寄生活费。</div><div style=\"text-align: left;\"><br></div><div style=\"text-align: left;\">　　既然高升，宴请是少不了的。某天，他被同事们灌得不轻，当其它人还想让他再喝时，他说，我们不妨公平的些，猜扑克牌，谁猜错了喝一大杯，猜对的喝小杯。</div><div style=\"text-align: left;\"><br></div><div style=\"text-align: left;\">　　他的提议大家一致同意，觉得这个办法好，很是公平。在大家的叫好声中，服务员找来一副牌，没想到，小李拿到牌的时候，总要在桌前摸一摸，摸完后再猜，每次猜都很准，让人觉得不可思议。</div><div style=\"text-align: left;\"><br></div><div style=\"text-align: left;\">　　几个不信邪的同事，又让服务员买来新牌，牌洗了再洗，可几圈下来，情况依旧。大家都觉得小李神，问他秘诀时，他笑着说，小时候跟魔术师傅学的，谁想学，先喝三个大的。</div><div style=\"text-align: left;\"><br></div><div style=\"text-align: left;\">　　聚会后，我与小李一起步行回家，在路上，小李悄悄地告诉我，他之所以能猜准，是灯光的原因，他面前的餐桌反光，所以，在他摸牌的时候已经知道底牌。</div><div style=\"text-align: left;\"><br></div><div style=\"text-align: left;\">　　说得也是，在生活中，一个能时时注意发现细节，并加以利用的人，想不成功都难。或许，生活就像变魔术，如何成功，只有他自己知道。&nbsp;&nbsp;</div></div></p>', '大黑帅', 1572956502, 4, 0, 0);
INSERT INTO `yefh_mes` VALUES (7, '善良是一朵美丽的小花', '<p><span style=\"font-size: large;\">&nbsp; &nbsp; 我骑着电动车从那条熟悉的小巷经过，正在吃午饭的修车老人，赶紧放下热腾腾的饭菜，我忍不住停下电动车——我突然想起，我的车应该充气了。<br><br>&nbsp;&nbsp;&nbsp; 善良是一朵美丽的花下午妹妹用我的电动车，她奇怪：“你怎么把车胎打那么饱的气？”我笑笑：“因为老人放下正吃着的饭碗，迎着我的车站起来，我不忍心让他‘失望’哦！”<br><br>&nbsp;&nbsp;&nbsp; 妹妹笑我：“你是杞人忧天，还是太过‘多情’？”<br><br>&nbsp;&nbsp;&nbsp; 我说：“我也不知道。”妹妹嗔我：“难道你也想成为文尼西斯不成？”她是说我们一起看过的那部电影《中央车站》，那里面有一个小男孩儿，他也是一个“多情”的小男孩——<br><br>&nbsp;&nbsp;&nbsp; 导演沃尔特要为电影《中央车站》选一位男孩当主角，一天在车站，他看到一个擦皮鞋的小男孩，他告诉他，明天来找他，有饭吃，还可以挣钱。第二天，导演惊呆了，男孩带来了所有在车站擦鞋的孩子！他当即决定让这个孩子来演。后来电影获得了40多项大奖，这个男孩成为了巴西家喻户晓的明星——文尼西斯。文尼西斯以自己的“多情”，为伙伴们带来了收益，也为自己打开了成功的大门。<br><br>&nbsp;&nbsp;&nbsp; 这个“多情”的孩子，他的“多情”是一朵善良的花朵，让我念念不忘。<br><br>&nbsp;&nbsp;&nbsp; 不由想起我经历过的“多情”：在杭州乘坐公交，问了路线，拖着行李走，指路的阿姨又撵了上来，“你还是坐X路车吧，那样你就不用过马路了，我刚才给你说的那路车跟X路车一样的车程，但是需要穿越马路，对你来说不够方便，我才看到你带个箱子呢！”<br><br>&nbsp;&nbsp;&nbsp; 妹妹也曾经讲她经历的“多情”：她把孩子的水杯忘在了游乐园，半年之后，又去游玩，老板娘居然定了眼睛问她：“你有什么东西落我们这里了，还记得吗？”妹妹疑惑地说：“好像是个水杯吧，好久了！”老板娘乐了：“还‘好像’，根本‘就是’！”说着，她变戏法一样：“喏，是这个吧！”妹妹和孩子乐得：“谢谢谢谢谢谢！”好长时间，妹妹把这一堆“谢”字挂在QQ签名上，以显示世风人心多的是善意美好。<br><br>&nbsp;&nbsp;&nbsp; 邻居大婶总是在下雨天凉的时候，一麻袋一麻袋地购买西瓜，为的是让售瓜的人少受风吹雨淋。冬日的夜晚，寒冷的街头，单位里一群聚餐的人，围了烤白薯的老人，把他的热的冷的白薯，一块一块全买下，“您早点收摊子回家吧，这么大冷的天！”家属院里大妈大爷们，总是把“破烂”卖给一个独臂的小伙子，“年纪轻轻的，多不容易！”老大妈们老大爷们深深同情那善良的小伙子，他收“破烂”价格偏高，斤两实诚，打包之后，总是要把门前窗后，清扫得一尘不染。谁不是“多情”的人呢？时常大家彼此互为“多情”的人！<br><br>&nbsp;&nbsp;&nbsp; 门卫的师傅们总是为我收取稿费单和样刊样报，不厌其烦，却并不能因了这额外的工作量而有什么收益，我的笔名我的真名，他们都要一一记着，还会一任一任地往下传，新来的师傅把“三根毛”的稿费单交给我，我很吃惊：“您怎么知道是我呢，我还没告诉您啊！”他慈祥地笑：“交接工作的时候，樊师傅说过了的。”我的感动感激换成“不二家”的棒棒糖递上去，师傅们笑了。第二天，家住郊区的他们带了家里种的花草给我：“看看，这个喜欢不？”我欢喜的样子，让他们颇为得意：“看，我们就知道你喜欢这个，写文章的都待见这些花草！”&nbsp;</span></p><span style=\"font-size: large;\">&nbsp; &nbsp;春来一捧迎春花，夏来一朵月季红，秋来一瓣清清菊，冬来一枝腊梅香，我快乐着门卫师傅绽放在门卫桌案的善意之花，也愿意更多的美好与善良，一朵一朵，行走在街头，行走在心头……<br><br></span><p><span style=\"font-size: large;\">&nbsp; &nbsp; 你的善良，也是一朵花，为陌生人绽放，为熟识的人吐蕊，花香飘满人生。&nbsp;</span><br></p>', '大黑帅', 1572956613, 8, 1, 1576220066);
INSERT INTO `yefh_mes` VALUES (8, '需要一块石头', '<p><div style=\"text-align: left;\">&nbsp; &nbsp; &nbsp; &nbsp;不知从哪天起，办公室里的人陆陆续续都备了各种各样的小瓶子，每人桌子上都养了绿萝。绿萝好养，直接泡到水里就可以了，省了找土栽培的麻烦。</div><div style=\"text-align: left;\"><br></div><div style=\"text-align: left;\">　　需要一块石头只是这些绿萝完成了繁殖到每个办公桌上的任务之后，就再没有什么起色了。绿萝在水里慢慢生了根后，几乎就不再长了，只是维持着生命似的，让人时时担心着，生怕哪片叶子黄了。就这样，还是有人把绿萝养死了。大家不解，只说办公室可能缺少阳光和氧气。</div><div style=\"text-align: left;\"><br></div><div style=\"text-align: left;\">　　有一天去盥（guàn）洗室，隔壁办公室的女同事正在给绿萝换水。她的绿萝长得绿油油的，密密的一丛，每一片叶子都精神得很，不像我们办公室的绿萝，又蔫又稀。</div><div style=\"text-align: left;\"><br></div><div style=\"text-align: left;\">　　“你在土里种着？”我问，因为那是一个蓝花瓷的浅花盆。“没有，也种在水里。”她说。</div><div style=\"text-align: left;\"><br></div><div style=\"text-align: left;\">　　我很疑惑，水里也能长得这么好？女同事说：我放了几块石头进去，它的根就使劲往下扎，把石头紧紧地缠住。要是光有水，它的根就没什么可抓的，在水里飘呀飘的，就长不好了。</div><div style=\"text-align: left;\"><br></div><div style=\"text-align: left;\">　　原来是石头！</div><div style=\"text-align: left;\"><br></div><div style=\"text-align: left;\">　　事情总是机缘巧合，到了晚上，女儿开始背课文：谁有你的根底艰难贫苦啊，你从那紫色的岩上挺起了腰;即使是裸露着的根须，也把山岩紧紧地拥抱……是张万舒的《黄山松》，直到今天，我才真正理解：没有土可以，但不能没有一块石头。贫瘠并不可怕，可怕的是没有依托。</div><div style=\"text-align: left;\"><br></div><div style=\"text-align: left;\">　　正如一个人，贫穷并不可怕，可怕的是没有精神的固守。&nbsp;&nbsp;</div></p>', '小明', 1572956750, 6, 0, 0);
INSERT INTO `yefh_mes` VALUES (9, '无用之用', '<p><div style=\"text-align: left;\"><span style=\"font-size: large;\">　庄子与弟子走到一座山脚下，看见一株大树，枝繁叶茂，耸立在大溪旁。</span></div><div style=\"text-align: left;\"><span style=\"font-size: large;\"><br></span></div><div style=\"text-align: left;\"><span style=\"font-size: large;\">　　庄子问伐木者，这么高大的树木，怎么没人砍伐。伐木者似对此树不屑一顾，道：“这何足为奇？此树是一种不中用的木材。用来作舟船，则沉于水；用来作棺材，则很快腐烂；用来作器具，则容易毁坏；用来作门窗，则脂液不干；用来作柱子，则易受虫蚀，此乃不成材之木。不材之木也，无所可用，故能有如此之寿。”</span></div><div style=\"text-align: left;\"><span style=\"font-size: large;\"><br></span></div><div style=\"text-align: left;\"><span style=\"font-size: large;\">　　听了此话，庄子说：“树不成材，方可免祸；人不成才，亦可保身也。人皆知有用之用，却不知无用之用也。”弟子恍然大悟，点头不已。</span></div><div style=\"text-align: left;\"><span style=\"font-size: large;\"><br></span></div><div style=\"text-align: left;\"><span style=\"font-size: large;\">　　人生在世，各有各的活法，不同的标准下，有着不同的价值。有时候看似无用也是用。人不能总是用“利益”来作为唯一的评判标准，天生万物，各有不同，不单为取悦人而存在。</span></div><div style=\"text-align: left;\"><span style=\"font-size: large;\"><br></span></div><div style=\"text-align: left;\"><span style=\"font-size: large;\">　　树木弯曲，虽不能用，但是却不能妨碍他自由自在的生长，这远比成为栋梁更有用。</span></div><div style=\"text-align: left;\"><span style=\"font-size: large;\"><br></span></div><div style=\"text-align: left;\"><span style=\"font-size: large;\">　　就像教育孩子，虽然孩子不能成为社会栋梁，但是却不妨碍他发展自己的兴趣，他的成长本身就有价值。&nbsp;&nbsp;</span></div></p>', '小红', 1572957259, 6, 0, 0);
INSERT INTO `yefh_mes` VALUES (10, '青春走不出那张地图', '<p>　　那年，我刚上高二。开学的第一天，同桌林江便凑过来和我咬耳朵：“今年的班主任是从‘上面’调下来的，教地理，人送绰号‘追命先生’。”<br><br>　　开课第一天，我见到了被称之为“追命先生”的魏老师——30多岁，一件很旧的蓝西服，蔫蔫地穿在瘦小的身体上。与他落魄外表相悖的是，他的嗓门很洪亮。“感谢同学们的爱戴，授予我‘追命’的称誉，我绝对不会辜负同学们的期望……”他压低声音，眼中闪烁着智慧的光芒，几乎是一字一顿地说道，“我会追着你到天涯海角！”<br><br>　　林江藏在课桌下的手有些发抖，他拽着我的衣角悄声说：“这个老师……很邪乎呢，怕是没好日子过了。”林江的话很快就应验了。<br><br>　　以前，我们每天下午的后两节课，会逃到隔壁职业高中的操场去踢足球。都是年龄差不多的学生，并且我们善于伪装，找来印有职业高中校名的背心穿上，混迹于球员中，谁还能认出我们是“李逵”，还是“李鬼”？谁知刚过了两天，正在球场上厮杀的我一脚远射，眼看进球的当儿，突然杀来一匹黑马，伸手一挡，便稳稳地接住了球。不，应该是“蓝马”，一个穿着监西服的熟悉身影——魏老师！我们足球也不要了，呼啦啦作鸟兽散。<br><br>　　真正被“追”得心惊胆战的要数我们翻墙逃课看录像的事情了。上世纪90年代初，县城的录像厅昼夜循环热播香港枪战片。那天傍晚，大雨滂沱，但这完全挡不住我们心中那熊熊燃烧着的明星英雄梦想。我们看到魏老师宿含内灯火通明——看来他没有外出。何况这么个鬼天气，他是绝对想不到我们会在这时逃课去录像厅的。我们蹑手蹑脚来到围墙边。李阳个头大，第一个翻了过去，我们余下的在墙内等。不一会儿便听到李阳在墙外轻声呼喊着我们的名字，安全了！当我和林江迫不及待地爬上墙头，还没来得及把腿翘上去，便看到一个打着伞的瘦高个儿，神不知鬼不觉地站在李阳身后。只听林江“妈呀”一声，便从墙头上掉了下去……墙外惊雷般的声音响了起来：“往哪儿跑！”<br><br>　　我们于是很恨他，冬天打碎他宿舍的玻璃，把他冻感冒，或者在讲台下放上大图钉，扎他的脚……这样的“恶作剧”，让我们在后来的岁月中悔恨万千。真正令我唏嘘不已的，还是他及时地将一个叛逆的我从堕落的边缘追了回来。<br><br>　　那时，南下打工潮炙热汹涌，传言只要一踏上沿海那片土地，满地都是钞票。满脑子幼稚幻想的我，认为自己年轻有活力，完全能够让梦想在沿海那片土地上生根发芽。于是，我偷了家里的两百元钱，如传奇电影中豪情万丈的男主角那样，告别家乡，坐上火车“眶当眶当”去了东莞。一出车站，毫无社会经验的我便被小偷偷了个精光。然后，在车站如夜游神般晃荡的我被“请”进了收容站。虽然肚子问题暂时有了着落，却被告知要缴纳两千元罚款和保证金，再遣送回原户籍地。天！两千元几乎是农村家庭一年的收入。本想闯出一番天地后衣锦还乡，如今却要先搭上两千元，虚荣顽劣的我慌了。<br><br>　　就在我几乎绝望的时候，收容站的干部通知我说，收拾东西，你爸来接你了。我爸？我自小父亲病故，是不是认错人了？我睁开惺忪的双眼——很旧的蓝西服、瘦高个，魏老师？怎么又不像？胡子恁长，脸恁瘦……<br><br>　　魏老师的眼中喷着怒火，朝我屁股上“咣咣”就是两脚，吼了一个字：“走！”<br><br>　　那次，我突然感觉到，挨打也是温暖的。　‘魏老师仿佛有张“地图”，无论我们怎么“逃”，他总能找到我们，仿佛是“阴魂不散”的影子，是钻进肚子的“蛔虫”，又仿佛是威严慈祥的“守护神”。我们在那段迷茫的岁月里，被他“追”得心惊肉跳、服服帖帖。&nbsp;&nbsp;<br></p><p>　　渐渐地，我们的心安顿下来，悬崖勒马，收心踅身返回课堂。<br><br>　　终于，一场追逐与被追逐的青春时光结束了。炙热的七月，我在县电视台公布的红榜中看到了自己的名字。拿到录取通知书的那天，我终于鼓起勇气说出了埋藏在心中的疑问：“魏老师，为什么你总能那么准确地’追‘到我们？”他的眼中依旧闪烁着光芒，不过这次声音很轻柔：“我是教地理的，我心中有地图！”<br><br>　　后来，我给魏老师写过一封信。我在信里说：“我一直庆幸且感动着，你从来没有将我们从那张’地图‘上删去，那种感觉，直到今日仍激荡在心中，温暖着我。”&nbsp;&nbsp;<br></p>', 'yfh', 1573035383, 7, 0, 0);
INSERT INTO `yefh_mes` VALUES (11, '是的，成功可以复制', '<p><div style=\"text-align: left;\">&nbsp; &nbsp; &nbsp; &nbsp;1、态度就是成功的钥匙</div><div style=\"text-align: left;\"><br></div><div style=\"text-align: left;\">　　唐骏讲到自己的成功公式：“(智慧、机遇、勤奋、激情)性格”。在我读的那本书里一位高管批注了自己的成功公式，而提到最多的就是变通。爱因斯坦的成功公式：1%天赋99%汗水。大部分智慧是可以习得的，机遇只给有准备的人，勤奋或是汗水是态度的直接表达，性格也是可以调整的，变通本身就是个态度问题，所有这些都基于一个前提：“态度”。所谓“我的成功可以复制”不是具体措施的复制，是态度的复制。</div><div style=\"text-align: left;\"><br></div><div style=\"text-align: left;\">　　小时候唐骏是个孩子王，身边围着一群小伙伴，他小学老师在期末评语中一定这样写到：“该生在校勤奋学习，积极向上，尊敬老师，团结同学…”在后来看访谈节目的生活，他的大学同学基本上认为他是一个孤僻、独来独往的人。</div><div style=\"text-align: left;\"><br></div><div style=\"text-align: left;\">　　“人生就是一面镜子，你的她笑，她就对你笑，你对她哭，她也对你哭。”</div><div style=\"text-align: left;\"><br></div><div style=\"text-align: left;\">　　2、态度从嘴到腿</div><div style=\"text-align: left;\"><br></div><div style=\"text-align: left;\">　　唐骏大学毕业想留学，参加了研究生考试，仅以成绩论，获得资格绰绰有余，然而因为大学期间未获得过一次奖励，且表现不佳，未得到本校的资格。为了得到留学资格，唐骏挨个给其他学校打电话，转到有指标的学校后，为了通过教育部的审核，在相关部门大楼门口给主管领导“站岗”一个星期，最终得到了留学日本的机会。</div><div style=\"text-align: left;\"><br></div><div style=\"text-align: left;\">　　上星期去了北京，遇到了大学的同学：一个大学说不上孤僻，但确是一个“平静”的人——成绩不突出，也几乎没有参加什么课外活动，没有一堆堆的证书，境界也就和我差不多。找工作的时候，按道理像我们这样三流院校的人，要进咨询公司是不可能，但他以此为目标，毕业后两三个月才找到一个类似工作，他付出比别人更多的努力，现今成为一个专业的咨询顾问，比我已经不止高一点了：讨论问题时，他站在一个全面的、系统的、战略的角度，我则显得狭隘了许多;论专业知识，他对人力资源的看法深刻而独到，我则具体而庸俗;他现在获得的很多工作机会是我无法企及的。</div><div style=\"text-align: left;\"><br></div><div style=\"text-align: left;\">　　生活中，会有很多承诺和计划，爱侣间的“我爱你”，跟朋友抱怨“我很想去旅行”，跟亲人说“半年后我就不打牌了”，跟领导保证“下次我一定好好工作”。看《赢》我学到的是：坦诚，行动上的坦诚。是啊，所谓态度也从来不是停留在嘴上的，真正的态度是行动上的。去年有个亲戚跟我说：“放心，下个月开始我就不赌博了!”我说：“不可能!那是你自己骗自己，除非从现在起不再赌博了!”他说：“是啊，戒不掉了。”</div><div style=\"text-align: left;\"><br></div><div style=\"text-align: left;\">　　3、态度深入骨髓</div><div style=\"text-align: left;\"><br></div><div style=\"text-align: left;\">　　唐骏在微软，从工程师到项目经理的经历。多语言开发问题人人皆知，投给高层的意见书数不胜数，却始终没有得到解决。唐骏说给领导的建议书最差的是指出问题的，稍好的是有解决办法的，最好的是有可行性分析和实施办法的。</div><div style=\"text-align: left;\"><br></div><div style=\"text-align: left;\">　　我从来都知道自己的缺陷所在：英语，甚至深入批判过自己的英语学习问题，心理想过、嘴上说过、纸上写过、抱怨过、倾诉过、自嘲过、坦诚的剖析过，是啊我知道问题在哪里，貌似态度还很好，然而英语依然毫无改观。后来想了些解决办法：报英语学习班、拟定学习计划，然而都流产或者半途而废了，因为未考虑现实因素和自己状况，不适合，无法实施。最近看些英文电影、听些英文歌、间歇性的记单词、阅读自己感兴趣的英语文章，相比之前我的英文有所长进(虽然依然很烂)。</div><div style=\"text-align: left;\"><br></div><div style=\"text-align: left;\">　　行动态度往往半途而废，身边经常有对问题浅尝辄止，然后说自己已经努力，从此心理不再有任何负罪感，这是积极的不负责任的态度。真正的态度应是始终如一的、持续的、深入的、具有适应性的、可行的，最终才会在结果上有所反映。&nbsp;&nbsp;</div><div style=\"text-align: left;\"><br></div><div style=\"text-align: left;\">　　4、追求卓越<br><br>　　从中国到日本，从日本到美国，从老板到打工者，从总裁到中国职业经理人的标杆，这是唐骏追求卓越的职业之路。在打算进入微软前，唐骏已经开了三个公司，个人资产也上百万美元，说不上多么成功，但源源不断的业务，也可以让他从此躺在成绩单上，哪天把生意做回国也算一代才俊了，然而为了个人进一步提高、增值，他放弃了这些，与一些学生一样，经过微软一轮轮的面试，进入微软当一个软件工程师。<br><br>　　“追求卓越是个长期问题，短期而言的，这是个成本问题，非理性的偏执。”海尔创业初期的砸冰箱，乔布斯对拿着已经适合市场需要的在他眼里依然是不完善产品的主管大声斥责，任正非从未断绝的“危机论”。<br><br>　　5、态度之外<br><br>　　成功要复制，仅态度足矣!但时间长短不尽相同，此外的关键为：“目标和技巧”。一个长期的目标保证用力方向的一致，技巧避免走过多弯路，然而这不是决定性的，比如许三多。<br><br>　　“态度是复制成功的关键”，一种从嘴到腿、到骨髓、追求卓越的态度!这样的态度不仅仅指工作，更是生活的态度。<br><br>　　如果抱着自己心爱的女孩度过一生，如果亲人和睦，如果身体健康，如果事业有成，难道这不是成功吗?难道这不是幸福吗?&nbsp;&nbsp;<br></div></p>', 'tom', 1573522923, 5, 0, 0);
INSERT INTO `yefh_mes` VALUES (12, '如何卖掉情人节后的玫瑰花', '<p><div style=\"text-align: left;\"><span style=\"color: rgb(194, 79, 74);\">&nbsp; &nbsp; 这是一场面试的最后阶段。招聘企业是世界500强的大公司，招聘岗位是高级营销人员，待遇十分优厚。而经过几轮PK，最后站在考官面前的，是4位各方面表现都很优秀的名牌大学毕业生。</span></div><div style=\"text-align: left;\"><span style=\"color: rgb(194, 79, 74);\"><br></span></div><div style=\"text-align: left;\"><span style=\"color: rgb(194, 79, 74);\">&nbsp; &nbsp; 严肃的考官公布了最后一条考题：“假如你是一个花店的老板，2月14日情人节你进了许多玫瑰花，但在这一天你没有卖完，那么在2月15日，你怎样才能把剩下的玫瑰花处理掉？”</span></div><div style=\"text-align: left;\"><span style=\"color: rgb(194, 79, 74);\"><br></span></div><div style=\"text-align: left;\"><span style=\"color: rgb(194, 79, 74);\">&nbsp; &nbsp; 这看似是一个很随意的问题，但又联系实际，很能考察应聘者的销售、思维、应对及创新能力。</span></div><div style=\"text-align: left;\"><span style=\"color: rgb(194, 79, 74);\"><br></span></div><div style=\"text-align: left;\"><span style=\"color: rgb(194, 79, 74);\">&nbsp; &nbsp; 第一个面试者很自信地思考了一会，说：“由于玫瑰花很快会失去新鲜感，所以我必须在2月15日这天把玫瑰花卖出去。我会动员我的员工，让大家带上玫瑰花去街头、饭店、酒吧推销，我还会在酒吧里搞一个活动，我会主打温情牌，大声喊出我们的口号——‘明天我依然爱你’。”</span></div><div style=\"text-align: left;\"><span style=\"color: rgb(194, 79, 74);\"><br></span></div><div style=\"text-align: left;\"><span style=\"color: rgb(194, 79, 74);\">&nbsp; &nbsp; 对这位面试者的销售创意，几位考官反问：“你说的这些卖花方式，去街头、饭店、酒吧推销，在2月14日那天你肯定都做过，在最正确的时间，最正确的地点，你的玫瑰花都没有卖完，你有把握2月15日用同样的方式把玫瑰花卖掉吗？”</span></div><div style=\"text-align: left;\"><span style=\"color: rgb(194, 79, 74);\"><br></span></div><div style=\"text-align: left;\"><span style=\"color: rgb(194, 79, 74);\">&nbsp; &nbsp; 该面试者无言应对。</span></div><div style=\"text-align: left;\"><span style=\"color: rgb(194, 79, 74);\"><br></span></div><div style=\"text-align: left;\"><span style=\"color: rgb(194, 79, 74);\">&nbsp; &nbsp; 第二个面试者是个女孩，她说：“我会降价处理，2月15日，卖1O元一朵的玫瑰花，我会5元一朵叫卖。这样利润当然会少了点，但这不仅能把玫瑰花处理掉，还会提高我们花店的人气，让顾客收藏我们店，吸引回头客！”</span></div><div style=\"text-align: left;\"><span style=\"color: rgb(194, 79, 74);\"><br></span></div><div style=\"text-align: left;\"><span style=\"color: rgb(194, 79, 74);\">&nbsp; &nbsp; 对此方式，考官评判说：“降价是商界的大忌，是最没有智慧的销售方式，也是最危险的。你今天降价，明天还需降价，你只有在不断降价中才能卖掉东西，长此以往，结果可想而知。”</span></div><div style=\"text-align: left;\"><span style=\"color: rgb(194, 79, 74);\"><br></span></div><div style=\"text-align: left;\"><span style=\"color: rgb(194, 79, 74);\">&nbsp; &nbsp; 第三个面试者是一个看上去很成熟的毕业生，他说自己大一就创建了自己的团队，大二加入了学生会，大三有过半年的销售经历，大四曾在有名的大企业做过实习生。他说：“2月15日，我选择去中小学校门口卖玫瑰花，当然不是让学生之间送玫瑰花，而是通过学生送给他们的父母。现在的学生口袋里都有钱，学生的钱也是最好赚的。买一朵玫瑰花送给父母，可以表达感恩，也可以买一朵玫瑰花让爸爸送给妈妈，能够提升父母的情感，让家庭显得温馨。”</span></div><div style=\"text-align: left;\"><span style=\"color: rgb(194, 79, 74);\"><br></span></div><div style=\"text-align: left;\"><span style=\"color: rgb(194, 79, 74);\">&nbsp; &nbsp; 对这个面试者的创意，有位考官予以点头，肯定了他的思路，但考官又为面试者担忧：“中小学生是对世界认识还未成熟的群体，是最不能把握的，家长、老师都控制不了他，你怎样才能确保让他主动掏钱买玫瑰花？”</span></div><div style=\"text-align: left;\"><span style=\"color: rgb(194, 79, 74);\"><br></span></div><div style=\"text-align: left;\"><span style=\"color: rgb(194, 79, 74);\">&nbsp; &nbsp; 该面试者同样不知所错。</span></div><div style=\"text-align: left;\"><span style=\"color: rgb(194, 79, 74);\"><br></span></div><div style=\"text-align: left;\"><span style=\"color: rgb(194, 79, 74);\">&nbsp; &nbsp; 现在就剩第四个面试者了。</span></div><div style=\"text-align: left;\"><span style=\"color: rgb(194, 79, 74);\"><br></span></div><div style=\"text-align: left;\"><span style=\"color: rgb(194, 79, 74);\">&nbsp; &nbsp; 他在回答考题之前，首先说：“我想这个考题本身就是一个陷阱，对我来说是一件不存在的事。因为我既然进了那么多玫瑰花，就有把握能在2月14日售完。假如不能售完，这本身就是一个失败的销售者。”他的话令考官眼前一亮。该面试者继续说：“假设玫瑰花在情人节那天没有卖完，那第二天我会去火车站、机场推销我的玫瑰花。因为刚刚下车下飞机的人前一天大多都在旅途中度过，没有和爱人在一起，所以这时候我就选择他们作为我的待购人群，向他们推销玫瑰花。让他们带一朵玫瑰花回家，或者是去见自己爱的人，我想他们是乐意的。”</span></div><div style=\"text-align: left;\"><span style=\"color: rgb(194, 79, 74);\"><br></span></div><div style=\"text-align: left;\"><span style=\"color: rgb(194, 79, 74);\">&nbsp; &nbsp; 他的回答让考官叫好。</span></div><div style=\"text-align: left;\"><span style=\"color: rgb(194, 79, 74);\"><br></span></div><div style=\"text-align: left;\"><span style=\"color: rgb(194, 79, 74);\">&nbsp; &nbsp; 自然，最后应聘成功的，也就是这位了。</span></div><div style=\"text-align: left;\"><span style=\"color: rgb(194, 79, 74);\"><br></span></div><div style=\"text-align: left;\"><span style=\"color: rgb(194, 79, 74);\">&nbsp; &nbsp; 有一句名言叫“要么创新，要么死亡”，说得并不为过。一个人一个企业，如果没有标新立异的精神和独树一帜的追求，如果不打破陈旧的思路和固定的模式，如果只是一味地因循守旧，不能创造性和批判性地发展，那是很难有所成就的。&nbsp;&nbsp;</span></div></p>', 'tom', 1573524600, 4, 0, 0);
INSERT INTO `yefh_mes` VALUES (13, '屠户和律师', '<p><div style=\"text-align: left;\">　在美国的一个市场区一条大狼狗经过一个屠夫的店铺，它跳上肉台衔走了一块挂在铁钩上的肉，屠户很快就认出这是邻舍一位律师的爱犬，于是径直走到那位律师家里。</div><div style=\"text-align: left;\"><br></div><div style=\"text-align: left;\">　　“律师先生，我想问你一件事，有一条狗偷走我店内一大块肉，我可以控告狗主，索回肉钱吗？”</div><div style=\"text-align: left;\"><br></div><div style=\"text-align: left;\">　　“当然可以。”这位律师界的“名人”毫不迟疑地回答。</div><div style=\"text-align: left;\"><br></div><div style=\"text-align: left;\">　　“那好。先生，是您的爱犬偷了我的肉。这是很大一块上等精肉，足足有两公斤重，你该付给我六美元。”</div><div style=\"text-align: left;\"><br></div><div style=\"text-align: left;\">　　律师瞧了屠户一眼，一语不发，很快如数付了钱。屠户拿了钱得意忘形，</div><div style=\"text-align: left;\"><br></div><div style=\"text-align: left;\">　　三步并作两步回到家里，一刻钟后，他接到了这样一封信：</div><div style=\"text-align: left;\"><br></div><div style=\"text-align: left;\">　　“屠户先生，你欠律师约翰先生一件普通案的咨询费十五美元整。限三日内偿清，否则法庭见面。”&nbsp;&nbsp;</div></p>', 'tom', 1573526614, 1, 1, 1576220067);
INSERT INTO `yefh_mes` VALUES (14, '什么是幸福啊', '<p><div style=\"text-align: left;\">一天，小熊问熊妈妈：“妈妈，妈妈，什么是幸福啊？ ”</div><div style=\"text-align: left;\"><br></div><div style=\"text-align: left;\">熊妈妈说：“孩子，你到森林里去问一圈就知道了。 ”</div><div style=\"text-align: left;\"><br></div><div style=\"text-align: left;\">于是小熊就自己走到森林里，到处问他们什么是幸福啊？<br></div><div style=\"text-align: left;\"><br></div><div style=\"text-align: left;\">可是小兔子小狐狸小猴子小老虎小狮子都说不知道。 但是小熊仍然不放弃，他在森林里转了一圈又一圈，可是仍然不知道什么是幸福。</div><div style=\"text-align: left;\"><br></div><div style=\"text-align: left;\">傍晚，小熊又累又饿，他决定回家。</div><div style=\"text-align: left;\"><br></div><div style=\"text-align: left;\">回到家后，他发现家里摆满了又香又好吃的饭菜。小熊很感动，可是他还是想知道什么是幸福，他就问妈妈。</div><div style=\"text-align: left;\"><br></div><div style=\"text-align: left;\">熊妈妈慈爱的摸了摸他的头，说：“最大的幸福就是熊孩子一天不在家。”</div></p><p style=\"text-align: left;\"><br></p>', 'tom', 1573526679, 1, 1, 1576220067);
INSERT INTO `yefh_mes` VALUES (15, '威胁', '<p>有一个贵族老爷的马被盗了。第二天他在所有的报纸上都刊登了这样一个声明：“如果不把马还给我，那么我就要采取我父亲在这种情况下采取过的非常措施。”<br><br>威胁生效了。小偷不知道会产生什么严重后果，不过他想着可能是某种特别可怕的惩罚，很害怕，于是偷偷地把马送还了。<br><br>能有这样的结局，贵族老爷很高兴。他向朋友们说，他很幸运，因为不须要步父亲的后尘了。<br><br>“可是，请问你父亲是怎么做的？”朋友们问他。<br><br>“你们想知道我父亲是怎么做的么？好吧，我告诉你们……有一次他住旅店时，马被偷走，他就把马肚带套在脖子上，背着马鞍走回家了。如果小偷不是这样善良和客气的话，我发誓，我一定要照父亲那种做法去做！”&nbsp;&nbsp;<br></p>', 'tom', 1573526715, 1, 1, 1576220067);
INSERT INTO `yefh_mes` VALUES (16, '别怨我', '<p>有一个人不善于说话。<br><br>一天，邻居生了个儿子，大家都去祝贺，他也去了。<br><br>主人一见他来了，生怕他说漏了嘴，赶紧让他进屋喝酒吃肉。他也知道自己嘴不好，就低头光吃东西不作声。<br><br>直到吃完了，他才对大家说：“你们都听见了吧，我今天可什么也没说，这个孩子要是死了，可别怨我！”<br><br>顿时气得主人目瞪口呆。</p><p><br></p>', 'tom', 1573526838, 1, 1, 1576220067);
INSERT INTO `yefh_mes` VALUES (17, '有个姑娘叫“舞弊”', '<p><span style=\"color: rgb(123, 91, 161);\">　　大宁河商贸公司要招聘两位女主管，要求相貌出众，大专文化程度。通过面试后剩下四位姑娘，当即进行笔试。可笔试完成后，负责招聘的毕副总收到举报，说有位应聘者涉嫌舞弊，毕副总立即将舞弊的姑娘叫进办公室。<br><br>　　有个姑娘叫“舞弊”那位姑娘身材苗条，相貌美丽，脸上没有浓妆艳抹，穿戴素雅得体。毕副总先提出了几个销售方面的难题，让姑娘回答。姑娘答得滴水不漏，口才甚是了得。毕副总再将考卷取出来，让姑娘用英语念出那段考题的内容：如果你有能力做好一件事情，就必须坚信自己！<br><br>　　姑娘听罢，不卑不亢地对毕副总说：“对不起毕副总，我欺骗你们了。我刚才笔试时舞弊了！”只见姑娘从口袋里取出手机来，又是嫣然一笑：“毕副总不要惊奇，这是一位叫毕乐的好友发给我的短信息，里面是这次英语试题的答案。”<br><br>　　毕副总大惊失色了，毕乐是他的闺女呢。他转身一看，果真见到自己的千金在办公室门边站着呢。毕副总正要发作时，女儿却跑到他身边撒起娇来：“老爸，你不录用她，算是公司的一大损失！她文化程度虽然不高，但才智过人。她曾在四通公司打过工，我见她的推销手段很是高明，所以我才帮她作弊的，文凭也是我帮忙造的假。”<br><br>　　毕副总正要训斥女儿时，姑娘却对毕副总鞠了一躬：“对不起毕副总，让你为难了。”姑娘说罢，便要走开。忽然，她的小灵通响了，姑娘连忙接听，电话是母亲打来的。母亲问女儿考得怎么样了？姑娘妩媚一笑：“妈妈！我辜负你们的期望了。”母亲在电话里急了，问是怎么失败的。姑娘呵呵地笑了：“考官说我不该舞弊啊。”母亲却在电话里吼叫起来，要女儿等着她。姑娘大吃一惊，不知道母亲赶来干什么。<br><br>　　一会儿，只见一位瘸腿妇人走进办公室来，喝问哪位是考官。姑娘有些慌张了，指着毕副总对妇人说：“妈妈，这次真是我的错，不能怪别人！”<br><br>　　妇人到了毕副总面前喊道：“你们不用我女儿可以，但不要作弄人。我女儿命苦，初中没读完就出外打工了。可我女儿能干呢，靠打工挣钱送弟弟念大学，还把我们这两个老不中用接进城里来治病。女儿的爹是哑巴，名字是我取的，怎么不该叫这名儿？这名儿违法了？”<br><br>　　毕副总有些莫名其妙了：“大姐，你说什么啊？我没说你给女儿取的名字有错啊。”妇人大声喊道：“你不是说我女儿不该叫伍碧么。”<br><br>　　姑娘一听，便急了：“妈妈，你刚才在电话里听错了，毕副总责怪我考试不该舞弊了，不是说我名字不该叫伍碧。”<br><br>　　毕副总顿时哭笑不得了。这时，毕副总的女儿喊道：“爸爸，你不是叫毕宽容么？她叫‘舞弊’，你叫‘宽容’，这事还要我点破么？”<br><br>　　毕副总揪了一把女儿的脸蛋，然后对伍碧的母亲哈哈大笑道：“大姐，你女儿这名儿不违法。她虽然舞弊不应该，但承认错误的态度不一般，我就当了这个家，她被破格录用了。”&nbsp;&nbsp;</span><br></p>', 'tom', 1573526867, 1, 1, 1576220067);
INSERT INTO `yefh_mes` VALUES (30, '这不是幼儿园的车', '<p>我要下车</p><p><br></p>', '小明', 1574134081, 2, 0, 0);
INSERT INTO `yefh_mes` VALUES (31, '哲学', '<p>上帝就是神</p>', 'yfh', 1574141436, 6, 0, 0);
INSERT INTO `yefh_mes` VALUES (34, '淡定人生不浮躁', '<h1><p><span style=\"color: rgb(28, 72, 127); font-style: italic; font-family: Tahoma; font-size: large;\">&nbsp; &nbsp; &nbsp; &nbsp;惠子和庄子是好朋友，两个人感情很好，但是他们的观点却经常不一样，有时在一起讨论问题，经常会抬杠。有一次，庄子和惠子在濠水桥上游玩。<br>　　<br>　　庄子说：「小鱼从容自得地游来游去，这就是鱼的快乐呀！」<br>　　<br>　　惠子说：「子非鱼，焉知鱼之乐也？」<br>　　<br>　　庄子说：「子非我，安知我不知鱼之乐？」<br>　　<br>　　惠子说：「我不是你，固然不知道你，但你也不是鱼，你不知道鱼的快乐完全是可以确定的。」<br>　　<br>　　庄子说：「我们回到问题的原点。一开始你说，『你怎么知道鱼的快乐』这句话，实际上是你已经知道我知道鱼快乐才问我的呀，现在我回答你，我是在濠水上才知道的。」<br>　　<br>　　这就是历史上很有名的濠梁之辩，庄子以一个艺术家的闲情逸致去揣测鱼儿的快乐，而惠子却以一个哲学家的严谨，去探求事实的真实性。<br>　　<br>　　于是在我们的文化里就出现了用「子非鱼，安知鱼之乐也」这句话，来反驳那些胡乱臆断别人想法的人。<br>　　<br>　　庄子的人生观里，对「逍遥」的追求占了很大的成分，因此他才会从鱼悠闲戏水的态度，来判断鱼很快乐，这种根据自己心境来对客观事物进行主观臆断，不是庄子的专利，从我们每个人身上都能找得到。<br>　　<br>　　山川日月，花鸟草虫原本没有感情，但人们却很容易沦为感情的奴隶，用自己的悲喜来感受世界。心情好的时候「春风得意马蹄疾」，看什么都美；心情糟的时候又「感时花溅泪」，看谁都不顺眼。不要随便把自己的想法强加到别人头上，就像父母教育孩子时，父母给孩子买了新衣服，说这衣服好看舒服，而孩子穿在身上，却觉得别扭老土。萝卜青菜各有所爱，异类之间是很难沟通的，你有你的悲伤，鱼有鱼的快乐。<br>　　<br>　　一个普通的房子，上班族住了觉得刚好合适，乞丐住了就觉得豪华极了，而给百万富翁去住的话，又觉得实在太寒酸，没法住。所以面对同一件事物，不同的人有不同的看法与感受，我们不能强求别人理解自己。<br>　　<br>　　社会上的某些工作，如清洁工，每天扫垃圾，又脏又累，很多人会认为他们不开心、不快乐。但事实未必，你不是清洁工，就永远不会真正理解他们的感受和想法。一个整日加班熬到深夜的人，在旁人看来可能会觉得他好可怜、好辛苦，但如果工作是他的爱好，也享受加班的过程，那么一切压力都跟他无关了。<br>　　<br>　　子非鱼，焉知鱼之乐？其实即使是鱼，也不见得会知道做鱼的乐趣。且看世间庸庸大众，又有多少人懂得做人的乐趣呢？</span></p><div><br></div></h1>', 'yfh', 1574143259, 5, 0, 0);
INSERT INTO `yefh_mes` VALUES (35, 'love you', '<blockquote style=\"text-align: center;\"><span style=\"font-weight: bold; font-size: xx-large; font-family: 微软雅黑; color: rgb(249, 150, 59);\">me too</span></blockquote>', 'tom', 1574746617, 7, 0, 0);
INSERT INTO `yefh_mes` VALUES (45, '4444', '<p>4444</p><p><br></p>', 'tom', 1574750514, 2, 0, 0);

-- ----------------------------
-- Table structure for yefh_res
-- ----------------------------
DROP TABLE IF EXISTS `yefh_res`;
CREATE TABLE `yefh_res`  (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `rcontent` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `unick` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rcreateat` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  `rdelat` int(11) NULL DEFAULT NULL,
  `rbin` int(2) NOT NULL,
  PRIMARY KEY (`rid`) USING BTREE,
  INDEX `unick`(`unick`) USING BTREE,
  INDEX `mid`(`mid`) USING BTREE,
  CONSTRAINT `yefh_res_ibfk_1` FOREIGN KEY (`unick`) REFERENCES `yefh_user` (`unick`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `yefh_res_ibfk_2` FOREIGN KEY (`mid`) REFERENCES `yefh_mes` (`mid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yefh_res
-- ----------------------------
INSERT INTO `yefh_res` VALUES (2, '挺搞笑的', '小明', 1572956916, 2, 1576220067, 1);
INSERT INTO `yefh_res` VALUES (3, '果然够惊喜', '小明', 1572956943, 5, 0, 0);
INSERT INTO `yefh_res` VALUES (4, '生活不易呀', '小明', 1572957182, 6, 0, 0);
INSERT INTO `yefh_res` VALUES (5, '占个位置先', '小红', 1572957431, 1, 1576220067, 1);
INSERT INTO `yefh_res` VALUES (6, 'that is good', '大黑帅', 1572958266, 2, 1576220067, 1);
INSERT INTO `yefh_res` VALUES (7, '好', 'tom', 1573524490, 1, 1576220067, 1);
INSERT INTO `yefh_res` VALUES (8, '烦烦烦', 'tom', 1573525632, 1, 1576220067, 1);
INSERT INTO `yefh_res` VALUES (9, '哈哈哈哈', 'tom', 1573525642, 1, 1576220067, 1);
INSERT INTO `yefh_res` VALUES (12, '哈哈', 'tom', 1574127380, 3, 1576220046, 2);
INSERT INTO `yefh_res` VALUES (13, '不错不错\r\n', 'yfh', 1574127630, 13, 1576220067, 1);
INSERT INTO `yefh_res` VALUES (14, '还行', '小明', 1574127659, 13, 1576220067, 1);
INSERT INTO `yefh_res` VALUES (15, 'very good\r\n', '小明', 1574133647, 12, 0, 0);
INSERT INTO `yefh_res` VALUES (16, '哈哈，笑死我了\r\n', 'tom', 1574134127, 30, 0, 0);
INSERT INTO `yefh_res` VALUES (17, '你真特么有毒', 'yfh', 1574134163, 30, 0, 0);
INSERT INTO `yefh_res` VALUES (18, 'hello', 'yfh', 1574134988, 8, 0, 0);
INSERT INTO `yefh_res` VALUES (19, '幸福很简单', 'yfh', 1574142874, 14, 1576220067, 1);
INSERT INTO `yefh_res` VALUES (20, '3333', 'tom', 1574763763, 45, 0, 0);
INSERT INTO `yefh_res` VALUES (23, '酷比', 'tom', 1575619752, 17, 1576220067, 1);
INSERT INTO `yefh_res` VALUES (24, '难呀', 'yfh', 1576218494, 7, 1576220066, 1);

-- ----------------------------
-- Table structure for yefh_section
-- ----------------------------
DROP TABLE IF EXISTS `yefh_section`;
CREATE TABLE `yefh_section`  (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `sname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sremark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sbin` int(2) NOT NULL DEFAULT 0,
  `sdelat` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yefh_section
-- ----------------------------
INSERT INTO `yefh_section` VALUES (1, '幽默', '幽默', 1, 1576220067);
INSERT INTO `yefh_section` VALUES (2, '儿童', '儿童', 0, 0);
INSERT INTO `yefh_section` VALUES (3, '爱情', '爱情', 0, 0);
INSERT INTO `yefh_section` VALUES (4, '职场', '职场', 0, 0);
INSERT INTO `yefh_section` VALUES (5, '励志', '这是描述励志故事的板块', 0, 0);
INSERT INTO `yefh_section` VALUES (6, '哲理', '哲理', 0, 0);
INSERT INTO `yefh_section` VALUES (7, '校园', '校园', 0, 0);
INSERT INTO `yefh_section` VALUES (8, '人生', '这是讲述人生哲理的故事', 1, 1576220066);

-- ----------------------------
-- Table structure for yefh_user
-- ----------------------------
DROP TABLE IF EXISTS `yefh_user`;
CREATE TABLE `yefh_user`  (
  `unick` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `upa` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uemail` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `utel` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uimg` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `power` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`unick`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yefh_user
-- ----------------------------
INSERT INTO `yefh_user` VALUES ('tom', 'e10adc3949ba59abbe56e057f20f883e', 'tom@qq.com', '17874316547', '20191205\\fb4763850e1a587c32323d2abf1dc4c5.jpg', '能正常登录，正常发言');
INSERT INTO `yefh_user` VALUES ('xiaoming', 'e10adc3949ba59abbe56e057f20f883e', '508766975@qq.com', '14781321652', 'default.png', '能正常登录，禁止发言');
INSERT INTO `yefh_user` VALUES ('yfh', 'e10adc3949ba59abbe56e057f20f883e', 'yfh@qq.com', '17845464141', '20191105\\6903b9d81a57237c9b1b0a12a284cac6.jpg', '能正常登录，正常发言');
INSERT INTO `yefh_user` VALUES ('大黑帅', 'e10adc3949ba59abbe56e057f20f883e', 'dhs@qq.com', '17863134561', '20191105\\f94d09bb39e25aeacd49fd47a33c0593.jpg', '能正常登录，正常发言');
INSERT INTO `yefh_user` VALUES ('小明', 'e10adc3949ba59abbe56e057f20f883e', 'xiaoming@qq.com', '13551232131', '20191105\\2922ed95619a058a23185067721991cc.jpg', '禁止登录，禁止发言');
INSERT INTO `yefh_user` VALUES ('小红', 'e10adc3949ba59abbe56e057f20f883e', 'xiaohong@qq.com', '17841548712', '20191105\\b2fd91fdedfbc67f4130620b3d2a95f9.jpg', '能正常登录，禁止发言');

SET FOREIGN_KEY_CHECKS = 1;