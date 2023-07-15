//
//  InfoIDTableViewCell.swift
//  iOS-10-HW-13-Bessonov-Ilia
//
//  Created by i0240 on 25.06.2023.
//

import UIKit

class InfoIDTableViewCell: UITableViewCell {

    var settings: SettingsModel? {
        didSet {
            nameLabel.text = settings?.name
            nameInImageLabel.text = "I0"
            detailLabel.text = "Apple ID, iCloud, Media & Purchases"
            iconImageView.image = settings?.icon
            iconImageView.tintColor = settings?.background
            accessoryType = .disclosureIndicator
        }
    }

    // MARK: - Outlets

    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 30
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private lazy var nameInImageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.textColor = .black
        label.font = .systemFont(ofSize: 26, weight: .regular)
        label.textAlignment = .center
        label.numberOfLines = 5
        return label
    }()

    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fill
        stack.spacing = 2
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(nameLabel)
        stack.addArrangedSubview(detailLabel)
        return stack
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.textColor = .black
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()

    private lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.textColor = .black
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.font = .systemFont(ofSize: 12, weight: .regular)
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
        contentView.addSubview(iconImageView)
        contentView.addSubview(nameInImageLabel)
        contentView.addSubview(stack)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 80),
            iconImageView.heightAnchor.constraint(equalToConstant: 80),

            nameInImageLabel.centerXAnchor.constraint(equalTo: iconImageView.centerXAnchor),
            nameInImageLabel.centerYAnchor.constraint(equalTo: iconImageView.centerYAnchor),

            stack.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 15),
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
