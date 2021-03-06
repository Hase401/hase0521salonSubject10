//
//  CustomTableViewCell.swift
//  subject_10
//
//  Created by 長谷川孝太 on 2021/05/21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    static let identifier =  "CustomTableViewCell"

    //UI部品を作る
    private let leftLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    private let rightLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    public func configure(_ prefectureName: String, _ indexNumber: String) {
        //UITableViewCellのcontentView: UIViewにメソッドaddSubViewを使って作ったUI部品を表示させる
        self.contentView.addSubview(leftLabel)
        self.contentView.addSubview(rightLabel)
        
        leftLabel.text = prefectureName
        rightLabel.text = indexNumber + "番目の都道府県です"
        leftLabel.textAlignment = .left
        rightLabel.textAlignment = .right
        //追加
        rightLabel.textColor = UIColor.gray
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        leftLabel.frame = CGRect(x: 20,
                                 y: 5,
                                 width: 100,
                                 height: 30)
        rightLabel.frame = CGRect(x: 100, //leftLabelのwidthと同じ
                                  y: 5,
                                  width: contentView.frame.size.width-100-20, //leftLabelのwidth + leftLabelのx値のみ(右側からの余白)
                                  height: 30)

        //別の書き方
//        leftLabel.frame = CGRect(x: 20,
//                                 y: 5,
//                                 width: 100,
//                                 height: 30)
//        rightLabel.frame = CGRect(x: 120, //leftLabelのwidth + x　にする
//                                  y: 5,
//                                  width: contentView.frame.size.width-120-20,
//                                  height: 30)
    }
}
