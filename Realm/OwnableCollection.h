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

#import <Foundation/Foundation.h>

@class RLMRealm;
@class RLMThreadSafeReference;
@protocol RLMThreadConfined;
@protocol RLMCollection;

@interface OwnableCollection<__covariant Confined : id <RLMThreadConfined>> : NSObject

@property(nonatomic, strong, readonly) RLMThreadSafeReference *__nonnull threadConfined;
@property(nonatomic, strong, readonly) RLMRealm *__nonnull realm;

- (instancetype)initWithItems:(id<RLMCollection>)items;

- (instancetype)initWithThreadConfined:(RLMThreadSafeReference *)threadConfined realm:(RLMRealm *)realm;

- (__nonnull Confined)take;

@end