//
//  SessionOperation.h
//  downloader
//
//  Created by Vlad on 3/27/17.
//  Copyright © 2017 Vlad_Kosyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VKDownloadManager : NSObject

- (void) downloadWithURL:(NSURL*) url withCompletion:(void (^)(NSData *data, NSURLResponse *response, NSError *error))completionHandler;

- (void) stop;

- (void) stopAll;

- (BOOL) isFinished;

- (BOOL) isExecuting;

@end
