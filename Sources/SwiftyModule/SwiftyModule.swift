//
//  SwiftyModule.swift
//  SwiftyModule
//
//  Created by Tibor Bödecs on 2020. 06. 17..
//

import FeatherCore

final class SwiftyModule: ViperModule {

    static var name: String = "swifty"
    
    static var bundleUrl: URL? {
        Bundle.module.resourceURL?.appendingPathComponent("Bundle")
    }
    
    func boot(_ app: Application) throws {
        app.hooks.register("content-filters", use: contentFiltersHook)
        
        app.hooks.register("leaf-frontend-css", use: leafFrontendCssHook)
    }

    // MARK: - hooks
    
    func contentFiltersHook(args: HookArguments) -> [ContentFilter] {
        [SwiftyFilter()]
    }
    
    func leafFrontendCssHook(args: HookArguments) -> TemplateDataRepresentable {
        [
            "name": "swifty",
        ]
    }
}
