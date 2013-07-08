//
//  Base64Tests.m
//  Base64
//
//  Created by Benjamin Borbe on 2013-07-8.
//  Copyright (c) 2013 de.benjaminborbe. All rights reserved.
//

#import "Base64Tests.h"
#import "Base64.h"

@implementation Base64Tests

-(void)testEncode
{
	{
		NSData* data = nil;
		NSString* base64String  = [Base64 encode:data];
		STAssertNil(base64String, @"nil");
	}
	
	{
		NSData* data = [NSData alloc];
		NSString* base64String  = [Base64 encode:data];
		STAssertNotNil(base64String, @"not nil");
	}
	
	{
		unsigned char ch1[] = { 0x00, 0x00, 0x00 };
		NSData* data = [[NSData alloc] initWithBytes:ch1
											  length:sizeof(ch1)];
		NSString* base64String  = [Base64 encode:data];
		STAssertNotNil(base64String, @"not nil");
		STAssertEqualObjects(@"AAAA", base64String, @"check string");
	}
	
	{
		unsigned char ch1[] = { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };
		NSData* data = [[NSData alloc] initWithBytes:ch1
											  length:sizeof(ch1)];
		NSString* base64String  = [Base64 encode:data];
		STAssertNotNil(base64String, @"not nil");
		STAssertEqualObjects(@"AAAAAAAA", base64String, @"check string");
	}
	
	{
		unsigned char ch1[] = { 0x00, 0x00 };
		NSData* data = [[NSData alloc] initWithBytes:ch1
											  length:sizeof(ch1)];
		NSString* base64String  = [Base64 encode:data];
		STAssertNotNil(base64String, @"not nil");
		STAssertEqualObjects(@"AAA=", base64String, @"check string");
	}
	
	{
		unsigned char ch1[] = { 0x00 };
		NSData* data = [[NSData alloc] initWithBytes:ch1
											  length:sizeof(ch1)];
		NSString* base64String  = [Base64 encode:data];
		STAssertNotNil(base64String, @"not nil");
		STAssertEqualObjects(@"AA==", base64String, @"check string");
	}
}

-(void)testEncodeString
{
	{
		NSString* data = nil;
		NSString* base64String  = [Base64 encodeString:data];
		STAssertNil(base64String, @"nil");
	}
	{
		NSString* data = @"";
		NSString* base64String  = [Base64 encodeString:data];
		STAssertNotNil(base64String, @"not nil");
	}
}

-(void)testDecode
{
	{
		NSString* base64String = nil;
		NSData* data  = [Base64 decode:base64String];
		STAssertNil(data, @"nil");
	}
	{
		NSString* base64String = @"";
		NSData* data  = [Base64 decode:base64String];
		STAssertNotNil(data, @"not nil");
	}
}

-(void)testDecodeString
{
	{
		NSString* base64String = nil;
		NSString* data  = [Base64 decodeString:base64String];
		STAssertNil(data, @"nil");
	}
	{
		NSString* base64String = @"";
		NSString* data  = [Base64 decodeString:base64String];
		STAssertNotNil(data, @"not nil");
	}
}

@end
