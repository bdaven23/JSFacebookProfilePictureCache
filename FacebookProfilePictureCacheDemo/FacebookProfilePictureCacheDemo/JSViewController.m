//
//  JSViewController.m
//  FacebookProfilePictureCacheDemo
//
//  Created by Josh Sklar on 6/26/13.
//  Copyright (c) 2013 Josh Sklar. All rights reserved.
//

#import "JSViewController.h"
#import "JSFacebookProfilePictureCache.h"

@implementation JSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, 50, 50)];
    [self.view addSubview:iv];
    
    // using a Facebook useres fbId, get their profile image
    [[JSFacebookProfilePictureCache sharedInstance] getProfilePictureThumbnailForFriend:@"1234" withCompletionBlock:^(NSData *profilePictureData) {
        [iv setImage:[UIImage imageWithData:profilePictureData]];
    }];
    
    // the next time you try to get that users Facebook profile image, it will be instant, due to the cache
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
