//
//  DVMArticle.m
//  Newfeed_OBJC_01
//
//  Created by iljoo Chae on 6/26/20.
//  Copyright © 2020 Admin. All rights reserved.
//

#import "DVMArticle.h"

@implementation DVMArticle
-(instancetype)initWithArticleTitle:(NSString *)title descript:(NSString *)descript content:(NSString *)content url:(NSString *)url urlToImage:(NSString *)urlToImage
                        publishedAt:(NSString *) publishedAt
                           articles:(NSArray<NSString *>*)articles
{
    self = [super init];
    
    if(self)
    {
        _title = title;
        _descript = descript;
        _content = content;
        _url = url;
        _urlToImage = urlToImage;
        _articles = articles;
        _publishedAt = publishedAt;
    }
    return self;
}
@end

@implementation DVMArticle (JSONConvertable)
-(instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)topLevelDictionary
{
    NSString *title = topLevelDictionary[@"title"];
    NSString *descript = topLevelDictionary[@"description"];
    NSString *content = topLevelDictionary[@"content"];
    NSString *url = topLevelDictionary[@"url"];
    NSString *urlToImage = topLevelDictionary[@"urlToImage"];
    NSString *publishedAt = topLevelDictionary[@"publishedAt"];
    NSString *articlesArray = topLevelDictionary[@"articles"];

    
    NSMutableArray<NSString *> *articles = [[NSMutableArray alloc] init];
    
    return [self initWithArticleTitle:title descript:descript content:content url:url urlToImage:urlToImage publishedAt:publishedAt articles:articles];
}
@end
