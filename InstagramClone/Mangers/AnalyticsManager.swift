//
//  AnalyticsManager.swift
//  InstagramClone
//
//  Created by Desanka MIlakovic on 16.4.21..
//

import Foundation
import FirebaseAnalytics

final class AnaliticsManager {
    static let shared = AnaliticsManager()
    private init() {}
    
    func logEvent() {
        Analytics.logEvent("", parameters: [:])
    }
}
