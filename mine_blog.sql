/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : mine_blog

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 10/03/2021 23:18:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `views` int(11) NOT NULL,
  `tags` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ctime` int(11) NOT NULL,
  `utime` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_ctime`(`ctime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES (20, '前端性能优化', '<div><font color=\"#008000\" size=\"5\">性能优化</font></div><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;前端优化的途径有很多，大致可以分为两类：页面级优化和代码级优化。</div><font color=\"#000000\"><br></font><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;页面级优化有减少HTTP请求数、脚本的无阻塞加载、内联脚本的位置优化等等。</div><font color=\"#000000\"><br></font><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;代码级优化有Js种DOM操作优化、Css选择符优化、图片优化以及HTML结构优化等等。</div><font color=\"#000000\"><br></font><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;1.页面级优化</div><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;2.代码级优化</div><font color=\"#000000\"><br><br></font><div style=\"color: rgb(0, 0, 0);\"><span style=\"color: rgb(0, 128, 0);\"><font size=\"3\">页面级优化:</font></span></div><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color: rgb(0, 128, 0);\">//&lt;----1.减少HTTP请求数&nbsp;&nbsp;(最重要最有效)-----&gt;</span></div><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;一个完整的请求都需要经过DNS寻址、与服务器建立连接、发送数据、等待服务器响应、接收数据这样一个漫长而复杂的过程。</div><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;由于浏览器进行并发请求的请求数都是有上限的，因此请求数多了以后，浏览器需要分批进行请求，因此会增加用户的等待时间，</div><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;会给用户造成网站速度慢这样一个印象，即使可能用户能看到的第一屏的资源都已经请求完了，但是浏览器的进度条一直在加载。</div><font color=\"#000000\"><br></font><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color: rgb(0, 128, 0);\">//&nbsp;减少HTTP请求数的途径主要有一下几个：</span></div><font color=\"#000000\"><br></font><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/（<span style=\"color: rgb(9, 134, 88);\">1</span>）从设计实现层面简化页面</div><font color=\"#000000\"><br></font><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;如果我么你的页面和百度搜索的页面一眼简单，那么也就不需要什么优化操作了。因此保持页面简洁、减少资源的使用是最直接的。</div><font color=\"#000000\"><br></font><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/（<span style=\"color: rgb(9, 134, 88);\">2</span>）合理设置HTTP缓存</div><font color=\"#000000\"><br></font><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;缓存的力量是强大的，恰当的设置缓存可以大大减少HTTP请求</div><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;怎样才算是合理的设置？原则很简单：能缓存越多越久越好。</div><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;例如：很少变化的图片资源就可以直接通过HTTP&nbsp;Header中的Expires设置一个很长的过期头；</div><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;变化不频繁而又可能会变的资源可以使用Last-Modified来做请求验证。尽可能的让资源能够在缓存中待的更久。</div><font color=\"#000000\"><br></font><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/（<span style=\"color: rgb(9, 134, 88);\">3</span>）资源合并与压缩</div><font color=\"#000000\"><br></font><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;如果可以的话，尽可能的将外部脚本、样式进行合并，尽可能地合并为一个。另外，CSS、Js、Image都可以用相应的工具</div><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;进行压缩，压缩后往往能节省不少空间。或者使用Webpack等前端工程化工具来进行代码的压缩和去重。</div><font color=\"#000000\"><br></font><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/（<span style=\"color: rgb(9, 134, 88);\">4</span>）CSS&nbsp;Sprites&nbsp;雪碧图</div><font color=\"#000000\"><br></font><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;雪碧图又叫做精灵图，我们可以把网站中需要用到的一些icon，全部放到一个图片资源中，然后通过改变位置来</div><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;获取需要的图片，这样合并CSS图片，就可以大幅度减少HTTP请求数了。</div><font color=\"#000000\"><br></font><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;(<span style=\"color: rgb(9, 134, 88);\">5</span>).&nbsp;Inline&nbsp;Images</div><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;　　使用&nbsp;data:&nbsp;URL&nbsp;scheme的方式将图片嵌入到页面或&nbsp;CSS中，如果不考虑资源管理上的问题的话，不失为一个好办法。</div><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;如果是嵌入页面的话换来的是增大了页面的体积，而且无法利用浏览器缓存。使用在&nbsp;CSS中的图片则更为理想一些。</div><font color=\"#000000\"><br></font><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;(<span style=\"color: rgb(9, 134, 88);\">6</span>).&nbsp;Lazy&nbsp;Load&nbsp;Images（自己对这一块的内容还是不了解）&nbsp;懒加载</div><div style=\"color: rgb(0, 0, 0);\">　　&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;这条策略实际上并不一定能减少&nbsp;HTTP请求数，但是却能在某些条件下或者页面刚加载时减少&nbsp;HTTP请求数。</div><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;对于图片而言，在页面刚加载的时候可以只加载第一屏，当用户继续往后滚屏的时候才加载后续的图片。这样一来，</div><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;假如用户只对第一屏的内容感兴趣时，那剩余的图片请求就都节省了。</div><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;有啊首页&nbsp;曾经的做法是在加载的时候把第一屏之后的图片地址缓存在&nbsp;Textarea标签中，待用户往下滚屏的时候才&nbsp;“惰性”&nbsp;加载。</div><font color=\"#000000\"><br></font><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/（<span style=\"color: rgb(9, 134, 88);\">6</span>）瀑布流</div><font color=\"#000000\"><br></font><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;其实懒加载并不能减少HTTP请求数，他只是可以减少页面刚加载的时候的HTTP请求数，总数是不变的。</div><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;对于图片而言，在页面刚加载的时候可能只加载第一屏的图片，随着用户的滚动才会继续加载后面的图片资源，</div><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;这种瀑布流的加载方式就可以有效提高性能。</div><font color=\"#000000\"><br></font><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color: rgb(0, 128, 0);\">//&nbsp;2.将外部脚本放在底部</span></div><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;前文有谈到，浏览器是可以并发请求的，这一特点使得其能够更快的加载资源，然而外链脚本在加载时却会阻塞其他资源，</div><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;例如在脚本加载完成之前，它后面的图片、样式以及其他脚本都处于阻塞状态，直到脚本加载完成后才会开始加载。</div><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;如果将脚本放在比较靠前的位置，则会影响整个页面的加载速度从而影响用户体验。解决这一问题的方法有很多，</div><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在&nbsp;这里有比较详细的介绍&nbsp;(这里是译文和&nbsp;更详细的例子&nbsp;)，而最简单可依赖的方法就是将脚本尽可能的往后挪，减少对并发下载的影响。</div><font color=\"#000000\"><br></font><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color: rgb(0, 128, 0);\">//&nbsp;3.并发执行inline脚本</span></div><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;使用&nbsp;script元素的defer&nbsp;属性(存在兼容性问题和其他一些问题，例如不能使用&nbsp;document.write)、使用setTimeout&nbsp;，此外，</div><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在HTML5中引入了&nbsp;Web&nbsp;Workers的机制，恰恰可以解决此类问题。</div><font color=\"#000000\"><br></font><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color: rgb(0, 128, 0);\">//&nbsp;4.懒加载</span></div><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;只需要在需要资源的时候才加载资源，不需要的时候就不加载资源。</div><font color=\"#000000\"><br></font><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color: rgb(0, 128, 0);\">//&nbsp;5.&nbsp;将&nbsp;CSS放在&nbsp;HEAD中</span></div><div style=\"color: rgb(0, 0, 0);\">　　&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;如果将&nbsp;CSS放在其他地方比如&nbsp;BODY中，则浏览器有可能还未下载和解析到&nbsp;CSS就已经开始渲染页面了，这就导致页面由无&nbsp;CSS状态跳转到&nbsp;CSS状态，</div><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用户体验比较糟糕。除此之外，有些浏览器会在&nbsp;CSS下载完成后才开始渲染页面，如果&nbsp;CSS放在靠下的位置则会导致浏览器将渲染时间推迟。</div><font color=\"#000000\"><br></font><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;Js&nbsp;与&nbsp;css&nbsp;懒加载</div><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;把js放到整个页面的底部，&nbsp;另一个方法是在script&nbsp;标签上加一个&nbsp;defer属性&nbsp;保证让浏览器把脚本下载出来后，</div><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;然后等到页面渲染完毕再执行。（参考权威指南&nbsp;js时间线）</div><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Css文件用link标签加载&nbsp;是阻塞状态的，我们可以使用loadCss&nbsp;小工具库来进行异步css文件加载，但是有一个问题是</div><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;，全部异步加载css&nbsp;，页面最开始呈现出的只是单纯的html&nbsp;,不是很好看&nbsp;所以我们要选定一个关键的css文件，</div><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用critical&nbsp;工具来自动提取压缩关键的css.&nbsp;（百度自行查看使用方法）</div><font color=\"#000000\"><br><br></font><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color: rgb(0, 128, 0);\">//&nbsp;8.减少不必要的HTTP跳转</span></div><font color=\"#000000\"><br></font><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;对于以目录形式访问的HTTP链接，很多人都会忽略链接最后是否带’/’，加入你的服务器对此区别对待的话，那么你也需要注意了，</div><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;这其中很可能隐藏了301跳转，增加了多余请求。</div><font color=\"#000000\"><br></font><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color: rgb(0, 128, 0);\">//&nbsp;9.避免重复的资源请求</span></div><font color=\"#000000\"><br></font><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;这种情况主要是由于在模块化开发时，我们的不同模块之间可能有相同的部分，导致资源的重复请求。</div><div style=\"color: rgb(0, 0, 0);\"><font size=\"3\"><br></font></div><div style=\"color: rgb(0, 0, 0);\"><font size=\"3\">代码级优化</font></div><font color=\"#000000\"><br></font><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color: rgb(0, 128, 0);\">//1.DOM</span></div><font color=\"#000000\"><br></font><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DOM操作应该是脚本中最耗性能的一类操作</div><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;/（<span style=\"color: rgb(9, 134, 88);\">1</span>）HTMLCollection（HTML收集器，返回的是一个数组的内容信息）</div><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;因为是这个集合并不是一个静态的集合，它表示的仅仅是一个特定的查询，每次访问该集合时都会重新执行这个&nbsp;查询从而更新查询结果。</div><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;所谓的“访问集合”包括读取集合的length属性、访问集合中的元素。</div><font color=\"#000000\"><br></font><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;/（<span style=\"color: rgb(9, 134, 88);\">2</span>）Reflow&amp;Repaint</div><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;减少页面的重绘和重排。</div><font color=\"#000000\"><br></font><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color: rgb(0, 128, 0);\">//2.慎用with</span></div><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;with会改变作用域链，有可能导致我们的作用域链变长，导致查询性能下降。</div><font color=\"#000000\"><br></font><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color: rgb(0, 128, 0);\">//3.避免使用eval和Function</span></div><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;每次&nbsp;eval&nbsp;或&nbsp;Function&nbsp;构造函数作用于字符串表示的源代码时，脚本引擎都需要将源代码转换成可执行代码。这是很消耗资源的操作</div><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;——&nbsp;通常比简单的函数调用慢&nbsp;100倍以上。</div><font color=\"#000000\"><br></font><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;<span style=\"color: rgb(0, 128, 0);\">//&nbsp;4.减少作用域链查找</span></div><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;如果在循环中需要访问非本作用域下的变量的时候，请遍历之前用局部变量缓存的变量，并在遍历结束之后重写这个缓存变量</div><font color=\"#000000\"><br></font><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color: rgb(0, 128, 0);\">//5.数据访问</span></div><font color=\"#000000\"><br></font><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;js中对直接量和局部变量的访问时最快的，对对象属性以及数组的访问需要更大的开销，当出现下面的情况的时候，建议将数据放入局部变量：</div><font color=\"#000000\"><br></font><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/（<span style=\"color: rgb(9, 134, 88);\">1</span>）对任何对象属性的访问超过1次</div><font color=\"#000000\"><br></font><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/（<span style=\"color: rgb(9, 134, 88);\">2</span>）对任何数组成员的访问次数超过1次</div><font color=\"#000000\"><br></font><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;另外，要尽可能的减少对对象以及数组的深度查找。</div><font color=\"#000000\"><br></font><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color: rgb(0, 128, 0);\">//6.字符串拼接</span></div><font color=\"#000000\"><br></font><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;字符串的拼接尽可能少的使用“+”，这种方式的效率是十分低下的，因为每次运行都会开辟新的内存并生成新的字符串变量，然后将拼接的结果赋</div><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;值给新变量。</div><font color=\"#000000\"><br></font><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;建议使用的是先转化为数组，然后通过数组的join方法来连接成字符串。不过由于数组也有一定的开销，因此就需要权衡一下，当拼接的字符串比</div><div style=\"color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;较少的时候，可以考虑用“+”的方式，比较多的时候就需要考虑用数组的join方法了。</div><font color=\"#000000\"><br><br></font><div style=\"color: rgb(0, 0, 0);\">+++++++++++重绘重排++++++++++++++++++++</div><div style=\"color: rgb(0, 0, 0);\">重绘和重排:</div><font color=\"#000000\"><br></font><div style=\"color: rgb(0, 0, 0);\">页面有三个树：DOMTree、CSSTree、renderTree。（实际上多于三个），renderTree上有两个规则：repaint和reflow，重绘和重排。</div><font color=\"#000000\"><br></font><div style=\"color: rgb(0, 0, 0);\">repaint是元素自身的位置和宽高不变，只改变颜色的之类的属性而不会导致后面的元素位置的变化的时候，renderTree发生的动作。</div><font color=\"#000000\"><br></font><div style=\"color: rgb(0, 0, 0);\">reflow是元素自身的位置或者宽高改变了从而导致的整个页面的大范围移动的时候，renderTree发生的动作。</div><font color=\"#000000\"><br></font><div style=\"color: rgb(0, 0, 0);\">所以我们在DOM操作的时候，要尽量避免重排。</div><font color=\"#000000\"><br style=\"font-family: Consolas, &quot;Courier New&quot;, monospace; white-space: pre;\"></font>', 6, '性能优化', 1603516570, 1603516570);

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) NOT NULL,
  `parent` int(11) NOT NULL,
  `user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `comments` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ctime` int(11) NOT NULL,
  `utime` int(11) NULL DEFAULT NULL,
  `parent_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx`(`blog_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES (19, -1, -1, '小c', '你好', '1510948862@qq.com', 1603457054, 1603457054, '0');
INSERT INTO `comments` VALUES (20, 20, -1, '游客1', '讲的不错呦', '1510948862@qq.com', 1615389228, 1615389228, '0');
INSERT INTO `comments` VALUES (21, 20, 20, '回复游客1', '赞同', '', 1615389449, 1615389449, '游客1');

-- ----------------------------
-- Table structure for every_day
-- ----------------------------
DROP TABLE IF EXISTS `every_day`;
CREATE TABLE `every_day`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ctime` int(11) NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_ctime`(`ctime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic STORAGE DISK;

-- ----------------------------
-- Records of every_day
-- ----------------------------
INSERT INTO `every_day` VALUES (3, 1603460129, '黄河走东溟，白日落西海，逝川与流光，飘忽不相待。<blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\"><blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\"><blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\"><blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\"><blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\"><blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\"><blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\"><blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\"><div>——李白</div></blockquote></blockquote></blockquote></blockquote></blockquote></blockquote></blockquote></blockquote>');

-- ----------------------------
-- Table structure for tag_blog_mapping
-- ----------------------------
DROP TABLE IF EXISTS `tag_blog_mapping`;
CREATE TABLE `tag_blog_mapping`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `ctime` int(11) NOT NULL,
  `utime` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tag_id`(`tag_id`) USING BTREE,
  INDEX `idx_blog_id`(`blog_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tag_blog_mapping
-- ----------------------------
INSERT INTO `tag_blog_mapping` VALUES (15, 9, 20, 1603516570, 1603516570);

-- ----------------------------
-- Table structure for tags
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ctime` int(11) NOT NULL,
  `utime` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `tag_nq`(`tag`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tags
-- ----------------------------
INSERT INTO `tags` VALUES (9, '性能优化', 1603516570, 1603516570);

SET FOREIGN_KEY_CHECKS = 1;
