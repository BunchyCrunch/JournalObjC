//
//  JSEntryController.m
//  JournalObjC
//
//  Created by Josh Sparks on 10/7/19.
//  Copyright © 2019 Josh Sparks. All rights reserved.
//

#import "JSEntryController.h"

@interface JSEntryController ()

@property (nonatomic, strong)NSMutableArray * internalEntries;

@end

@implementation JSEntryController

- (NSArray *)entries { return self.internalEntries; }

- (void)addEntry:(JSEntry *)entry
{
    [self.internalEntries addObject:entry];
}

- (void)removeEntry:(JSEntry *)entry
{
    [self.internalEntries removeObject: entry];
}

+ (JSEntryController *)sharedController {
    static JSEntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [JSEntryController new];
    });
    return sharedInstance;
}

@end
