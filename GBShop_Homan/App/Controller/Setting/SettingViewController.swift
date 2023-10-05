//
//  SettingViewController.swift
//  GBShop_Homan
//
//  Created by aaa on 18/09/2023.
//

import UIKit

class SettingViewController: UIViewController {
    // Модель опций
    var settingOption: SettingProperties

    private var notificationUpdateCatalogIsOn: Bool {
        get {
            UserDefaults.standard.bool(forKey: "notificationUpdateCatalog")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "notificationUpdateCatalog")
        }
    }
    private var notificationAppearanceSaveGoodsIsOn: Bool {
        get {
            UserDefaults.standard.bool(forKey: "notificationAppearanceSaveGoods")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "notificationAppearanceSaveGoods")
        }
    }
    private var notificationDiscountIsOn: Bool {
        get {
            UserDefaults.standard.bool(forKey: "notificationDiscount")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "notificationDiscount")
        }
    }
    private let notificationUpdateCatalogSwitch: UISwitch = {
        let uiSwitch = UISwitch()
        return uiSwitch
    }()
    private let notificationAppearanceSaveGoodsSwitch: UISwitch = {
        let uiSwitch = UISwitch()
        return uiSwitch
    }()
    private let notificationDiscountSwitch: UISwitch = {
        let uiSwitch = UISwitch()
        return uiSwitch
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Настройки"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    private let settingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    init(settingOption: SettingProperties = .notificationDiscount) {
        self.settingOption = settingOption
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9660630822, green: 0.6466907859, blue: 0.6625785232, alpha: 1)
        setupUI()
    }
    private func setupUI() {
        view.addSubview(titleLabel)
        view.addSubview(settingStackView)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        settingStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),

            settingStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            settingStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            settingStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])

        // Добавьте ячейки с кнопками Switch и названиями itemLabel
        addSettingCell(labelText: SettingProperties.notificationUpdateCatalog.itemLabel, switchValue: notificationUpdateCatalogIsOn, switchAction: #selector(notificationUpdateCatalogSwitchChanged))
        addSettingCell(labelText: SettingProperties.notificationAppearanceSaveGoods.itemLabel, switchValue: notificationAppearanceSaveGoodsIsOn, switchAction: #selector(notificationAppearanceSaveGoodsSwitchChanged))
        addSettingCell(labelText: SettingProperties.notificationDiscount.itemLabel, switchValue: notificationDiscountIsOn, switchAction: #selector(notificationDiscountSwitchChanged))
    }

    private func addSettingCell(labelText: String, switchValue: Bool, switchAction: Selector) {
        let cellStackView = UIStackView()
        cellStackView.axis = .horizontal
        cellStackView.spacing = 16

        let label = UILabel()
        label.text = labelText
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)

        let switchView = UISwitch()
        switchView.isOn = switchValue
        switchView.addTarget(self, action: switchAction, for: .valueChanged)

        cellStackView.addArrangedSubview(label)
        cellStackView.addArrangedSubview(switchView)

        settingStackView.addArrangedSubview(cellStackView)
    }
    @objc private func notificationUpdateCatalogSwitchChanged() {
        notificationUpdateCatalogIsOn = notificationUpdateCatalogSwitch.isOn
    }
    @objc private func notificationAppearanceSaveGoodsSwitchChanged() {
        notificationAppearanceSaveGoodsIsOn = notificationAppearanceSaveGoodsSwitch.isOn
    }
    @objc private func notificationDiscountSwitchChanged() {
        notificationDiscountIsOn = notificationDiscountSwitch.isOn
    }
}
