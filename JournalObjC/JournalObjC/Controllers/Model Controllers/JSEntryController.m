//
//  JSEntryController.m
//  JournalObjC
//
//  Created by Josh Sparks on 10/7/19.
//  Copyright © 2019 Josh Sparks. All rights reserved.
//

#import "JSEntryController.h"

static NSString * const EntriesKey = @"entries";

@interface JSEntryController ()

@property (nonatomic, readwrite)NSMutableArray * entries;

@end

@implementation JSEntryController

+ (JSEntryController *)sharedController {
    static JSEntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [JSEntryController new];
        [sharedInstance loadFromPersistentStorage];
    });
    return sharedInstance;
}

- (void)addEntry:(JSEntry *)entry
{
    [self.entries addObject:entry];
}

- (void)removeEntry:(JSEntry *)entry
{
    [self.entries removeObject: entry];
}


-(void)saveToPersistentStorage
{
    NSMutableArray *entryDictionaries = [[NSMutableArray alloc] init];
    
    for (JSEntry *entry in self.entries)
    {
        [entryDictionaries addObject:entry.dictionaryRepresentation];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:EntriesKey];
}

-(void)loadFromPersistentStorage
{
    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:EntriesKey];
    for (NSDictionary *dictionary in entryDictionaries) {
        JSEntry *entry = [[JSEntry alloc] initWithDictionary:dictionary];
        [self addEntry:entry];
    }
}

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        _entries = [NSMutableArray array];
    }
    return self;
}

@end
