//
//  JSFacebookProfilePictureCache.h
//  Merge
//
//  Created by Josh Sklar on 6/26/13.
//  Copyright (c) 2013 Josh Sklar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSFacebookProfilePictureCache : NSObject

/* Singleton class method, used to get the one instance of the profile picture cache */
+ (id)sharedInstance;

/* Returns a full size profile picture for the friend with the fbId 'friendId' 
 block gets called when the fetch is finished */
- (void)getProfilePictureForFriend:(NSString*)friendId withCompletionBlock:(void (^)(NSData *profilePictureData))block;

/* Returns a thumbnail (square) size profile picture for the friend with the fbId 'friendId'
 block gets called when the fetch is finished */
- (void)getProfilePictureThumbnailForFriend:(NSString*)friendId withCompletionBlock:(void (^)(NSData *profilePictureData))block;

@end
