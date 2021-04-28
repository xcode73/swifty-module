//
//  SwiftyBuilder.swift
//  SwiftyModule
//
//  Created by Tibor Bodecs on 2020. 08. 23..
//

import FeatherCore

@_cdecl("createSwiftyModule")
public func createSwiftyModule() -> UnsafeMutableRawPointer {
    return Unmanaged.passRetained(SwiftyBuilder()).toOpaque()
}

public final class SwiftyBuilder: FeatherModuleBuilder {

    public override func build() -> FeatherModule {
        SwiftyModule()
    }
}
