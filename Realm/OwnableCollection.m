////////////////////////////////////////////////////////////////////////////////
//
//  SYMBIOSE
//  Copyright 2022 Symbiose Inc
//  All Rights Reserved.
//
//  NOTICE: This software is proprietary information.
//  Unauthorized use is prohibited.
//
////////////////////////////////////////////////////////////////////////////////

#import "RLMRealm.h"
#import "RLMThreadSafeReference.h"
#import "RLMCollection.h"
#import "OwnableCollection.h"
#import "RLMThreadSafeReference.h"


@implementation OwnableCollection

- (instancetype)initWithItems:(id<RLMCollection>)items {
    if (items.realm != nil) {
        id reference = [RLMThreadSafeReference referenceWithThreadConfined:items];
        return [self initWithThreadConfined:reference realm:items.realm];
    } else {
        [NSException raise:NSInternalInconsistencyException format:@"Item realm can't be nil"];
        return nil;
    }
}

- (instancetype)initWithThreadConfined:(RLMThreadSafeReference *)threadConfined realm:(RLMRealm *)realm {
    self = [super init];
    if (self) {
        _threadConfined = threadConfined;
        _realm = realm;
    }
    return self;
}

- (id)take {
    id result = [_realm resolveThreadSafeReference:_threadConfined];
    if (result) {
        return result;
    } else {
        [NSException raise:NSInternalInconsistencyException format:@"Object was deleted in another thread"];
        return nil;
    }
}


@end