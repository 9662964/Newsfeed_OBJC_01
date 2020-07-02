//
//  DVMArticleController.m
//  Newfeed_OBJC_01
//
//  Created by iljoo Chae on 6/26/20.
//  Copyright © 2020 Admin. All rights reserved.
//

#import "DVMArticleController.h"

@implementation DVMArticleController

static NSString * const baseURLString = @"https://newsapi.org/v2/";
static NSString * const headLineComponent = @"top-headlines";
static NSString * const countryKey = @"country";
static NSString * const countryValue = @"us";
static NSString * const apiKey = @"apiKey";
static NSString * const apiValue = @"ae910eac68e44996a3e949c1458b8138";


+ (void)fetchArticle:(void (^)(NSArray<DVMArticle *> * _Nullable))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *headlineURL = [baseURL URLByAppendingPathComponent:headLineComponent];
    NSURLComponents *components = [[NSURLComponents alloc] initWithURL:headlineURL resolvingAgainstBaseURL:true];
    NSURLQueryItem *countryQueryItem = [[NSURLQueryItem alloc]initWithName:countryKey value:countryValue];
    NSURLQueryItem *apiQueryItem = [[NSURLQueryItem alloc]initWithName:apiKey value:apiValue];
    components.queryItems = @[countryQueryItem,apiQueryItem];
    NSURL *finalURL = components.URL;
    NSLog(@"%@", finalURL);
    
    
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if(error)
        {
            NSLog(@"%@", error.localizedDescription);
            return completion(nil);
        }
        if (data)
        {
            NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
            
            if(!topLevelDictionary)
            {
                NSLog(@"We had an error parsing the JSON %@", error.localizedDescription);
                return completion(nil);
            }
            
            NSMutableArray * articlesArray = [NSMutableArray new];
            
            for (NSDictionary * articleDictionary in topLevelDictionary[@"articles"])
            {
                DVMArticle * article = [[DVMArticle alloc]initWithDictionary:articleDictionary];
                [articlesArray addObject:article];
            }
            completion(articlesArray);
            
        }
    }] resume];
}
@end
