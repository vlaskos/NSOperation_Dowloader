//
//  AsynchronousOperation.m
//  downloader
//
//  Created by Vlad on 3/27/17.
//  Copyright © 2017 Vlad_Kosyi. All rights reserved.
//

#import "VKSessionOperation.h"

@interface VKSessionOperation ()

@property (nonatomic, strong, readonly) NSURLSessionDataTask *task;

@property (assign, nonatomic) BOOL isExecuting, isFinished;

@end

@implementation VKSessionOperation

- (instancetype)initWithURL:(NSURL *)url completionHandler:(void (^)(NSData *data, NSURLResponse *response, NSError *error))completionHandler {
    if (self = [super init]) {
        __weak typeof(self) weakSelf = self;
        NSURLSession* session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration ephemeralSessionConfiguration]];
        _task = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            [weakSelf completeOperationWithBlock:completionHandler data:data response:response error:error];
        }];
    }
    return self;
}

- (void)cancel {
    [super cancel];
    [self.task cancel];
}

- (void)start {
    
    if (self.isCancelled) {
        
        [self willChangeValueForKey:@"isFinished"];
        _isFinished = YES;
        [self didChangeValueForKey:@"isFinished"];
        
        return;
    }
    
    [self willChangeValueForKey:@"isExecuting"];
    [self.task resume];
    _isExecuting = YES;
    [self didChangeValueForKey:@"isExecuting"];
}

- (BOOL)isExecuting {
    return _isExecuting;
}

- (BOOL)isFinished {
    return _isFinished;
}

- (BOOL)isConcurrent {
    return YES;
}

- (void)completeOperationWithBlock:(void (^)(NSData *, NSURLResponse *, NSError *))block data:(NSData *)data response:(NSURLResponse *)response error:(NSError *)error {
    if (!self.isCancelled && block) {
        block(data, response, error);
    }
    
    [self completeOperation];
}

- (void)completeOperation {
    
    [self willChangeValueForKey:@"isFinished"];
    [self willChangeValueForKey:@"isExecuting"];
    
    _isExecuting = NO;
    _isFinished = YES;
    
    [self didChangeValueForKey:@"isExecuting"];
    [self didChangeValueForKey:@"isFinished"];
}



@end
