//
//  main.m
//  stringNonsense
//
//  Created by Evan Gale on 2015-08-24.
//  Copyright © 2015 Evan Gale. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        // 255 unit long array of characters
        char inputChars[255];
        
        printf("Input a string: ");
        // limit input to max 255 characters
        fgets(inputChars, 255, stdin);
        
        // print as a c string
        printf("Your string is %s\n", inputChars);
        
        // convert char array to an NSString object
        NSString *badString = [NSString stringWithUTF8String:inputChars];
        NSRange rangedstring = [badString rangeOfString:@"\n"];
        NSString *inputString = [badString substringToIndex: rangedstring.location];
        
        // print NSString object
        NSLog(@"Input was: %@", inputString);
        // make string uppercase
        NSString *uppercaseString = [inputString uppercaseString];
        NSLog(@"Uppercase string is %@", uppercaseString);
        
        // make string lowercase
        NSString *lowercaseString = [inputString lowercaseString];
        NSLog(@"Lowercase string is %@", lowercaseString);
        
        //numberize
        
        NSString *numbered
        
        (NSNumber *)numberFromString:(NSString *)string
        
        
        //canadianized
        NSString *canadian = @", eh?";
        NSString *canadianized = [inputString stringByAppendingString:canadian];
        NSLog(@"Canadians say %@", canadianized);
        
        
        //respond
        NSString *questionMark = @"I don't know.";
        NSString *exclamationMark = @"Whoa, calm down!";
        
        if ([inputString hasSuffix:@"?"]) {
            NSString *combined = [NSString stringWithFormat:@"%@ %@", inputString, questionMark];
            NSLog(@"%@", combined);
            
        } else if ([inputString hasSuffix:@"!"]) {
            NSString *combined = [NSString stringWithFormat:@"%@ %@", inputString, exclamationMark];
            NSLog(@"%@", combined);
        }
    
        
        //de-space
        NSString *deSpaced = [inputString stringByReplacingOccurrencesOfString:@" " withString:@"-"];
        NSLog(@"Nospacessocrazy: %@", deSpaced);

        
    }
    return 0;
}
