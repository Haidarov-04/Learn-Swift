//
//  ViewController.swift
//  Learn Swift
//
//  Created by Haidarov N on 1/28/25.
//

import UIKit
import SnapKit

class MainVC: UIViewController {
    let data = FileMeneger.shared.getDataAsArray("Sections")
    
    var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Are You Ready To Learning IOS Development"
        label.font = UIFont(name: "HoeflerText-Regular", size: 25)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(MainTableViewCell.self, forCellReuseIdentifier: "main")
        table.separatorStyle = .none
        table.backgroundColor = .customBlue
        table.rowHeight = 90
        table.showsVerticalScrollIndicator = false
        return table
    }()
    
    var splash: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "swift")
        return image
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        mainSetup()
        delegates()
        setupUI()
        removeSplash()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mainSetup()
    }
    
    private func mainSetup() {
        view.backgroundColor = .customBlue
        navigationController?.isNavigationBarHidden = true
        tableView.backgroundColor = .customBlue
    }
    
    private func delegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupUI() {
      
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.top.equalTo(view.layoutMarginsGuide.snp.top)
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview()
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(10)
            make.height.equalToSuperview().multipliedBy(0.9)
            make.width.equalToSuperview()
        }
        view.addSubview(splash)
        splash.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.height.equalToSuperview()
        }
    }
    
    func removeSplash(){
            UIView.animate(withDuration: 5, animations: {
                self.splash.alpha = 0.0
                
            })
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            self.splash.removeFromSuperview()
        }
    }
    
}

extension MainVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count - 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "main", for: indexPath) as! MainTableViewCell
        cell.sectionLabel.text = data[indexPath.row]
        cell.backgroundColor = .customBlue
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = SubSectionVC()
        vc.sectionName = data[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
