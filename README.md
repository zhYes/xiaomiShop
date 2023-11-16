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
- 项目截图
  

![Simulator Screen Recording - iPhone 14 Pro - 2023-11-16 at 10 24 57](https://github.com/zhYes/xiaomiShop/assets/19343447/d8207d07-4713-45bd-995d-8ba98a9d40c2)
![Simulator Screen Recording - iPhone 14 Pro - 2023-11-16 at 10 25 40](https://github.com/zhYes/xiaomiShop/assets/19343447/6fc6fb79-b5fa-420a-ad9e-53b6d84ccddb)
![Simulator Screen Recording - iPhone 14 Pro - 2023-11-16 at 10 26 54](https://github.com/zhYes/xiaomiShop/assets/19343447/1e07a241-0542-4569-ae9a-cdb67b705d63)
![Simulator Screen Recording - iPhone 14 Pro - 2023-11-16 at 10 28 32](https://github.com/zhYes/xiaomiShop/assets/19343447/f944564b-5e9e-4f53-9cf8-46eb3babbd7d)
![Simulator Screen Recording - iPhone 14 Pro - 2023-11-16 at 10 33 04](https://github.com/zhYes/xiaomiShop/assets/19343447/d0f6097e-bf06-4251-9f34-039deed4f96a)
![Simulator Screen Recording - iPhone 14 Pro - 2023-11-16 at 10 34 08](https://github.com/zhYes/xiaomiShop/assets/19343447/7080e5b2-0614-4580-a00d-63662ea0359f)
![Simulator Screen Recording - iPhone 14 Pro - 2023-11-16 at 10 34 47](https://github.com/zhYes/xiaomiShop/assets/19343447/3571a007-96e4-41a2-a781-6fa023dc4433)
![Simulator Screen Recording - iPhone 14 Pro - 2023-11-16 at 10 37 44](https://github.com/zhYes/xiaomiShop/assets/19343447/182b6f65-fb39-419a-ac6a-4562c50cf82e)
![Simulator Screen Recording - iPhone 14 Pro - 2023-11-16 at 10 38 39](https://github.com/zhYes/xiaomiShop/assets/19343447/0a50840d-7955-42a1-afe2-8f5e4cd43234)
![Simulator Screen Recording - iPhone 14 Pro - 2023-11-16 at 10 40 09](https://github.com/zhYes/xiaomiShop/assets/19343447/bfad357d-f077-4f6d-80ba-dde2c768928b)
![Simulator Screen Recording - iPhone 14 Pro - 2023-11-16 at 10 36 20](https://github.com/zhYes/xiaomiShop/assets/19343447/8e0bbab1-89fe-4d06-8b25-a96dd5b7913f)
