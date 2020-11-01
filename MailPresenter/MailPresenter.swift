//
//  MailPresenter.swift
//  MailPresenter
//
//  Created by Thành Đỗ Long on 01.11.2020.
//

import UIKit

open class MailPresenter {
    private let application: UIApplication
    private let mailClients: [MailClient]

    public init(_ application: UIApplication = UIApplication.shared,
                mailClients: [MailClient] = MailClient.clients()) {
        self.application = application
        self.mailClients = mailClients
    }

    open var allAvailableEmailClients: [MailClient] {
        MailClient.clients().filter({ application(isMailClientAvailable: $0) })
    }

    open func application(isMailClientAvailable client: MailClient) -> Bool {
        var components = URLComponents()
        components.scheme = client.URLScheme

        guard let URL = components.url
        else { return false }

        return application.canOpenURL(URL)
    }

    open func showListOfAllAvailableEmailClients(for viewController: UIViewController) {
        guard let firstEmailClient = allAvailableEmailClients.first?.openURL() else { return }

        switch allAvailableEmailClients.count {
        case 1:
            UIApplication.shared.open(firstEmailClient, options: [:], completionHandler: nil)
        default:
            let alertActions = allAvailableEmailClients.map { email  in
                UIAlertAction(title: email.name,
                              style: .default) { _ in
                    UIApplication.shared.open(email.openURL(), options: [:], completionHandler: nil)
                }
            }

            let cancelAction = UIAlertAction(title: "Cancel".localized(.UIKit),
                                             style: .cancel)

            viewController.presentAlertAction(alertActions: alertActions + [cancelAction],
                                              preferredStyle: .actionSheet)
        }
    }
}
