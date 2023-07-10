//
//  SimpleTableViewCell.swift
//  iOS-10-HW-13-Bessonov-Ilia
//
//  Created by i0240 on 26.06.2023.
//

import UIKit

class SimpleTableViewCell: UITableViewCell {

    var settings: Settings? {
        didSet {
            iconImageView.image = settings?.icon
            nameLabel.text = settings?.name
            conteinerView.backgroundColor = settings?.background
            accessoryType = .disclosureIndicator
        }
    }

    // MARK: - Outlets

    private lazy var conteinerView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
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
        contentView.addSubviews([conteinerView, iconImageView, nameLabel])
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            conteinerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 19),
            conteinerView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            conteinerView.widthAnchor.constraint(equalToConstant: 27),
            conteinerView.heightAnchor.constraint(equalToConstant: 27),

            iconImageView.topAnchor.constraint(equalTo: conteinerView.topAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor),
            iconImageView.trailingAnchor.constraint(equalTo: conteinerView.trailingAnchor),
            iconImageView.bottomAnchor.constraint(equalTo: conteinerView.bottomAnchor),

            nameLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 15),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
}
