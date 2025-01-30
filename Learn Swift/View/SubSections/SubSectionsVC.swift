//
//  ViewController.swift
//  Learn Swift
//
//  Created by Haidarov N on 1/28/25.
//

import UIKit
import SnapKit

class SubSectionVC: UIViewController {
    var sectionName = ""
    
    lazy var data = FileMeneger.shared.getDataAsArray(sectionName)
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = sectionName
        label.font = UIFont(name: "HoeflerText-Regular", size: 25)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(SubSectionCell.self, forCellReuseIdentifier: "main")
        table.separatorStyle = .none
        table.backgroundColor = .orange
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    private func mainSetup() {
        view.backgroundColor = .orange
        navigationController?.isNavigationBarHidden = false
        navigationItem.titleView = label
        
    }
    
    private func delegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupUI() {
//        view.addSubview(label)
//        label.snp.makeConstraints { make in
//            make.top.equalTo(view.layoutMarginsGuide.snp.top)
//            make.centerX.equalToSuperview()
//            make.left.right.equalToSuperview()
//        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.layoutMarginsGuide.snp.top)
            make.height.equalToSuperview().multipliedBy(0.9)
            make.width.equalToSuperview()
        }
    }
    
}

extension SubSectionVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count - 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "main", for: indexPath) as! SubSectionCell
        cell.sectionLabel.text = data[indexPath.row]
        cell.backgroundColor = .orange
        cell.selectionStyle = .none
        return cell
    }
    
    
}
