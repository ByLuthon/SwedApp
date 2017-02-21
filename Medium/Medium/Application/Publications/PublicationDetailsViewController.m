//
//  PublicationDetailsViewController.m
//  Medium
//
//  Created by macmini on 21/02/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import "PublicationDetailsViewController.h"

@interface PublicationDetailsViewController ()

@end

@implementation PublicationDetailsViewController

- (void)viewDidLoad
{
    
    [self setPagingview];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)setPagingview
{
    sectionArr = [[NSMutableArray alloc] initWithObjects:@"HOME",@"CLIMATE",@"POLITICS",@"RUSSIA",@"SUPREME COURT",@"FEATURE",@"IMMIGRATION",@"VIDEO", nil];
    
    NSMutableArray *buttonArray = [NSMutableArray array];
    NSMutableArray *tblArray = [NSMutableArray array];
    
    for(int i = 0; i < sectionArr.count; i++)
    {
        UIButton *segmentButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [segmentButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [segmentButton setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        segmentButton.titleLabel.font = [UIFont boldSystemFontOfSize:14];
        [segmentButton setTitle:[NSString stringWithFormat:@"%@",[sectionArr objectAtIndex:i]] forState:UIControlStateNormal];
        [buttonArray addObject:segmentButton];
        
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.backgroundColor = [UIColor clearColor];
        [tblArray addObject:tableView];
    }
    
    HHHorizontalPagingView *pagingView = [HHHorizontalPagingView pagingViewWithHeaderView:subview_header headerHeight:110.0 segmentButtons:buttonArray segmentHeight:40 contentViews:tblArray];
    pagingView.frame = CGRectMake(0, 60, WIDTH, HEIGHT-60);
    //    pagingView.segmentButtonSize = CGSizeMake(60., 30.);              //自定义segmentButton的大小
    pagingView.segmentView.backgroundColor = subview_header.backgroundColor;     //设置segmentView的背景色

    [self.view addSubview:pagingView];
    [self.view bringSubviewToFront:view_navigation ];
}

- (IBAction)Back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - Tableview Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 509;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = [NSString stringWithFormat:@"cell %ld",(long)indexPath.row];
    
    Cell_Home *cell = (Cell_Home *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell = nil;
    if (cell == nil)
    {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"Cell_Home" owner:nil options:nil];
        cell = [topLevelObjects objectAtIndex:0];
        cell.backgroundColor = [UIColor clearColor];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        [cell.btn_like setOnTouchUpInside:^(id sender, UIEvent *event)
         {
             if (cell.btn_like.selected == TRUE)
             {
                 cell.btn_like.selected = FALSE;
             }
             else
             {
                 cell.btn_like.selected = TRUE;
             }
         }];
        
        
        [cell.btn_bookmarks setOnTouchUpInside:^(id sender, UIEvent *event)
         {
             if (cell.btn_bookmarks.selected == TRUE)
             {
                 cell.btn_bookmarks.selected = FALSE;
             }
             else
             {
                 cell.btn_bookmarks.selected = TRUE;
             }
         }];
        
        [cell.btn_img_profile setOnTouchUpInside:^(UIEvent *event, id sender)
         {
             FriendsProfileViewController *move = [self.storyboard instantiateViewControllerWithIdentifier:@"FriendsProfileViewController"];
             [self.navigationController pushViewController:move animated:YES];
         }];
        
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    HomeDetailsViewController *move = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeDetailsViewController"];
    [self.navigationController pushViewController:move animated:YES];
}

@end
