#import "Kiwi.h"
#import "BeefTaco.h"
#import "TacoContentsFactory.h"
#import "Tortilla.h"
#import "Beef.h"
#import "Queso.h"
#import "Salsa.h"


@interface BeefTaco ()

@property (strong, nonatomic) Tortilla *tortilla;
@property (strong, nonatomic) Beef *beef;
@property (strong, nonatomic) Queso *queso;
@property (strong, nonatomic) Salsa *salsa;
@property (strong, nonatomic) NSArray *veduras;
@property (strong, nonatomic) NSArray *extras;

@property (strong, nonatomic) id<TacoContentsFactory> tacoContentsFactory;

- (void)prepare;

@end


SPEC_BEGIN(BeefTacoSpec)

describe(@"BeefTaco", ^{
    __block BeefTaco *taco;
    __block id<TacoContentsFactory> fakeTacoContentsFactory;
    
    beforeEach(^{
        fakeTacoContentsFactory = [KWMock mockForProtocol:@protocol(TacoContentsFactory)];
        taco = [[BeefTaco alloc] initWithTacoContentsFactory:fakeTacoContentsFactory];
    });
    
    it(@"is a subclass of taco", ^{
        [[taco should] beKindOfClass:[Taco class]];
    });
    
    it(@"has TacoContentsFactory", ^{
        [[(NSObject *)taco.tacoContentsFactory should] equal:fakeTacoContentsFactory];
    });
    
    context(@"#prepare", ^{
        it(@"prepares taco", ^{
            [[(NSObject *)fakeTacoContentsFactory should] receive:@selector(createTortilla)];
            [[(NSObject *)fakeTacoContentsFactory should] receive:@selector(createBeef)];
            [[(NSObject *)fakeTacoContentsFactory should] receive:@selector(createQueso)];
            [[(NSObject *)fakeTacoContentsFactory should] receive:@selector(createSalsa)];
            [[(NSObject *)fakeTacoContentsFactory should] receive:@selector(createVeduras)];
            [[(NSObject *)fakeTacoContentsFactory should] receive:@selector(createExtras)];
            [taco prepare];
        });
    });
});

SPEC_END