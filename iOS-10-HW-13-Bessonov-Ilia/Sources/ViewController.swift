//
//  ViewController.swift
//  iOS-10-HW-13-Bessonov-Ilia
//
//  Created by i0240 on 25.06.2023.
//

import UIKit

class ViewController: UIViewController {

    private var settings: [[Settings]]?

    // MARK: - Outlets

    private lazy var settingsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(SimpleTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(InfoIDTableViewCell.self, forCellReuseIdentifier: "infoIDCell")
        tableView.register(SwitchButtonTableViewCell.self, forCellReuseIdentifier: "switchCell")
        tableView.register(LabelTableViewCell.self, forCellReuseIdentifier: "labelCell")
        tableView.register(ImageTableViewCell.self, forCellReuseIdentifier: "imageCell")
        tableView.register(HeaderView.self, forHeaderFooterViewReuseIdentifier: "header")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()


    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Settings"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setup

    private func setupHierarchy() {
        view.addSubview(settingsTableView)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            settingsTableView.topAnchor.constraint(equalTo: view.topAnchor),
            settingsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            settingsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            settingsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    // MARK: - Actions

}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return Settings.settings.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Settings.settings[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let item = Settings.settings[indexPath.section][indexPath.row]

        switch(item.type) {
        case .infoID:
            let cell = tableView.dequeueReusableCell(withIdentifier: "infoIDCell", for: indexPath) as! InfoIDTableViewCell
            cell.settings = item
            return cell
        case .switchButton:
            let cell = tableView.dequeueReusableCell(withIdentifier: "switchCell", for: indexPath) as! SwitchButtonTableViewCell
            cell.settings = item
            return cell
        case .label:
            let cell = tableView.dequeueReusableCell(withIdentifier: "labelCell", for: indexPath) as! LabelTableViewCell
            cell.settings = item
            return cell
        case .image:
            let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as! ImageTableViewCell
            cell.settings = item
            return cell
        case .none:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SimpleTableViewCell
            cell.settings = item
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = Settings.settings[indexPath.section][indexPath.row]

        switch item.type {
        case .infoID:
            return 80
        default:
            return 50
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as! HeaderView
        return header
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 15
        default:
            return 30
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Нажата ячейка \(Settings.settings[indexPath.section][indexPath.row].name)")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
