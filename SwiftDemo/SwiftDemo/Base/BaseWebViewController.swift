//
//  BaseWebViewController.swift
//  SwiftDemo
//
//  Created by gaofu on 16/8/26.
//  Copyright © 2016年 gaofu. All rights reserved.
//

import UIKit
import WebKit
import SVProgressHUD

class BaseWebViewController: BaseViewController
{
    
    var requestUrl :  String?
    
    //懒加载
    lazy var webView : WKWebView =
        {
            //            ()-> WKWebView in
            let web = WKWebView()
            web.frame = self.view.bounds
            web.contentMode = .ScaleAspectFit
            web.navigationDelegate = self
            web.allowsBackForwardNavigationGestures = true
            web.autoresizingMask = [.FlexibleHeight,.FlexibleWidth]
            web.scrollView.backgroundColor = self.view.backgroundColor;
            
            return web
    }()
    
    
    //MARK: -
    //MARK: Global Variables
    
    
    //MARK: -
    //MARK: Public Methods
    
    func reloadWebView()
    {
        
        self.webView.reload()
        
    }
    
    //MARK: -
    //MARK: DataInitialize
    
    
    //MARK: -
    //MARK: Lifecycle
    
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        
        setupWebView()
        
    }
    
    
    //MARK: -
    //MARK: Interface Components
    
  private func setupWebView()
    {
        view.addSubview(self.webView)
        
        guard  let urlStr = requestUrl else
        {
            return
        }
        
        webView.loadRequest(NSURLRequest(URL: NSURL(string: urlStr)!))
    }
    
    
    //MARK: -
    //MARK: Target Action Methods
    
    @objc private func customBackItemClicked()
    {
        webView.goBack()
    }
    
    //MARK: -
    //MARK: DataRequest
    
    
    //MARK: -
    //MARK: <#statement#> Delegate
    
    
    //MARK: -
    //MARK: Dealloc
    
    
    //MARK: -
    //MARK: Private Methods
    
   private func pushCurrentSnapshotViewWithRequest(request : NSURLRequest)
    {
        
        if request.URL?.absoluteString == "about:blank"
        {
            return
        }
        
        webView.hidden = true
        
        SVProgressHUD.showWithStatus("加载中")
        
    }
    
    
   private func updateNavigationItems()
    {
        
        if webView.canGoBack
        {
            navigationController?.interactivePopGestureRecognizer?.enabled = false
            
            let spaceButtonItem = UIBarButtonItem(barButtonSystemItem: .FixedSpace, target: nil, action: nil)
            spaceButtonItem.width = -6.5
            
            let backItemImage = UIImage(named: "backItemImage")?.imageWithRenderingMode(.AlwaysTemplate)
            let backItemHlImage = UIImage(named: "backItemImage-hl")?.imageWithRenderingMode(.AlwaysTemplate)
            
            let backButton = UIButton()
            backButton.setTitle("返回", forState: .Normal)
            backButton.setTitleColor(navigationController?.navigationBar.tintColor, forState: .Normal)
            backButton.setTitleColor(navigationController?.navigationBar.tintColor.colorWithAlphaComponent(0.5), forState: .Highlighted)
            backButton.titleLabel?.font = UIFont.systemFontOfSize(17)
            backButton.setImage(backItemImage, forState: .Normal)
            backButton.setImage(backItemHlImage, forState: .Highlighted)
            backButton.sizeToFit()
            backButton.addTarget(self, action: #selector(customBackItemClicked), forControlEvents: .TouchUpInside)
            
            let customBackBarItem = UIBarButtonItem(customView: backButton)
            
            navigationItem.leftBarButtonItems = [spaceButtonItem,customBackBarItem]
        }
        else
        {
            navigationController!.interactivePopGestureRecognizer!.enabled = true;
            navigationItem.leftBarButtonItems = nil
            
        }
        
    }
    
    
}

extension BaseWebViewController : WKNavigationDelegate
{
    
    func webView(webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!)
    {
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
    }
    
    func webView(webView: WKWebView, decidePolicyForNavigationAction navigationAction: WKNavigationAction, decisionHandler: (WKNavigationActionPolicy) -> Void)
    {
        
        if navigationAction.targetFrame?.mainFrame == true
        {
            switch navigationAction.navigationType
            {
            case .LinkActivated,.FormSubmitted,.Other:
                pushCurrentSnapshotViewWithRequest(navigationAction.request)
            default:
                break
            }
        }
        
        decisionHandler(.Allow);
        
    }
    
    
    func webView(webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: NSError)
    {
        
        webView.hidden = false
        SVProgressHUD.dismiss()
        UIApplication.sharedApplication().networkActivityIndicatorVisible  = false
        
    }
    
    
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!)
    {
        
        webView.hidden = false
        SVProgressHUD.dismiss()
        UIApplication.sharedApplication().networkActivityIndicatorVisible  = false
        //            self.updateNavigationItems()
        
        webView.evaluateJavaScript("document.title") { (str, error) in
            guard let titleStr = str as? String else { return }
            
            var selfTitle = titleStr
            if titleStr.length > 10
            {
                selfTitle  = titleStr.substringToIndex(titleStr.startIndex.advancedBy(9)).stringByAppendingString("...")
            }
            
            guard let _ = self.title else
            {
                self.title = selfTitle
                return
            }
            
        }
        
    }
    
}



