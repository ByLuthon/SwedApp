//
//  TrendingViewController.m
//  Medium
//
//  Created by macmini on 08/02/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import "TrendingViewController.h"

@interface TrendingViewController ()

@end

@implementation TrendingViewController
@synthesize dataDict;

- (void)viewDidLoad
{
    _view_navigationTitle.hidden = TRUE;
    [self setInitParam];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)setInitParam
{
    /*
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = CGRectMake(0, 0, WIDTH, subview_header.frame.size.height);
    gradient.colors = @[(id)[[UIColor clearColor] CGColor],
                        (id)[[UIColor lightGrayColor] CGColor],
                        (id)[[UIColor clearColor] CGColor]];
    [subview_header.layer insertSublayer:gradient atIndex:0];
     */
    lbl_headerTitle.text = [dataDict objectForKey:@"title"];
    lbl_navigationTitle.text = lbl_headerTitle.text;

    /* Init table header view by using image or image from url*/
    DTParallaxHeaderView *headerView = [[DTParallaxHeaderView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 200) withImage:[UIImage imageNamed:[dataDict objectForKey:@"image"]] withTabBar:nil];
    
    //    DTHeaderView *headerView = [[DTHeaderView alloc] initWithFrame:CGRectMake(0, 0, 320, 200) withImageUrl:@"http://s3.favim.com/orig/47/colorful-fun-girl-night-ocean-Favim.com-437603.jpg" withTabBar:tabbar];
    
    [_tbl setDTHeaderView:headerView];
    _tbl.showShadow = NO;
    
    [_tbl reloadData];


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

- (IBAction)Back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Tableview Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    return subview_header;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 355;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = [NSString stringWithFormat:@"cell %ld",(long)indexPath.row];
    
    Cell_TrendingDetails *cell = (Cell_TrendingDetails *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell = nil;
    if (cell == nil)
    {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"Cell_TrendingDetails" owner:nil options:nil];
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
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    HomeDetailsViewController *move = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeDetailsViewController"];
    [self.navigationController pushViewController:move animated:YES];
}

#pragma mark - ScrollView Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //NSLog(@"Y:%f",scrollView.contentOffset.y);
    
    if (scrollView.contentOffset.y > 140)
    {
        if (!isshow)
        {
            isshow = TRUE;
            [APP_DELEGATE animateWithShow:YES withView:_view_navigationTitle];
        }
    }
    else
    {
        isshow = FALSE;
        [APP_DELEGATE animateWithShow:NO withView:_view_navigationTitle];
    }
}

@end
