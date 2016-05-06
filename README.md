# Julia 中文社区

这里是Julia中文社区的主页. Julia中文社区旨在为中文Julia用户/开发者提供更加方便的资源, 以及维护供中文用户交流的相关QQ群, 论坛.

在这里的issue大家可以来讨论站点建设, 社区发展, Julia中文推广等相关内容.

中文文档的翻译工作请戳 [Julia中文文档](https://github.com/JuliaCN/julia_zh_cn)

Julia机器人 **JetAlpha** 请戳 [KDr2/JetAlpha](https://github.com/KDr2/JetAlpha.jl)


## 文件夹的相关说明

`recruitment` 用来添加招聘信息

### 如何添加招聘

- 在`_post`里新建一个markdown文件,文件名格式为 `year`-`month`-`day`-`title`.md
- markdown文件中仿照[招聘样例](https://github.com/JuliaCN/juliacn.github.io/blob/rogerluo/_posts/2016-05-01-haplox.md)
- 注意`categories` 应为 `recruitment`
- 提交您的PR (pull request即可)
- 如果您不熟悉github和jekyll可以将招聘的文案写好,提交一个issue由我们来帮助发布招聘广告.

`meetup` Meetup信息请添加在这里

### 如何添加meetup

- 请先在此repo开一个issue,与我们联系组织meetup相关事宜
- 在`_post`里新建一个markdown文件,文件名格式为 `year`-`month`-`day`-`title`.md
- markdown文件中仿照[2016年深圳小聚](https://github.com/JuliaCN/juliacn.github.io/blob/rogerluo/_posts/2016-03-19-2016-user-meetup.md)
- 注意`categories` 应为 `meetups`
- 提交您的PR (pull request即可)
- 如果您不熟悉github和jekyll可以将文案写好,提交一个issue由我们来帮助发布.


## 如何在本地编辑此网站

我们采用了Jekyll生成网页. 您可以根据这些提示在本地生成主页 [instructions](https://help.github.com/articles/using-jekyll-with-pages)

在安装了jekyll之后, 用`git clone`下载我们的主页, 然后运行`jekyll serve`即可
