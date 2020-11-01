//
//  MailClient.swift
//  MailPresenter
//
//  Created by Thành Đỗ Long on 01.11.2020.
//

import Foundation

public struct MailClient {

    public let name: String
    public let URLScheme: String

    public init(name: String, URLScheme: String) {
        self.name = name
        self.URLScheme = URLScheme
    }

    public static func clients() -> [MailClient] {
        return [
            MailClient(name: "Mail",
                       URLScheme: "message"),

            MailClient(name: "Sparrow",
                       URLScheme: "sparrow"),

            MailClient(name: "Gmail",
                       URLScheme: "googlegmail"),

            MailClient(name: "Dispatch",
                       URLScheme: "x-dispatch"),

            MailClient(name: "Spark",
                       URLScheme: "readdle-spark"),

            MailClient(name: "Airmail",
                       URLScheme: "airmail"),

            MailClient(name: "Microsoft Outlook",
                       URLScheme: "ms-outlook"),

            MailClient(name: "Yahoo Mail",
                       URLScheme: "ymail"),

            MailClient(name: "Fastmail",
                       URLScheme: "fastmail")
        ]
    }

    public func openURL() -> URL {
        var components = URLComponents()
        components.scheme = URLScheme
        return components.url!
    }
}
