//
//  SwiftyModule.swift
//  SwiftyModule
//
//  Created by Tibor Bödecs on 2020. 06. 17..
//

import FeatherCore

final class SwiftyModule: FeatherModule {

    static let moduleKey: String = "swifty"
    
    var bundleUrl: URL? {
        Bundle.module.resourceURL?.appendingPathComponent("Bundle")
    }
    
    func boot(_ app: Application) throws {
        app.hooks.register(.contentFilters, use: contentFiltersHook)
        
//        app.hooks.register("leaf-frontend-css", use: leafFrontendCssHook)
    }

    // MARK: - hooks
    
    func contentFiltersHook(args: HookArguments) -> [ContentFilter] {
        [SwiftyFilter()]
    }

//    func leafFrontendCssHook(args: HookArguments) -> TemplateDataRepresentable {
//        [
//            "name": "swifty",
//        ]
//    }
}
