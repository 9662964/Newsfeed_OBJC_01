//
//  DVMArticleController.h
//  Newfeed_OBJC_01
//
//  Created by iljoo Chae on 6/26/20.
//  Copyright © 2020 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DVMArticle.h"


@interface DVMArticleController : NSObject
+(void)fetchArticle:(void(^)(NSArray<DVMArticle*>* articles))completion;
@end
