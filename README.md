

# iOS 广告 SDK集成文档

## Cocoapods集成

Cocoapods集成统计SDK，如工程target名为appDemo，在项目根目录的Podfile的格式：

```
target 'appDemo' do
pod 'ZBAdvertisementSDK'
end
```

ZBAdvertisementSDK支持的iOS最低版本为<font color=red>9.0</font>

### Pod集成示例更新说明

在配置以上 Podfile 文件后，终端使用 pod update 命令进行更新和集成。

```
$ cd [存放Podfile的项目路径]
$ pod update
```

注：不建议加入`--no-repo-update` 参数，若添加后仅从本地Cocoapods库中查找SDK，不再更新线上SDK。如果本地存在SDK会直接使用本地SDK版本(不是线上最新版本)，若本地不存在SDK会产生错误。 也不建议使用 pod install 命令，此命令不会更新最新版本SDK。

**由于 pod search 命令对新增项目可能出现无法找到的情况，建议直接使用 pod update 进行直接更新。**

### Pod常见问题

> 问题： pod search 报错：Unable to find a pod with name

```
“Unable to find a pod with name, author, summary, or description matching `ZBAdvertisementSDK`”
```

> 原因：新增 Pod 项目并没有实时同步到 pod search 所需的索引文件中：~/Library/Caches/CocoaPods/search_index.json
>
> 解决：
>
> 1、执行 pod setup，完成后再进行 pod search 搜索
>
> 2、删除上面 cocoapods 对应路径的索引文件，再执行 pod search 时重建索引就可以找到相应项目
>
> 在终端输入以下命令:

```
rm ~/Library/Caches/CocoaPods/search_index.json
```



## 手动集成framwork

在GitHub下载最新SDK https://github.com/wangxinIOS/ZBAdvertisementSDK

集成步骤如下：

1. 下载ZBAdFramework。

2. Xcode `File` —> `Add Files to "Your Project"`，在弹出Panel选中所下载组件包－>`Add`。（注：选中“Copy items if needed”）

![](https://i.loli.net/2019/02/28/5c77518ab2197.png)

3. 添加依赖库，在项目设置`target` -> 选项卡`General` ->`Linked Frameworks and Libraries`如下：

   ```
   CoreTelephony.framework    获取运营商标识
   StoreKit.framework  应用内打开App Store
   AdSupport.framework 广告标识
   QuartzCore.framework
   ImageIO.framework
   ```

![](https://i.loli.net/2019/04/19/5cb94381ca3f8.png)



## 项目中Buid Settings必须设置Other Linker FLags 

![](https://i.loli.net/2019/04/10/5cad970493ecf.png)





## 集成说明

创建应用并获取ClientId

ClientId是广告SDK后台用来标示App的唯一标识符，集成SDK前需要在创建应用并获取相应的ClientId。

### 初始化,示例代码

在AppDelegate.m文件中  didFinishLaunchingWithOptions方法内部设置

```
 ZBAdConfigure *confg = [ZBAdConfigure new];
 confg.debug = YES;//开发环境设置为YES,会访问测试环境URL
 [ZBAdApi gainApiWithClientId:@"ClientId" andConfig:confg];
```

ZBAdConfigure 属性的说明

```
/// debug模式 为true打印SDKlog信息  default:false
@property (nonatomic, assign) BOOL debug;
```



ZBAdDelegate 代理方法的说明

```
/**
 广告加载失败

 @param code 错误码
 @param msg 错误信息
 */
- (void)onAdLoadFailure:(NSString *)code msg:(NSString *)msg;

/**
 广告加载成功
 */
- (void)onAdLoadSuccess;

/**
 广告被点击
 */
- (void)onAdClick;
```



<font color=red>由于SDK处于测试阶段，网络请求使用http协议，项目中需要进行一下配置</font>

![](https://i.loli.net/2019/02/28/5c778977e3b1d.png)

