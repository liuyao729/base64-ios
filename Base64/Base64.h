//
//  Base64.h
//  Base64
//
//  Created by Benjamin Borbe on 2013-07-8.
//  Copyright (c) 2013 de.benjaminborbe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Base64 : NSObject

+(NSData*)encode:(NSString*)base64string;
+(NSString*)decode:(NSData*)data;

@end
