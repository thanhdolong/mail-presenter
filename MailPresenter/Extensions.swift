//
//  UIViewController+Extensions.swift
//  MailPresenter
//
//  Created by Thành Đỗ Long on 01.11.2020.
//

import UIKit

// MARK: - Alert Extensions

extension UIViewController {
    func presentAlertAction(withTitle title: String? = nil,
                            message: String? = nil,
                            alertActions: [UIAlertAction]? = nil,
                            handler: ((UIAlertAction) -> Void)? = nil,
                            preferredStyle: UIAlertController.Style = .alert) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)

        if let alertActions = alertActions {
            for action in alertActions {
                alertController.addAction(action)
            }
        } else {
            let action = UIAlertAction(title: "OK", style: .default, handler: handler)
            alertController.addAction(action)
        }

        alertController.pruneNegativeWidthConstraints()
        DispatchQueue.main.async { [weak self] in
            self?.present(alertController, animated: true, completion: nil )
        }
    }

    // Swift default AlertViewController breaking constraints
    // https://stackoverflow.com/a/58666480
    func pruneNegativeWidthConstraints() {
        for subView in self.view.subviews {
            for constraint in subView.constraints where constraint.debugDescription.contains("width == - 16") {
                subView.removeConstraint(constraint)
            }
        }
    }
}

public extension String {
    func localized(_ bundle: Bundle = .main) -> String {
        bundle.localize(self)
    }
    var localized: String {
        return localized()
    }
}

extension Bundle {
    static var UIKit: Bundle {
        Self(for: UIApplication.self)
    }
    func localize(_ key: String, table: String? = nil) -> String {
        self.localizedString(forKey: key, value: nil, table: nil)
    }
    var localizableStrings: [String: String]? {
        guard let fileURL = url(forResource: "Localizable", withExtension: "strings") else {
            return nil
        }
        do {
            let data = try Data(contentsOf: fileURL)
            let plist = try PropertyListSerialization.propertyList(from: data, format: .none)
            return plist as? [String: String]
        } catch {
            print(error)
        }
        return nil
    }
}
