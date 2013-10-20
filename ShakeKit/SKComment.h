//
//  SKComment.h
//  MilkShaker
//
//  Created by Brandon Titus on 10/19/13.
//  Copyright (c) 2013 Joseph Ridenour. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SKUser;

@interface SKComment : NSObject

@property (copy) NSString *body;
@property (retain) SKUser *user;
@property (retain) NSDate *postDate;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
