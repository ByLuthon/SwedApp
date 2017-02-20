//
//  FriendsProfileViewController.m
//  Medium
//
//  Created by macmini on 17/02/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import "FriendsProfileViewController.h"

@interface FriendsProfileViewController ()

@end

@implementation FriendsProfileViewController
 
- (void)viewDidLoad
{
    [self setPagingview];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)setPagingview
{
    NSMutableArray *buttonArray = [NSMutableArray array];
    NSMutableArray *tblArray = [NSMutableArray array];

    for(int i = 0; i < 10; i++)
    {
        UIButton *segmentButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [segmentButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [segmentButton setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        segmentButton.titleLabel.font = [UIFont boldSystemFontOfSize:14];
        [segmentButton setTitle:[NSString stringWithFormat:@"Tab %@",@(i)] forState:UIControlStateNormal];
        [buttonArray addObject:segmentButton];
        
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.backgroundColor = [UIColor clearColor];
        [tblArray addObject:tableView];
    }
    
    HHHorizontalPagingView *pagingView = [HHHorizontalPagingView pagingViewWithHeaderView:subview_header headerHeight:145.0 segmentButtons:buttonArray segmentHeight:40 contentViews:tblArray];
    pagingView.frame = CGRectMake(0, 60, WIDTH, HEIGHT-60);
    

    
    [self.view addSubview:pagingView];
    [self.view bringSubviewToFront:view_navgation];

    /*
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(aMethod:)
     forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundColor:[UIColor redColor]];
    [button setTitle:@" " forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, subview_header.frame.size.width, subview_header.frame.size.height);
    [pagingView addSubview:button];
     */
    
    
    /*
    UIButton *Followingbutton = (UIButton *)[[pagingView.subviews objectAtIndex:2] viewWithTag:10];
    [Followingbutton setOnTouchUpInside:^(UIEvent *event, id sender)
     {
         FollowingFollowersViewController *move = [self.storyboard instantiateViewControllerWithIdentifier:@"FollowingFollowersViewController"];
         move.isFollowing = TRUE;
         [self.navigationController pushViewController:move animated:YES];
     }];
    
    
    
    UIButton *Followersbutton = (UIButton *)[[pagingView.subviews objectAtIndex:2] viewWithTag:20];
    [Followersbutton setOnTouchUpInside:^(UIEvent *event, id sender)
     {
         FollowingFollowersViewController *move = [self.storyboard instantiateViewControllerWithIdentifier:@"FollowingFollowersViewController"];
         move.isFollowing = FALSE;
         [self.navigationController pushViewController:move animated:YES];
     }];
    */
}

-(IBAction)aMethod:(id)sender
{
    NSLog(@"Click:");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)Back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}



- (IBAction)tap:(id)sender
{
    
}

- (IBAction)clickHere:(id)sender
{
    
}
- (IBAction)setting:(id)sender
{
    
}

- (IBAction)follow:(id)sender
{

}

- (IBAction)share:(id)sender
{
    
}
- (IBAction)Following:(id)sender
{
    
}
- (IBAction)Followers:(id)sender
{
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

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
