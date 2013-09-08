#import "Kiwi.h"
#import "Asada.h"


SPEC_BEGIN(AsadaSpec)

describe(@"Asada", ^{
    __block Asada *carne;
    
    beforeEach(^{
        carne = [[Asada alloc] init];
    });
    
    it(@"is a subclass of carne", ^{
        BOOL isCarne = [carne isKindOfClass:[Carne class]];
        [[theValue(isCarne) should] beYes];
        
    });
    
    it(@"is not nil", ^{
        [carne shouldNotBeNil];
    });
});

SPEC_END