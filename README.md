JSFacebookProfilePictureCache
=============================

**An iOS cache for users Facebook profile pictures, and also a convenient way to fetch profile pictures.**

`JSFacebookProfilePictureCache` is a convenient way to cache (and fetch) Facebook profile pictures in-memory. It provides a method to get a Facebook profile picture from the cache, and executes the passed in block upon retrieval, either from the in-memory cache or fetching it from the network.

## Usage

```objective-c
NSString *fbId = [friend valueForKey:@"id"];	// get a Facebook ID
[[JSFacebookProfilePictureCache sharedInstance] getProfilePictureThumbnailForFriend:fbId withCompletionBlock:^(NSData *profilePictureData) {
	[iv setImage:[UIImage imageWithData:profilePictureData]];
}];
```

The `JSFacebookProfilePictureCache` is a singleton class that can be call from anywhere. If the picture is not yet fetched and stored in the in-memory cache, then it is fetched from the network and saved, then the passed in `completionBlock` is executed. Otherwise, the picture is fetched from the cache, and the `completionBlock` is executed (almost) immediately.

## Demo

Build and run the `FacebookProfilePictureCacheDemo` in Xcode to see a full demo of `JSFacebookProfilePictureCache`.
