- 简单介绍：
xiaomiShop使用最新的flutter3.x版本开发，模拟了真实复杂接口数据，使用了Getx进行管理，好处是1.内部实现了路由管理，相比目前主流的fluro框架更轻量，并且路由跳转无需上下文对象，支持自定义路由中间件和动态路由传参等功能。 2.提供两种简单灵活的实现状态管理的方式。 3.它内部实现了依赖注入，可以快速的获取到某个状态管理器(GetxController)。并且有强大的响应式编程方式，通过数据改变驱动页面显示。经测试实现iOS端和安卓端使用流畅不卡顿。供大家参考学习批评指正。
- 学习心得：
本人从事ios开发多年一直关注flutter的发展从最初的王红元codewhy老师的flutter1.2开始学习，虽然最近1年没有在公司项目中使用flutter但始终保持手热的状态，也希望能找到一份flutter开发的工作，有合适的欢迎联系我的邮箱zh_yes@foxmail.com
- 项目sdk简单介绍：
  ```
  #网络请求,封装dio库进行网络请求
    - dio: ^5.3.3
 #历史保存，使用shared_preferences进行登录状态保存
  shared_preferences: ^2.2.2
   #三级联动，使用city_pickers进行省市区三级联动，保存收货地址
  city_pickers: ^1.3.0
    #加密，适应crypto进行参数加密接口请求访问数据
  crypto: ^3.0.3
      # 使用 flutter_screenutil 进行屏幕适配
  flutter_screenutil: ^5.9.0
```
