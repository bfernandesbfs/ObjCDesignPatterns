#import "ChimichangaTimes.h"


@interface ChimichangaTimes ()

@property (strong, nonatomic) id<NewsReporter> newsReporter;
@property (strong, nonatomic) NSString *newsHeader;

@end


@implementation ChimichangaTimes

#pragma mark - Init Methods

- (id)initWithNewsReporter:(id<NewsReporter>)newsReporter
{
    self = [super init];
    if (self) {
        self.newsReporter = newsReporter;
        [self.newsReporter registerObserver:self];
    }
    return self;
}

#pragma mark - <Observer>

- (void)update:(NSString *)updateText
{
    self.newsHeader = updateText;
}

@end
