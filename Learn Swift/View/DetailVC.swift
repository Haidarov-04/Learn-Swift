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
 lazy var webView: UIWebView = {
        let web = UIWebView()
        web.translatesAutoresizingMaskIntoConstraints = false
        web.loadHTMLString(data, baseURL: nil)
     web.backgroundColor = .customBlue2
        return web
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        view.backgroundColor = .customBlue
    }

    func setupUI() {
        view.addSubview(webView)
        webView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.height.equalToSuperview()
        }
    }

}
