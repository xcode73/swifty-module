//
//  SwiftyModule.swift
//  SwiftyModule
//
//  Created by Tibor Bödecs on 2020. 06. 17..
//

import FeatherCore

final class SwiftyModule: FeatherModule {

    static let moduleKey: String = "swifty"
    
    static var bundleUrl: URL? { Bundle.module.resourceURL?.appendingPathComponent("Bundle") }
    
    func boot(_ app: Application) throws {
        app.hooks.register(.contentFilters, use: contentFiltersHook)
        app.hooks.register(.frontendCss, use: frontendCssHook)
    }

    // MARK: - hooks
    
    func contentFiltersHook(args: HookArguments) -> [ContentFilter] {
        [SwiftyFilter()]
    }

    func frontendCssHook(args: HookArguments) -> [OrderedTemplateData] {
        [
            .init("swifty"),
        ]
    }

}
