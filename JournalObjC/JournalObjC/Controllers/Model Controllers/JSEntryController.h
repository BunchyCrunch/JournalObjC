//
//  JSEntryController.h
//  JournalObjC
//
//  Created by Josh Sparks on 10/7/19.
//  Copyright © 2019 Josh Sparks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSEntry.h"

NS_ASSUME_NONNULL_BEGIN

@interface JSEntryController : NSObject

@property (nonatomic, strong, readonly) NSMutableArray * entries;

+ (JSEntryController *)sharedController;

- (void)addEntry:(JSEntry *)entry;
- (void)removeEntry:(JSEntry *)entry;

-(void)saveToPersistentStorage;
@end

NS_ASSUME_NONNULL_END
