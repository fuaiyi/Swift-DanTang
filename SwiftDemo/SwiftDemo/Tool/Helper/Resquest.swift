//
//  Resquest.swift
//
//
//  Created by gaofu on 16/8/26.
//
//


/*
 1. 最丑陋方法（Swift皮，Objective-C心）
 
 class TheOneAndOnlyKraken
 {
 class var sharedInstance: TheOneAndOnlyKraken
 {
 struct Static
 {
 static var onceToken: dispatch_once_t = 0
 static var instance: TheOneAndOnlyKraken? = nil
 }
 dispatch_once(&Static.onceToken) {
 Static.instance = TheOneAndOnlyKraken()
 }
 return Static.instance!
 }
 }
 这个版本是Objective-C的直接移植版。我认为它不好看是因为Swift本该更简洁、更有描述力。不要做个搬运工，要做就做的更好
 
 
 2. 结构体方法（“新瓶装老酒）
 
 class TheOneAndOnlyKraken {
 class var sharedInstance: TheOneAndOnlyKraken {
 struct Static {
 static let instance = TheOneAndOnlyKraken()
 }
 return Static.instance
 }
 }
 Swift 1.0时，不支持静态类变量，那时这个方法是不得已而为之。但使用结构体，就可以支持这个功能。因为静态变量的限制，我们被约束在这样的一个模型中。这比Objective-C移植版本好一些，但还不够好。有趣的是，在Swift 1.2发布几个月后，我还可以看到这种写法。在那之后，反而更多了。
 
 3.全局变量方法（“单行单例”方法）
 
 private let sharedKraken = TheOneAndOnlyKraken()
 class TheOneAndOnlyKraken {
 class var sharedInstance: TheOneAndOnlyKraken {
 return sharedKraken
 }
 }
 在Swift 1.2以后，我们有了访问权限设置(access control specifiers) 的功能和静态类成员(static class members)。这意味着我们终于可以摆脱混乱的全局变量、全局命名空间，也不会发生命名空间冲突了。这个版本看起来更Swiftier一点。
 
 
 class TheOneAndOnlyKraken {
 static let sharedInstance = TheOneAndOnlyKraken()
 private init() {} //This prevents others from using the default '()' initializer for this class.
 }
 这样做就可以保证编译器在某个类尝试使用()来初始化TheOneAndOnlyKraken时，抛出错误：
 
 */



import UIKit
import SVProgressHUD
import Alamofire
import SwiftyJSON

class Resquest: NSObject
{
    
    ///单例
    static let shanreRequest = Resquest()
    private override init(){}
    
    
    private let BASE_URL = "http://api.dantangapp.com/"
    
    
    ///1. 获取首页顶部数据
    func loadHomeTopData(finished : (channels : [Channel]) -> ())
    {
        
        let url = BASE_URL + "v2/channels/preset"
        let params = ["gender" : 1,"generation" : 1]
        
        Alamofire.request(.GET, url, parameters: params).responseJSON { (response) in
            
            guard response.result.isSuccess else
            {
                SVProgressHUD.showErrorWithStatus("加载失败...")
                return
            }
            
            if let value = response.result.value
            {
                let dict = JSON(value)
                
                let code = dict["code"].intValue
                let message = dict["message"].stringValue
                
                guard code == RETURN_OK else
                {
                    SVProgressHUD.showErrorWithStatus(message)
                    return
                }
                
                SVProgressHUD.dismiss()
                
                let data = dict["data"].dictionary
                
                if let channels = data!["channels"]?.arrayObject
                {
                    var tmpChannels = [Channel]()
                    
                    for channel in channels
                    {
                        let tmpChannel = Channel(dict: channel as! [String : AnyObject])
                        tmpChannels.append(tmpChannel)
                    }
                    
                    finished(channels: tmpChannels)
                }
                
            }
        }
    }
    
    
    ///2. 获取首页数据
    
