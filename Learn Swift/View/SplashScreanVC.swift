//
//  SplashScreanVC.swift
//  Learn Swift
//
//  Created by Haidarov N on 1/30/25.
//

import UIKit

class SplashScreanVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        goToMainScrean()
    }
    private func goToMainScrean(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0){
            let vc = MainVC()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
  
}
