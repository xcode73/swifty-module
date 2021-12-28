//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2021. 12. 21..
//

@_exported import FeatherCore

struct SwiftyModule: FeatherModule {
    
    func boot(_ app: Application) throws {
        app.hooks.register(.filters, use: filtersHook)
        app.hooks.register(.webCss, use: webCssHook)
    }

    func webCssHook(args: HookArguments) -> [OrderedHookResult<String>] {
        [
            .init("/css/swifty/swifty.css", order: 420)
        ]
    }
    
    func filtersHook(args: HookArguments) -> [FeatherFilter] {
        [
            SwiftyFilter()
        ]
    }
    
}
