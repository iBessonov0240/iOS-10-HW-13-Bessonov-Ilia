//
//  ImageTableViewCell.swift
//  iOS-10-HW-13-Bessonov-Ilia
//
//  Created by i0240 on 25.06.2023.
//

import UIKit

class ImageTableViewCell: SimpleTableViewCell {

    // MARK: - Outlets

    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "")
        imageView.backgroundColor = .systemRed
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private lazy var numberInImageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1"
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textAlignment = .center
        label.numberOfLines = 5
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
        contentView.addSubviews([iconImageView, numberInImageLabel])
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            iconImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: 24),
            iconImageView.widthAnchor.constraint(equalToConstant: 24),

            numberInImageLabel.centerXAnchor.constraint(equalTo: iconImageView.centerXAnchor),
            numberInImageLabel.centerYAnchor.constraint(equalTo: iconImageView.centerYAnchor)
        ])
    }
}
