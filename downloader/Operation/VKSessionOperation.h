//
//  AsynchronousOperation.h
//  downloader
//
//  Created by Vlad on 3/27/17.
//  Copyright © 2017 Vlad_Kosyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VKSessionOperation : NSOperation

- (instancetype)initWithURL:(NSURL *)url
              completionHandler:(void (^)(NSData *data, NSURLResponse *response, NSError *error))completionHandler;

@end
