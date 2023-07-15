//
//  HeaderView.swift
//  iOS-10-HW-13-Bessonov-Ilia
//
//  Created by i0240 on 26.06.2023.
//

import UIKit

class HeaderView: UITableViewHeaderFooterView {

    // MARK: - Outlets

    private lazy var separateView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray6
        return view
    }()

    // MARK: - Initializers

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setupHierarchy() {
        contentView.addSubview(separateView)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            separateView.topAnchor.constraint(equalTo: contentView.topAnchor),
            separateView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            separateView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            separateView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
