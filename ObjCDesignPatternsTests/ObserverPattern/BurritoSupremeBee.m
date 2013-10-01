#import "Kiwi.h"
#import "BurritoSupremeBee.h"
#import "NewsReporter.h"
#import "Observer.h"
#import "Swizzlean.h"

@interface BurritoSupremeBee ()

@property (strong, nonatomic) id<NewsReporter> newsReporter;
@property (strong, nonatomic) NSString *newsHeader;

@end


SPEC_BEGIN(BurritoSupremeBeeSpec)

describe(@"BurritoSupremeBee", ^{
    __block BurritoSupremeBee *burritoSupremeBee;
    
    beforeEach(^{
        burritoSupremeBee = [[BurritoSupremeBee alloc] init];
    });
    
    it(@"conforms to <Observer>", ^{
        [[burritoSupremeBee should] conformToProtocol:@protocol(Observer)];
    });
    
    context(@"#initWithNewsReporter", ^{
        it(@"registers itself as an observer of the NewsReporter passed in", ^{
            id fakeNewsReporter = [KWMock nullMockForProtocol:@protocol(Observer)];
            [[fakeNewsReporter should] receive:@selector(registerObserver:)];
            
            BurritoSupremeBee *supreme = [[BurritoSupremeBee alloc] initWithNewsReporter:fakeNewsReporter];
            [[(NSObject *)supreme.newsReporter should] equal:fakeNewsReporter];
        });
    });
    
    context(@"#update:", ^{
        beforeEach(^{
            [burritoSupremeBee update:@"Supreme is the way to go!!!"];
        });
        
        it(@"sets the news header", ^{
            [[burritoSupremeBee.newsHeader should] equal:@"Supreme is the way to go!!!"];
        });
    });
});

SPEC_END

