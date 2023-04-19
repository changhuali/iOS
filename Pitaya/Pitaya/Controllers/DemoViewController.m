//
//  DemoViewController.m
//  Pitaya
//
//  Created by hjmac04 on 2023/4/18.
//

#import "DemoViewController.h"
#import "MainTabBarController.h"
#import <Masonry.h>
#import "DemoSectionData.h"
#import "DemoCellData.h"

static NSArray<DemoSectionData *> *sectionList;

@interface DemoViewController ()

@property(nonatomic) UITableView *tableView;

@end

@implementation DemoViewController

+ (void)initialize {
    static dispatch_once_t once_token;
    dispatch_once(&once_token, ^{
        sectionList = @[
            // UITabBarController
            [DemoSectionData initWithTitle:@"UITabBarController" andCellList:@[
                [DemoCellData initWithTitle:@"基础版" andVcCreator:^UIViewController * _Nonnull{
                    MainTabBarController *tabBarVC = [MainTabBarController initControllers];
                    return tabBarVC;
                }],
            ]],
            // UIScrollView
            [DemoSectionData initWithTitle:@"UIScrollView" andCellList:@[
                [DemoCellData initWithTitle:@"基础版" andVcCreator:^UIViewController * _Nonnull{
                    return nil;
                }],
            ]],
            // UITableView
            [DemoSectionData initWithTitle:@"UITableView" andCellList:@[
                [DemoCellData initWithTitle:@"基础版" andVcCreator:^UIViewController * _Nonnull{
                    return nil;
                }],
            ]]
        ];
    });
}

#pragma mark - View setup

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    
    // setup tableView
    _tableView = [UITableView new];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"DemoCell"];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    
    NSLog(@"%@", [UIViewController class]);
}


#pragma mark -UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DemoCellData *cellData = sectionList[indexPath.section].cellList[indexPath.row];
    
    UIViewController *vc = cellData.vcCreator();
    [self.navigationController pushViewController:vc animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    DemoCellSection *section = self.selectionList[ind]
    return 40;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return sectionList[section].title;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DemoCell"];
    DemoCellData *cellData = sectionList[indexPath.section].cellList[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", cellData.title];
    return cell;
}

#pragma mark -UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return sectionList[section].cellList.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return sectionList.count;
}

@end
