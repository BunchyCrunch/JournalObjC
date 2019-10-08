//
//  JSEntry.m
//  JournalObjC
//
//  Created by Josh Sparks on 10/7/19.
//  Copyright © 2019 Josh Sparks. All rights reserved.
//

#import "JSEntry.h"


static NSString * const TitleKey = @"title";
static NSString * const TextKey = @"text";
static NSString * const TimeStampKey = @"timestamp";

@implementation JSEntry


- (instancetype)initWithEntry:(NSString *)title bodyText:(NSString *)bodyText timeStamp:(NSDate *)timeStamp
{
    self = [super init];
    if (self) {
        _title = title;
        _bodyText = bodyText;
        _timeStamp = timeStamp;
    }
    return self;
}

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *title = dictionary[TitleKey];
    NSString *text = dictionary[TextKey];
    NSDate *timeStamp = dictionary[TimeStampKey];
    return [self initWithEntry:title bodyText:text timeStamp:timeStamp];
}

- (NSDictionary *)dictionaryRepresentation
{
    return @{TitleKey: self.title,
             TextKey: self.bodyText,
             TimeStampKey: self.timeStamp};
}

- (BOOL)isEqual:(id)object
{
    if (![object isKindOfClass:[JSEntry class]]) { return NO; }
    return [[self dictionaryRepresentation] isEqualToDictionary:[(JSEntry *)object dictionaryRepresentation]];
}

@end
