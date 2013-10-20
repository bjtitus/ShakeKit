//
//  SKUser.m
//  ShakeKit
//
//  Created by Justin Williams on 5/28/11.
//  Copyright 2011 Second Gear. All rights reserved.
//

#import "SKUser.h"
#import "SKShake.h"

static NSString * const kUserID = @"id";
static NSString * const kUserName = @"name";
static NSString * const kAbout = @"about";
static NSString * const kUserProfileImageURL = @"profile_image_url";
static NSString * const kWebsite = @"website";
static NSString * const kShakes = @"shakes";

@implementation SKUser

@synthesize userID;
@synthesize screenName;
@synthesize about;
@synthesize profileImageURL;
@synthesize website;
@synthesize shakes;

- (id)initWithDictionary:(NSDictionary *)theDictionary
{
  if ((self = [super init]))
  {
    userID = [[theDictionary objectForKey:kUserID] integerValue];
    screenName = [[theDictionary objectForKey:kUserName] copy];
    about = [[theDictionary objectForKey:kAbout] copy];
    profileImageURL = [[theDictionary objectForKey:kUserProfileImageURL] retain];
    website = [[theDictionary objectForKey:kWebsite] retain];
    shakes = [[self loadShakes:[theDictionary objectForKey:kShakes]] retain];
  }
  
  return self;
}

- (NSArray *)loadShakes:(NSArray *)array
{
    NSMutableArray *shakeArray = [NSMutableArray arrayWithCapacity:array.count];
    for(NSDictionary *dict in array)
    {
        SKShake *shake = [[SKShake alloc] initWithDictionary:dict];
        [shakeArray addObject:shake];
    }
    return shakeArray;
}

#pragma mark -
#pragma mark Memory Management
// +--------------------------------------------------------------------
// | Memory Management
// +--------------------------------------------------------------------

- (void)dealloc
{
  SGRelease(screenName);
  SGRelease(about);
  SGRelease(profileImageURL);
  SGRelease(website);
  SGRelease(shakes);

  [super dealloc];
}

@end
