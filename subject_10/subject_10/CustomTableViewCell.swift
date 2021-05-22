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
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentHuggingPriority(UILayoutPriority(251), for: .horizontal)
        label.textAlignment = .left
        return label
    }()
    
    private let rightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.textColor = .gray
        return label
    }()

    private static let backgroundColors: [UIColor] = [
        UIColor(red: 255 / 255, green: 134 / 255, blue: 133 / 255, alpha: 1),
        UIColor(red: 155 / 255, green: 255 / 255, blue: 153 / 255, alpha: 1),
        UIColor(red: 174 / 255, green: 199 / 255, blue: 255 / 255, alpha: 1),
    ]

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        fatalError("not implemented")
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        //UITableViewCellのcontentView: UIViewにメソッドaddSubViewを使って作ったUI部品を表示させる
        self.contentView.addSubview(leftLabel)
        self.contentView.addSubview(rightLabel)

        NSLayoutConstraint.activate([
            // horizontal
            leftLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            leftLabel.trailingAnchor.constraint(equalTo: rightLabel.leadingAnchor),
            rightLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            // vertical
            leftLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            leftLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            rightLabel.topAnchor.constraint(equalTo: leftLabel.topAnchor),
            rightLabel.bottomAnchor.constraint(equalTo: leftLabel.bottomAnchor),
        ])
    }
    
    public func configure(prefectureName: String, row: Int) {

        leftLabel.text = prefectureName
        rightLabel.text = "\(row)番目の都道府県です"

        self.backgroundColor
            = Self.backgroundColors[row % Self.backgroundColors.count]
    }
}
