//
//  JSEntry.h
//  JournalObjC
//
//  Created by Josh Sparks on 10/7/19.
//  Copyright © 2019 Josh Sparks. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JSEntry : NSObject
@property (nonatomic, strong) NSDate * timeStamp;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * bodyText;

- (instancetype)initWithEntry: (NSString *) title
                     bodyText: (NSString *) bodyText
                    timeStamp: (NSDate *) timeStamp;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
-(NSDictionary *)dictionaryRepresentation;

@end

NS_ASSUME_NONNULL_END
