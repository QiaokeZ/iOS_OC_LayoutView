
#import "RelativeLayoutViewController.h"
#import "RelativeViewTest1Controller.h"
#import "RelativeViewTest2Controller.h"
#import "RelativeViewTest3Controller.h"
#import "RelativeViewTest4Controller.h"
#import "RelativeViewTest5Controller.h"
@interface RelativeLayoutViewController()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong) NSMutableArray *items;
@end

@implementation RelativeLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"RelativeLayoutView";
    
    self.items = [NSMutableArray array];
    [self.items addObject:@"gravity"];
    [self.items addObject:@"toOf"];
    [self.items addObject:@"align"];
    [self.items addObject:@"alignParent"];
    [self.items addObject:@"gravity+toOf+align"];
    
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
            RelativeViewTest1Controller *vc = [[RelativeViewTest1Controller alloc]init];
            vc.title = self.items[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:{
            RelativeViewTest2Controller *vc = [[RelativeViewTest2Controller alloc]init];
            vc.title = self.items[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2:{
            RelativeViewTest3Controller *vc = [[RelativeViewTest3Controller alloc]init];
            vc.title = self.items[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 3:{
            RelativeViewTest4Controller *vc = [[RelativeViewTest4Controller alloc]init];
            vc.title = self.items[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 4:{
            RelativeViewTest5Controller *vc = [[RelativeViewTest5Controller alloc]init];
            vc.title = self.items[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
}
@end
