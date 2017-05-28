//
//  SessionOperation.m
//  downloader
//
//  Created by Vlad on 3/27/17.
//  Copyright © 2017 Vlad_Kosyi. All rights reserved.
//

#import "VKDownloadManager.h"
#import "VKSessionOperation.h"

@interface VKDownloadManager ()

@property (nonatomic, strong) NSOperationQueue *queue;
@property (nonatomic, strong) VKSessionOperation *downloadOperation;

@end

@implementation VKDownloadManager


- (instancetype)init {
    self = [super init];
    if (self) {
        
        self.queue = [[NSOperationQueue alloc] init];
        self.queue.maxConcurrentOperationCount = 20;
    }
    return self;
}

- (void) downloadWithURL:(NSURL*) url withCompletion:(void (^)(NSData *data, NSURLResponse *response, NSError *error))completionHandler {
    
    self.downloadOperation = [[VKSessionOperation alloc] initWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (completionHandler) {
            
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                
                    completionHandler(data, response, error);
            }];
        }
        
    }];
    
    [self.queue addOperation:self.downloadOperation];

}

- (void) stop {
 
    [self.downloadOperation cancel];
}

- (BOOL)isFinished {
    
    return [self.downloadOperation isFinished];
}

- (BOOL) isExecuting {
    
    return [self.downloadOperation isExecuting];
}

- (void) stopAll {
    
    [self.queue cancelAllOperations];
}


@end
