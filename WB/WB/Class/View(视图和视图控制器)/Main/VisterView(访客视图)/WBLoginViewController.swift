//
//  WBLoginViewController.swift
//  WB
//
//  Created by yang'yang on 2018/2/23.
//  Copyright © 2018年 yang'yang. All rights reserved.
//

import UIKit

class WBLoginViewController: UIViewController {

    lazy var webView:UIWebView = UIWebView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view=webView
        webView.delegate=self
        webView.scrollView.isScrollEnabled=false
        navigationItem.leftBarButtonItem=UIBarButtonItem.init(title: "返回", target: self, action: #selector(backAction), isBack: true)
        navigationItem.rightBarButtonItem=UIBarButtonItem.init(title: "自动填充", target: self, action: #selector(autoLogin))
        loadUrl()
    }

    @objc func backAction(){
        dismiss(animated: true, completion: nil)
    }
    
    
    private func loadUrl(){
        let urlString = "https://api.weibo.com/oauth2/authorize?client_id=\(AppKey)&redirect_uri=\(callBackUrl)"
        guard let url = URL(string: urlString) else {
            return
        }
        let urlRequest = URLRequest(url:url)
        webView.loadRequest(urlRequest)
    }
    

   @objc private func autoLogin(){
    let str = "document.getElementById('userId').value='13921434935';document.getElementById('passwd').value='yy1234loveme';"
        webView.stringByEvaluatingJavaScript(from: str)
    }

}

extension WBLoginViewController:UIWebViewDelegate{
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
     //目的是拿取code,和加载的URL如果是以www.baidu.com开始的，就不加载
        let urlStr = request.url?.absoluteString
        //bool的类型有true/false/nil几种类型
        if urlStr?.hasPrefix(callBackUrl) == false {
            return true
        }
        //寻找code
        if urlStr?.hasPrefix("code=") == false{
            backAction()
            return false
        }
        //request.url?.query
        let code = request.url?.query?.substring(from: "code=".endIndex) ?? ""
        return false
    }
    
}



