//
//  JSFacebookProfilePictureCache.m
//  Merge
//
//  Created by Josh Sklar on 6/26/13.
//  Copyright (c) 2013 Josh Sklar. All rights reserved.
//

#import "JSFacebookProfilePictureCache.h"

@implementation JSFacebookProfilePictureCache
{
@private
    NSMutableDictionary *cacheDict;
    
}

- (id)init {
    self = [super init];
    if (self) {
        cacheDict = [[NSMutableDictionary alloc]init];
    }
    return self;
    
}

+ (id)sharedInstance
{
    static id sharedInstance = nil;
    if (sharedInstance == nil) {
        sharedInstance = [[self alloc] init];
    }
    return sharedInstance;
}

- (void)getProfilePictureForFriend:(NSString*)friendId withCompletionBlock:(void (^)(NSData *profilePictureData))block
{
    NSData *data = [cacheDict objectForKey:friendId];
    if (data) {
        block(data);
    }
    else {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSString *urlString = [NSString stringWithFormat:@"http://graph.facebook.com/%@/picture?type=large", friendId];
            NSURL *url = [NSURL URLWithString:urlString];
            NSData *imageData = [NSData dataWithContentsOfURL:url];
            dispatch_async(dispatch_get_main_queue(), ^{
                [cacheDict setObject:imageData forKey:friendId];
                block(imageData);
            });
        });
    }
}

- (void)getProfilePictureThumbnailForFriend:(NSString*)friendId withCompletionBlock:(void (^)(NSData *profilePictureData))block
{
    NSString *newKey = [NSString stringWithFormat:@"%@thumbnail", friendId];
    NSData *data = [cacheDict objectForKey:newKey];
    if (data) {
        block(data);
    }
    else {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSString *urlString = [NSString stringWithFormat:@"http://graph.facebook.com/%@/picture?type=square", friendId];
            NSURL *url = [NSURL URLWithString:urlString];
            NSData *imageData = [NSData dataWithContentsOfURL:url];
            dispatch_async(dispatch_get_main_queue(), ^{
                [cacheDict setObject:imageData forKey:newKey];
                block(imageData);
            });
        });
    }
}

@end
