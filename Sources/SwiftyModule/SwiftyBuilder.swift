//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2021. 12. 27..
//

@_cdecl("createSwiftyModule")
public func createSwiftyModule() -> UnsafeMutableRawPointer {
    return Unmanaged.passRetained(SwiftyBuilder()).toOpaque()
}

public final class SwiftyBuilder: FeatherModuleBuilder {

    public override func build() -> FeatherModule {
        SwiftyModule()
    }
}
