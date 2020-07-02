//
//  DVMArticle.h
//  Newfeed_OBJC_01
//
//  Created by iljoo Chae on 6/26/20.
//  Copyright © 2020 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface DVMArticle : NSObject
@property (nonatomic,copy,readonly) NSString *title;
@property (nonatomic,copy,readonly) NSString *descript;
@property (nonatomic,copy,readonly) NSString *content;
@property (nonatomic,copy,readonly) NSString *url;
@property (nonatomic,copy,readonly) NSString *urlToImage;
@property (nonatomic,copy,readonly) NSString *publishedAt;
@property (nonatomic,copy,readonly) NSArray<NSString *>* articles;

-(instancetype) initWithArticleTitle:(NSString *)title
                         descript:(NSString *)descript
                             content:(NSString *)content
                                 url:(NSString *)url
                          urlToImage:(NSString *)urlToImage
                        publishedAt:(NSString *)publishedAt
                        articles:(NSArray<NSString*>*)articles;

@end

@interface DVMArticle (JSONConvertable)
-(instancetype)initWithDictionary:(NSDictionary<NSString*,id>*)topLevelDictionary;
@end


