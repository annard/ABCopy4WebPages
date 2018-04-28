//
//  Web_copy_phone_number.m
//  Web copy phone number
//
//  Created by Annard Brouwer on 28/04/2018.
//  Copyright © 2018 Annard Brouwer. All rights reserved.
//

#import "ABCopy4WebPages.h"

@implementation ABCopy4WebPages

// This example action works with phone numbers.
- (NSString *)actionProperty
{
    return kABPhoneProperty;
}

- (NSString *)titleForPerson:(ABPerson *)person identifier:(NSString *)identifier
{
    return NSLocalizedString(@"Copy for Web Pages", @"");
}

// This method is called when the user selects your action. As above, this method
// is passed information about the data item rolled over.
- (void)performActionForPerson:(ABPerson *)person identifier:(NSString *)identifier
{
    NSPasteboard *pboard = [NSPasteboard generalPasteboard];
    ABMultiValue *values = [person valueForProperty:[self actionProperty]];
    NSString *value = [values valueForIdentifier:identifier];
    NSArray * valueComps = [value componentsSeparatedByCharactersInSet:[[NSCharacterSet characterSetWithCharactersInString:@"+1234567890"] invertedSet]];

    [pboard clearContents];
    [pboard setString:[valueComps componentsJoinedByString:@""] forType:NSPasteboardTypeString];
}

// Optional. Your action will always be enabled in the absence of this method. As
// above, this method is passed information about the data item rolled over.
- (BOOL)shouldEnableActionForPerson:(ABPerson *)person identifier:(NSString *)identifier
{
    return YES;
}

@end
