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
        table.backgroundColor = .customOrange
        table.rowHeight = 90
        table.showsVerticalScrollIndicator = false
        return table
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        mainSetup()
        delegates()
        setupUI()
    }
    
    
    private func mainSetup() {
        view.backgroundColor = .customOrange
        navigationController?.isNavigationBarHidden = true
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
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
    }
    
}

extension MainVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count - 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "main", for: indexPath) as! MainTableViewCell
        cell.sectionLabel.text = data[indexPath.row]
        cell.backgroundColor = .customOrange
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = SubSectionVC()
        vc.sectionName = data[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
