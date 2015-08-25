//
//  main.m
//  stringNonsense
//
//  Created by Evan Gale on 2015-08-24.
//  Copyright © 2015 Evan Gale. All rights reserved.
//

#import <Foundation/Foundation.h>

NSString * canadianize(NSString * string) ;
NSNumber * numberize(NSString * string);
NSString * respond(NSString * string);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        // 255 unit long array of characters
        char inputChars[255];
        
        char choice[255];
        
        NSLog(@"Enter the number of the thing you want to do: \n 1. Uppercase \n 2. Lowercase \n 3. Numberize \n 4. Canadainize \n 5. Respond \n 6. De-Space-It");
        fgets(choice, 255, stdin);
        NSString *choicestring = [NSString stringWithUTF8String:choice];
        int choiceint = choicestring.intValue;
        
        printf("Input a string: ");
        // limit input to max 255 characters
        fgets(inputChars, 255, stdin);
        
        // print as a c string
        printf("Your string is %s\n", inputChars);
        
        // convert char array to an NSString object
        NSString *badString = [NSString stringWithUTF8String:inputChars];
        NSRange rangedstring = [badString rangeOfString:@"\n"];
        NSString *inputString = [badString substringToIndex: rangedstring.location];
        
        NSLog(@"Input was: %@", inputString);
        
        switch (choiceint) {
            case 1:
                NSLog(@"Uppercase string is %@", [inputString uppercaseString]);
                break;
            case 2:
                NSLog(@"Lowercase string is %@", [inputString lowercaseString]);
                break;
            case 3:
                numberize(inputString);
                break;
            case 4:
                canadianize(inputString);
                break;
            case 5:
                respond(inputString);
                break;
            case 6:
                NSLog(@"Nospacessocrazy: %@", [inputString stringByReplacingOccurrencesOfString:@" " withString:@"-"]);
                break;
            default:
                NSLog(@"That's not going to work");
                break;
        }
    }
    return 0;
}

NSString *respond(NSString * string) {
NSString *questionMark = @"I don't know.";
NSString *exclamationMark = @"Whoa, calm down!";
    NSString *combined;
    
if ([string hasSuffix:@"?"]) {
    combined = [NSString stringWithFormat:@"%@ %@", string, questionMark];
    NSLog(@"%@", combined);
    
} else if ([string hasSuffix:@"!"]) {
    combined = [NSString stringWithFormat:@"%@ %@", string, exclamationMark];
    NSLog(@"%@", combined);
}
    return combined;
}
NSString * canadianize(NSString * string) {
    NSString *canadian = @", eh?";
    NSString *canadianized = [string stringByAppendingString:canadian];
    NSLog(@"Canadians say %@", canadianized);
    return canadianized;
}

NSNumber * numberize(NSString * string) {
    NSNumberFormatter *numberformatter = [[NSNumberFormatter alloc] init];
    NSNumber *number = [numberformatter numberFromString: string];
    if  (!number) {
        NSLog(@"%@ is not a number", string);
    }
    else if (number) {
        NSLog(@"%@", number);
    }
    
    return number;
}
