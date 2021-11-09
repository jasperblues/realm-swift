////////////////////////////////////////////////////////////////////////////
//
// Copyright 2021 Realm Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
////////////////////////////////////////////////////////////////////////////

#import "RLMSubscription.h"

// TODO: Flexible Sync - Add docstrings

@implementation RLMSubscriptionTask

@end

@implementation RLMSubscription

- (instancetype)initWithName:(nullable NSString *)name
                   predicate:(NSPredicate *)predicate {
    // TODO: Flexible Sync - Add initialiser implementation
    [NSException raise:@"NotImplemented" format:@"Needs Impmentation"];
    return NULL;
}

- (void)updateSubscriptionWithPredicate:(NSPredicate *)predicate
                                  error:(NSError **)error {
    [NSException raise:@"NotImplemented" format:@"Needs Impmentation"];
}

@end
