#import "Observer.h"
#import "NewsReporter.h"
#import "Newspaper.h"


@interface BurritoSupremeBee : NSObject <Observer, Newspaper>

@property (strong, nonatomic) NSString *snippet;

- (id)initWithNewsReporter:(id<NewsReporter>)newsReporter;

@end