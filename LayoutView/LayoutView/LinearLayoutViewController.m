

#import "LinearLayoutViewController.h"
#import "LinearViewTest1Controller.h"
#import "LinearViewTest2Controller.h"
#import "LinearViewTest3Controller.h"
#import "LinearViewTest4Controller.h"
@interface LinearLayoutViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong) NSMutableArray *items;
@end

@implementation LinearLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"LinearLayoutView";
    
    self.items = [NSMutableArray array];
    [self.items addObject:@"上下布局"];
    [self.items addObject:@"左右布局"];
    [self.items addObject:@"混合布局"];
    [self.items addObject:@"多层嵌套布局"];
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"1234"];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.tableFooterView = [UIView new];
    [self.view addSubview:tableView];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"1234" forIndexPath:indexPath];
    cell.textLabel.text = self.items[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:{
            LinearViewTest1Controller *vc = [[LinearViewTest1Controller alloc]init];
            vc.title = self.items[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:{
            LinearViewTest2Controller *vc = [[LinearViewTest2Controller alloc]init];
            vc.title = self.items[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2:{
            LinearViewTest3Controller *vc = [[LinearViewTest3Controller alloc]init];
            vc.title = self.items[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 3:{
            LinearViewTest4Controller *vc = [[LinearViewTest4Controller alloc]init];
            vc.title = self.items[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
}

@end