    func loadHomeInfo(id : Int, finished : (homeItems : [HomeItem]) -> ())
    {
        
        let url = BASE_URL + "v1/channels/\(id)/items"
        let params = ["gender" : 1 , "generation" : 1 , "limit" : 20 , "offset" : 0]
        
        Alamofire.request(.GET, url, parameters: params).responseJSON { (response) in
            
            guard response.result.isSuccess else
            {
                SVProgressHUD.showErrorWithStatus("加载失败...")
                return
            }
            
            if let value = response.result.value
            {
                let dict = JSON(value)
                
                let code = dict["code"].intValue
                let message = dict["message"].stringValue
                
                guard code == RETURN_OK else
                {
                    SVProgressHUD.showErrorWithStatus(message)
                    return
                }
                
                let data = dict["data"].dictionary
                if let items = data!["items"]?.arrayObject
                {
                    var homeItems = [HomeItem]()
                    
                    for tmpHomeItem in items
                    {
                        let tmpItem = HomeItem(dict: tmpHomeItem as! [String : AnyObject] )
                        homeItems.append(tmpItem)
                    }
                    
                    finished(homeItems: homeItems)
                }
                
            }
        }
        
        
    }
    
    
    ///3. 获取产品数据
    
    func loadProductData( finished : ( products : [Product] ) -> () )
    {
        
        SVProgressHUD.showWithStatus("正在加载...")
        let url = BASE_URL + "v2/items"
        let params = [  "gender": 1,
                        "generation": 1,
                        "limit": 20,
                        "offset": 0 ]
        
        Alamofire.request(.GET, url, parameters: params).responseJSON { (response) in
            
            guard response.result.isSuccess else
            {
                SVProgressHUD.showErrorWithStatus("加载失败...")
                return
            }
            
            if let value = response.result.value
            {
                let dict = JSON(value)
                let code = dict["code"].intValue
                let message = dict["message"].stringValue
                
                guard code == RETURN_OK else
                {
                    SVProgressHUD.showErrorWithStatus(message)
                    return
                }
                
                SVProgressHUD.dismiss()
                
                
                guard let data = dict["data"].dictionary else { return }
                
                if let items = data["items"]?.arrayObject
                {
                    var prosuts = [Product]()
                    
                    for item in items
                    {
                        guard let itemData = item["data"] else { return }
                        let product = Product(dict: itemData as! [String : AnyObject])
                        prosuts.append(product)
                    }
                    
                    finished(products: prosuts)
                }
                
            }
            
        }
        
    }
    
    
    ///4. 分类界面 顶部 专题合集
    func loadCategoryCollection( limit : Int, finished :  (collections:[Collection])->() )
    {
        
        SVProgressHUD.showWithStatus("正在加载...")
        let url = BASE_URL + "v1/collections"
        let params = ["limit": limit,
                      "offset": 0]
        
        Alamofire.request(.GET, url, parameters: params).responseJSON { (response) in
            
            guard response.result.isSuccess else
            {
                SVProgressHUD.showErrorWithStatus("加载失败...")
                return
            }
            
            guard let value = response.result.value else { return }
        
            let dict = JSON(value)
            
            let code = dict["code"].intValue
            let message = dict["message"].stringValue
            
            guard code == RETURN_OK else
            {
                SVProgressHUD.showErrorWithStatus(message)
                return
            }
            
            SVProgressHUD.dismiss()
            
            guard let data = dict["data"].dictionary else { return }
            guard let collectionData = data["collections"]?.arrayObject else { return }
            
            var collections = [Collection]()
            
            for item in collectionData
            {
                let tmpCollection = Collection(dict: item as! [String : AnyObject])
                collections.append(tmpCollection)
            }
            
            finished(collections: collections)
    
        }
        
    }
    
    
    ///5. 分类界面 风格,品类
    func loadCategoryGroup( finished: (groups:[AnyObject])-> () )
    {
        
        SVProgressHUD.showWithStatus("正在加载...")
        let url = BASE_URL + "v1/channel_groups/all"
        
        Alamofire.request(.GET, url).responseJSON { (response) in
            
            guard response.result.isSuccess else
            {
                SVProgressHUD.showErrorWithStatus("加载失败...")
                return
            }
            
            guard let value = response.result.value else { return }
            
            let dict = JSON(value)
            
            let code = dict["code"].intValue
            let message = dict["message"].stringValue

            guard code == RETURN_OK else
            {
                SVProgressHUD.showErrorWithStatus(message)
                return
            }
            
            SVProgressHUD.dismiss()
            
            guard let data = dict["data"].dictionary else { return }
            guard let channel_groups = data["channel_groups"]?.arrayObject else { return }
            
            var channel_group = [AnyObject]()
            
            for group in channel_groups
            {
                var groups = [Group]()
                
                let channels = group["channels"] as! [AnyObject]

                for channel in channels
                {
                    let tmpGroup = Group(dict: channel as! [String : AnyObject])
                    groups.append(tmpGroup)
                }
                
                channel_group.append(groups)
            }
            
            finished(groups: channel_group)
            
        }
        
    }
    
}
