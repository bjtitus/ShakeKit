//
//  SKComment.m
//  MilkShaker
//
//  Created by Brandon Titus on 10/19/13.
//  Copyright (c) 2013 Joseph Ridenour. All rights reserved.
//

#import "SKComment.h"
#import "SKUser.h"

@implementation SKComment

static NSString * const kBody = @"body";
static NSString * const kPostDate = @"posted_at";

@synthesize body;
@synthesize user;
@synthesize postDate;

- (id)initWithDictionary:(NSDictionary *)theDictionary
{
    if ((self = [super init]))
    {
        body = [[theDictionary objectForKey:kBody] copy];
        user = [[SKUser alloc] initWithDictionary:[theDictionary objectForKey:@"user"]];
        postDate = [[theDictionary objectForKey:kPostDate] copy];
    }
    
    return self;
};

#pragma mark -
#pragma mark Memory Management
// +--------------------------------------------------------------------
// | Memory Management
// +--------------------------------------------------------------------

- (void)dealloc
{
    SGRelease(body);
    SGRelease(user);
    SGRelease(postDate);
    
    [super dealloc];
}

@end
