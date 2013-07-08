//
//  Base64.m
//  Base64
//
//  Created by Benjamin Borbe on 2013-07-8.
//  Copyright (c) 2013 de.benjaminborbe. All rights reserved.
//

#import "Base64.h"

@implementation Base64

static const char base64EncodingTable[64] = {
	'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P',
	'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f',
	'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
	'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '+', '/'
};

static const char base64DecodingTable[] =
{
	99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99,
	99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99,
	99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 62, 99, 99, 99, 63,
	52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 99, 99, 99, 99, 99, 99,
	99,  0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14,
	15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 99, 99, 99, 99, 99,
	99, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
	41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 99, 99, 99, 99, 99
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
		unsigned int read = 1;
		unsigned int write = 2;
		input[0] = raw[pos++];
		if (pos < dlength){
			input[1] = raw[pos++];
			read = 2;
			write = 3;
		} else {
			input[1] = 0;
		}
		if (pos < dlength){
			input[2] = raw[pos++];
			read = 3;
			write = 4;
		} else {
			input[2] = 0;
		}
		output[0] = (input[0] & 0xFC) >> 2;
		output[1] = ((input[0] & 0x03) << 4) | ((input[1] & 0xF0) >> 4);
		output[2] = ((input[1] & 0x0F) << 2) | ((input[2] & 0xC0) >> 6);
		output[3] = input[2] & 0x3F;		
		for (int i=0;i<write;i++) {
			[result appendString: [NSString stringWithFormat: @"%c", base64EncodingTable[output[i]]]];
		}
		switch (read) {
			case 1:
				[result appendString: @"=="];
				break;
			case 2:
				[result appendString: @"="];
				break;
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
	NSUInteger slength = [base64string length];
	if (slength == 0 ){
		return [[NSData alloc] init];
	}
	unsigned char input[4], output[3];
	const char* raw = [base64string UTF8String];
	NSMutableData* data = [[NSMutableData alloc] init];
	unsigned int pos = 0;
	while (pos < slength) {
		input[0] = base64DecodingTable[raw[pos++]];
		input[1] = base64DecodingTable[raw[pos++]];
		input[2] = base64DecodingTable[raw[pos++]];
		input[3] = base64DecodingTable[raw[pos++]];		
		output[0] = ((input[0] << 2) & 0xFC) | ((input[1] >> 4) & 0x03);
		output[1] = ((input[1] << 4) & 0xF0) | ((input[2] >> 2) & 0x0F);
		output[2] = ((input[2] << 6) & 0xC0) | ((input[3] >> 0 & 0x3F));
		[data appendBytes:output length:3];
	}
	return data;
}

+(NSString *)decodeString:(NSString *)string {
	if (string == nil) {
		return nil;
	}
	return @"";
}

@end
