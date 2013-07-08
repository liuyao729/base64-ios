//
//  Base64.h
//  Base64
//
//  Created by Benjamin Borbe on 2013-07-8.
//  Copyright (c) 2013 de.benjaminborbe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Base64 : NSObject

+(NSString*)encode:(NSData*)data;
+(NSString *)encodeString:(NSString *)string;

+(NSData*)decode:(NSString*)string;
+(NSString *)decodeString:(NSString *)string;

@end
