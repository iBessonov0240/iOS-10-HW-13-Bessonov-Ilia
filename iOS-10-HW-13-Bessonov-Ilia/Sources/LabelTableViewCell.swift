//
//  LabelTableViewCell.swift
//  iOS-10-HW-13-Bessonov-Ilia
//
//  Created by i0240 on 25.06.2023.
//

import UIKit

class LabelTableViewCell: UITableViewCell {

    var settings: Settings? {
        didSet {
            iconImageView.image = settings?.icon
            nameLabel.text = settings?.name
            iconImageView.backgroundColor = settings?.background
            accessoryType = .disclosureIndicator
        }
    }

    // MARK: - Outlets

    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()

    private lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Off"
        label.textColor = .black
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .right
        label.numberOfLines = 1
        return label
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
        self.settings = nil
    }

    // MARK: - Setup

    private func setupHierarchy() {
        contentView.addSubviews([iconImageView, nameLabel, detailLabel])
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 19),
            iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 27),
            iconImageView.heightAnchor.constraint(equalToConstant: 27),

            nameLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 15),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            detailLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            detailLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
