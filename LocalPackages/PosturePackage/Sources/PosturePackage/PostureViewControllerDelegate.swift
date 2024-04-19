//
//  PostureViewControllerDelegate.swift
//  PosturePackage
//

import Foundation

public protocol PostureViewControllerDelegate: AnyObject {
    // MARK: - Methods

    @MainActor func postureViewControllerStartButtonDidTapped(viewController: PostureViewController)
    @MainActor func postureViewControllerSettingsButtonDidTapped(viewController: PostureViewController)
}
