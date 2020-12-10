开发工具：IDEA，HBuilder X，Maven
开发环境：JDK14，WIN10
涉及技术：SSM框架，Spring security，mysql
项目地址：http://42.192.69.140:8080/SSM_AdminLTE
简单描述：此项目实现了一个数据后台权限管理系统Demo对商品对象，用户对象，资源权限等对象的CRUD。采用Spring security技术对登录用户进行鉴权，实现了方法级别的权限控制，在视图层面对不同权限的用户加载对应的页面。使用Spring AOP切面完成系统级别的日志搜集。

用户名：admin    密码：admin123      权限：所有权限
用户名：user       密码：123                 权限：部分查询与添加权限
用户名：guest     密码：123                 权限：部分查询权限
