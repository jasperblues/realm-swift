////////////////////////////////////////////////////////////////////////////////
//
//  SYMBIOSE
//  Copyright 2020 Symbiose Inc
//  All Rights Reserved.
//
//  NOTICE: This software is proprietary information.
//  Unauthorized use is prohibited.
//
////////////////////////////////////////////////////////////////////////////////

import Foundation

public class Ownable<T: ThreadConfined> {

    private(set) var realm: Realm?
    private(set) var threadConfined: ThreadSafeReference<T>?
    private(set) var unmanaged: T?

    public convenience init(item: T) {
        if let realm = item.realm {
            let wrappedObj = ThreadSafeReference(to: item)
            self.init(threadConfined: wrappedObj, unmanaged: nil, realm: realm)
        } else {
            self.init(threadConfined: nil, unmanaged: item, realm: nil)
        }
    }

    public init(threadConfined: ThreadSafeReference<T>?, unmanaged: T?, realm: Realm?) {
        self.threadConfined = threadConfined
        self.unmanaged = unmanaged
        self.realm = realm
    }

    public func take() throws -> T {
        if let threadConfined = threadConfined, let realm = realm {
            if let result = try realm.resolve(threadConfined) {
                return result
            } else {
                throw RealmError("Object was deleted in another thread!!")
            }
        } else if let unmanaged = unmanaged {
            return unmanaged
        } else {
            throw RealmError("Require either a realm bound or managed object")
        }
    }
}
