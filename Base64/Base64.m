//
//  Base64.m
//  Base64
//
//  Created by Benjamin Borbe on 2013-07-8.
//  Copyright (c) 2013 de.benjaminborbe. All rights reserved.
//

#import "Base64.h"

@implementation Base64

+(NSString*)encode:(NSData*)data
{
	if (data == nil) {
		return nil;
	}
//	NSString* values = @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
	return @"";
}

+(NSString *)encodeString:(NSString *)string
{
	if (string == nil) {
		return nil;
	}
	return @"";
}

+(NSData*)decode:(NSString*)base64string
{
	if (base64string == nil) {
		return nil;
	}
	return [NSData alloc];
}

+(NSString *)decodeString:(NSString *)string {
	if (string == nil) {
		return nil;
	}
	return @"";
}

@end
