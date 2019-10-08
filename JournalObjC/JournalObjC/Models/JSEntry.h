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
@property (nonatomic, copy, readonly) NSDate * timeStamp;
@property (nonatomic, copy, readonly) NSString * title;
@property (nonatomic, copy, readonly) NSString * bodyText;

- (instancetype)initWithEntry: (NSString *) title
                     bodyText: (NSString *) bodyText
                    timeStamp: (NSDate *) timeStamp;


@end

NS_ASSUME_NONNULL_END
