//
//  DetailVC.swift
//  Learn Swift
//
//  Created by Haidarov N on 2/7/25.
//

import UIKit
import SnapKit
import WebKit

class DetailVC: UIViewController {
    var theme = ""
    lazy var data = FileMeneger.shared.getHTMLData(theme)
    
    lazy var webView: WKWebView = {
        let web = WKWebView()
        web.translatesAutoresizingMaskIntoConstraints = false
        web.backgroundColor = .customBlue
        return web
    }()
    
    var loader: UIActivityIndicatorView = {
        let loader = UIActivityIndicatorView()
        loader.color = .white
        loader.translatesAutoresizingMaskIntoConstraints = false
        loader.startAnimating()
        return loader
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewParametrs()
        subViews()
        loadHtml()
        setupUI()
    }
    func viewParametrs() {
        view.backgroundColor = .customBlue
        title = theme
    }
    
    func subViews() {
        view.addSubview(webView)
        view.addSubview(loader)
        
    }
    
    func loadHtml(){
        if let file = data.0, let dir = data.1 {
            webView.loadFileURL(file, allowingReadAccessTo: dir)
        }
    }
    
    func setupUI() {
        loader.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            self.loader.removeFromSuperview()
            self.webView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
                make.width.height.equalToSuperview()
            }
        }
    }
    
}
