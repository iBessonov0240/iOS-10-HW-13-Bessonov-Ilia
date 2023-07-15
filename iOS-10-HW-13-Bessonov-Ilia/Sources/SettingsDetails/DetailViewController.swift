//
//  DetailViewController.swift
//  iOS-10-HW-13-Bessonov-Ilia
//
//  Created by i0240 on 26.06.2023.
//

import UIKit

class DetailViewController: UIViewController {

    var settings: SettingsModel?

    // MARK: - Outlets

    private lazy var iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.tintColor = .white
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var name: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.textAlignment = .center
        label.numberOfLines = 5
        return label
    }()


    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupHierarchy()
        setupLayout()
        fillSettings()
    }

    // MARK: - Setup

    private func setupHierarchy() {
        view.addSubview(iconImage)
        view.addSubview(name)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            iconImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iconImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            iconImage.widthAnchor.constraint(equalToConstant: 50),
            iconImage.heightAnchor.constraint(equalToConstant: 50),

            name.topAnchor.constraint(equalTo: iconImage.bottomAnchor, constant: 15),
            name.centerXAnchor.constraint(equalTo: iconImage.centerXAnchor),
            name.heightAnchor.constraint(equalToConstant: 25),
        ])
    }

    private func fillSettings() {
        iconImage.image = settings?.icon
        iconImage.backgroundColor = settings?.background
        name.text = settings?.name
    }
}
