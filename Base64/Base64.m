//
//  Base64.m
//  Base64
//
//  Created by Benjamin Borbe on 2013-07-8.
//  Copyright (c) 2013 de.benjaminborbe. All rights reserved.
//

#import "Base64.h"

@implementation Base64


// "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
static char base64EncodingTable[64] = {
	'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P',
	'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f',
	'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
	'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '+', '/'
};

+(NSString*)encode:(NSData*)data
{
	if (data == nil) {
		return nil;
	}
	NSUInteger dlength = [data length];
	if (dlength == 0) {
		return @"";
	}

	unsigned char input[3], output[4];
	const unsigned char* raw = [data bytes];
	NSMutableString* result = [[NSMutableString alloc] init];
	NSUInteger pos = 0;
	
	while (pos < dlength) {
		input[0] = raw[pos++];
		input[1] = raw[pos++];
		input[2] = raw[pos++];
		
		output[0] = (input[0] & 0xFC) >> 2;
		output[1] = ((input[0] & 0x03) << 4) | ((input[1] & 0xF0) >> 4);
		output[2] = ((input[1] & 0x0F) << 2) | ((input[2] & 0xC0) >> 6);
		output[3] = input[2] & 0x3F;
		
		for (int i=0;i<4;i++) {
			[result appendString: [NSString stringWithFormat: @"%c", base64EncodingTable[output[i]]]];
		}
	}
		
	return result;
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
