//
//  SettingsView.swift
//  iOS-10-HW-13-Bessonov-Ilia
//
//  Created by i0240 on 10.07.2023.
//

import UIKit

class SettingsView: UIView {

    // MARK: - Properties

    private var model: SettingsModel?
    lazy var delegate: SettingsViewDelegate? = nil

    // MARK: - Outlets

    private lazy var settingsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: - Initial

    init(model: SettingsModel?) {
        self.model = model
        super.init(frame: .zero)
        commonInit()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func commonInit() {
        registerCells()
        setupHierarchy()
        setupLayout()
        settingsTableView.reloadData()
    }

    // MARK: - Setup

    private func registerCells() {
        settingsTableView.register(SimpleTableViewCell.self, forCellReuseIdentifier: "cell")
        settingsTableView.register(InfoIDTableViewCell.self, forCellReuseIdentifier: "infoIDCell")
        settingsTableView.register(SwitchButtonTableViewCell.self, forCellReuseIdentifier: "switchCell")
        settingsTableView.register(LabelTableViewCell.self, forCellReuseIdentifier: "labelCell")
        settingsTableView.register(ImageTableViewCell.self, forCellReuseIdentifier: "imageCell")
        settingsTableView.register(HeaderView.self, forHeaderFooterViewReuseIdentifier: "header")
    }

    private func setupHierarchy() {
        addSubview(settingsTableView)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            settingsTableView.topAnchor.constraint(equalTo: topAnchor),
            settingsTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            settingsTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            settingsTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

// MARK: - UITableViewDataSource

extension SettingsView: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return SettingsModel.settings.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingsModel.settings[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let item = SettingsModel.settings[indexPath.section][indexPath.row]

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
        let item = SettingsModel.settings[indexPath.section][indexPath.row]

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
        return section == 0 ? 15 : 30
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let settings = SettingsModel.settings[indexPath.section][indexPath.row]
        print("Нажата ячейка \(settings.name)")
        delegate?.routeToDetails(with: settings)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

 // MARK: - SettingsViewDelegate

protocol SettingsViewDelegate {
    func routeToDetails(with settings: SettingsModel)
}

