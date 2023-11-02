//
//  SettingViewController.swift
//  GBShop_Homan
//
//  Created by aaa on 18/09/2023.
//

import UIKit

class SettingViewController: UIViewController {
    // MARK: - Properties
    let requestFactory = RequestFactory()
    var settingOption: SettingProperties
    /// Setting properties
let updateCatalogLabel = SettingProperties.notificationUpdateCatalog.itemLabel
    let appearanceSaveGoodsLabel = SettingProperties.notificationAppearanceSaveGoods.itemLabel
    let discountLabel =  SettingProperties.notificationDiscount.itemLabel
    // MARK: - UI components
    private let titleLabel = BaseLabelView(text: "Настройки", size: 24, weight: .bold)
    private let lineView = BaseLineView()
    private let settingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    private let notificationUpdateCatalogSwitch = UISwitch()
    private let notificationAppearanceSaveGoodsSwitch = UISwitch()
    private let notificationDiscountSwitch = UISwitch()
    private let changeProfileButton = BaseButtonView(title: "Изменить профиль", size: 20)
    private let quitProfileButton = BaseButtonView(title: "Выйти из профиля", size: 20)
    // MARK: - save notification
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
    // MARK: - Lifecycle
    init(settingOption: SettingProperties = .notificationDiscount) {
        self.settingOption = settingOption
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor
        setupViews()
        setupConstraints()
        setupActions()
    }
    // MARK: - Setup actions
    private func setupActions() {
        changeProfileButton.addTarget(self, action: #selector(changeProfileButtonTapped), for: .touchUpInside)
        quitProfileButton.addTarget(self, action: #selector(quitProfileButtonTapped), for: .touchUpInside)
    }
    // MARK: - Setup subviews
    private func setupViews() {
        view.addSubview(titleLabel)
        view.addSubview(lineView)
        lineView.addShadow()
        view.addSubview(settingStackView)
        settingStackView.addShadow()
        view.addSubview(changeProfileButton)
        view.addSubview(quitProfileButton)
        changeProfileButton.translatesAutoresizingMaskIntoConstraints = false
        quitProfileButton.translatesAutoresizingMaskIntoConstraints = false
        settingStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    // MARK: - Setup constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // titleLabel
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            // lineView
            lineView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 1),
            lineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 6),
            lineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -6),
            lineView.heightAnchor.constraint(equalToConstant: 1),
            // settingStackView
            settingStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            settingStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            settingStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            // change profile Button
            changeProfileButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            changeProfileButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            changeProfileButton.bottomAnchor.constraint(equalTo: quitProfileButton.topAnchor, constant: -8),
            // quit profile button
            quitProfileButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            quitProfileButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            quitProfileButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
        addSettingCell(labelText: updateCatalogLabel, switchValue: notificationUpdateCatalogIsOn, switchAction: #selector(notificationUpdateCatalogSwitchChanged))
        addSettingCell(labelText: appearanceSaveGoodsLabel, switchValue: notificationAppearanceSaveGoodsIsOn, switchAction: #selector(notificationAppearanceSaveGoodsSwitchChanged))
        addSettingCell(labelText: discountLabel, switchValue: notificationDiscountIsOn, switchAction: #selector(notificationDiscountSwitchChanged))
    }
    private func addSettingCell(labelText: String,
                                switchValue: Bool,
                                switchAction: Selector) {
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
    // MARK: - Actions
    @objc private func notificationUpdateCatalogSwitchChanged() {
        notificationUpdateCatalogIsOn = notificationUpdateCatalogSwitch.isOn
    }
    @objc private func notificationAppearanceSaveGoodsSwitchChanged() {
        notificationAppearanceSaveGoodsIsOn = notificationAppearanceSaveGoodsSwitch.isOn
    }
    @objc private func notificationDiscountSwitchChanged() {
        notificationDiscountIsOn = notificationDiscountSwitch.isOn
    }
    @objc private func changeProfileButtonTapped() {
        let registerViewController = ChangeProfileController()
        registerViewController.modalPresentationStyle = .formSheet
        self.present(registerViewController, animated: true, completion: nil)
    }
    @objc private func quitProfileButtonTapped() {
        let logout = requestFactory.makeLogoutRequest()
        logout.logout { result in
            switch result {
            case .success:
                LocalStorageManager.shared.clearPairOfTokens()
                self.showSuccessAlert()
            case .failure(let error):
                print(error)
            }
        }
    }
    // MARK: - Allerts
    private func showSuccessAlert() {
        let alert = Alerts()
        alert.showSuccessLogoutAlert(presenter: self)
    }
}
