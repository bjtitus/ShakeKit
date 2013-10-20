//
//  SKPost.m
//  ShakeKit
//
//  Created by Justin Williams on 5/28/11.
//  Copyright 2011 Second Gear. All rights reserved.
//

#import "SKPost.h"
#import "SKUser.h"
#import "NSDate+DateConversion.h"

static NSString * const kSharekey = @"sharekey";
static NSString * const kPostTitle = @"title";
static NSString * const kPostName = @"name";
static NSString * const kPostDescription = @"description";
static NSString * const kPostedAt = @"posted_at";
static NSString * const kPostPermalinkPage = @"permalink_page";
static NSString * const kPostOriginalImageURL = @"original_image_url";
static NSString * const kPostHeight = @"height";
static NSString * const kPostWidth = @"width";
static NSString * const kPostViews = @"views";
static NSString * const kLiked = @"liked";
static NSString * const kSaved = @"saved";

@implementation SKPost

@synthesize sharekey;
@synthesize title;
@synthesize fileName;
@synthesize fileDescription;
@synthesize user;
@synthesize postDate;
@synthesize permalink;
@synthesize originalImageURL;
@synthesize height;
@synthesize width;
@synthesize views;
@synthesize liked;
@synthesize saved;

- (id)initWithDictionary:(NSDictionary *)theDictionary
{
  if ((self = [super init]))
  {
    sharekey = [[theDictionary objectForKey:kSharekey] copy];
    title = [[theDictionary objectForKey:kPostTitle] copy];
    fileName = [[theDictionary objectForKey:kPostName] copy];
    fileDescription = [[theDictionary objectForKey:kPostDescription] copy];      
    user = [[SKUser alloc] initWithDictionary:[theDictionary objectForKey:@"user"]];
    postDate = [ConvertStringToDate([theDictionary objectForKey:kPostedAt]) retain];
    permalink = [[theDictionary objectForKey:kPostPermalinkPage] retain];
    originalImageURL = [[theDictionary objectForKey:kPostOriginalImageURL] retain];
    height = [[theDictionary valueForKey:kPostHeight] integerValue];
    width = [[theDictionary valueForKey:kPostWidth] integerValue];
    views = [[theDictionary valueForKey:kPostViews] integerValue];
    liked = [[theDictionary valueForKey:kLiked] boolValue];
    saved = [[theDictionary valueForKey:kSaved] boolValue];
  }
  
  return self;
}

#pragma mark -
#pragma mark Memory Management
// +--------------------------------------------------------------------
// | Memory Management
// +--------------------------------------------------------------------

- (void)dealloc
{
  SGRelease(title);
  SGRelease(fileName);
  SGRelease(fileDescription);
  SGRelease(user);
  SGRelease(postDate);
  SGRelease(permalink);
  SGRelease(originalImageURL);
 
  [super dealloc];
}

@end
