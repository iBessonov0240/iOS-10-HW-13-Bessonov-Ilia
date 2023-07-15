//
//  ViewController.swift
//  iOS-10-HW-13-Bessonov-Ilia
//
//  Created by i0240 on 25.06.2023.
//

import UIKit

class ViewController: UIViewController {

    private var model: SettingsModel?

    // MARK: - Outlets

    private lazy var settingsView: SettingsView = {
        let settingsView = SettingsView(model: model)
        settingsView.delegate = self
        settingsView.translatesAutoresizingMaskIntoConstraints = false
        return settingsView
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setup

    private func setupNavigationBar() {
        view.backgroundColor = .white
        title = "Settings"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func setupHierarchy() {
        view.addSubview(settingsView)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            settingsView.topAnchor.constraint(equalTo: view.topAnchor),
            settingsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            settingsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            settingsView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ViewController: SettingsViewDelegate {
    func routeToDetails(with settings: SettingsModel) {
        let viewController = DetailViewController()
        viewController.settings = settings
        navigationController?.pushViewController(viewController, animated: true)
    }
}
