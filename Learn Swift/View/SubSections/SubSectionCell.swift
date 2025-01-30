//
//  MainTableViewCell.swift
//  Learn Swift
//
//  Created by Haidarov N on 1/28/25.
//

import UIKit
import SnapKit

class SubSectionCell: UITableViewCell {
    
    var sectionView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black.withAlphaComponent(0.2)
        view.layer.cornerRadius = 20
        let layer = view.layer
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 10
        return view
    }()
    
    var sectionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HoeflerText-Regular", size: 30)
        label.textAlignment = .center
        label.textColor = .white
        let layer = label.layer
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = .zero
        layer.shadowRadius = 10
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    private func setupUI(){
        contentView.addSubview(sectionView)
        sectionView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.95)
            make.height.equalTo(60)
            
        }
        sectionView.addSubview(sectionLabel)
        sectionLabel.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.center.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
