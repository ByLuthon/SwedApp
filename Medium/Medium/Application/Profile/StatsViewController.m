//
//  StatsViewController.m
//  Medium
//
//  Created by macmini on 08/02/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import "StatsViewController.h"

@interface StatsViewController ()
{
    
}
@property(strong, nonatomic) TWRChartView *chartView;

@end

@implementation StatsViewController

- (void)viewDidLoad
{
    [self setInitparam];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setInitparam
{
    //
    subview.frame = CGRectMake(0, 0, WIDTH, mainscrl.frame.size.height + subview_Segment.frame.origin.y);
    
    [mainscrl addSubview:subview];
    mainscrl.contentSize = CGSizeMake(WIDTH , subview.frame.size.height);
    
    
    ///////////////////////
    tbl_stories.frame = CGRectMake(0, 0, WIDTH, scrl.frame.size.height);
    tbl_responces.frame = CGRectMake(WIDTH*1, 0, WIDTH, scrl.frame.size.height);
    
    [scrl addSubview:tbl_stories];
    [scrl addSubview:tbl_responces];
    
    scrl.contentSize = CGSizeMake(WIDTH * 2 , 0);
    scrl.pagingEnabled = TRUE;
    
    CGPoint scrollPoint = CGPointMake(0, 0);
    [scrl setContentOffset:scrollPoint animated:YES];
    [scrl setDelegate:self];//Set delegate
    
    //Set Line Under Button
    [self setLineFrameUnderMenu:btn_Stories];
    
    tbl_stories.scrollEnabled = FALSE;
    tbl_responces.scrollEnabled = FALSE;
    

    
    
    //Graph
    _chartView = [[TWRChartView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, subview_graph.frame.size.height)];
    _chartView.backgroundColor = [UIColor clearColor];
    
    // Load chart by using a ChartJS javascript file
    NSString *jsFilePath = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"js"];
    [_chartView setChartJsFilePath:jsFilePath];
    
    // Add the chart view to the controller's view
    [subview_graph addSubview:_chartView];

    [self loadBarChart];

}
#pragma mark - Chart

- (void)loadBarChart
{
    // Build chart data
    TWRDataSet *dataSet1 = [[TWRDataSet alloc] initWithDataPoints:@[@10, @15, @5, @15, @5,@"", @15, @5, @15, @5,@"", @15, @5, @15, @"1",@10, @15, @5, @15, @5,@10, @15, @5, @15, @5,@"", @15, @5, @15, @5]
                                                        fillColor:[kColorLightGreen colorWithAlphaComponent:1.0]
                                                      strokeColor:kColorLightGreen];
    
    
    NSArray *labels = @[@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",];
    
    TWRBarChart *bar = [[TWRBarChart alloc] initWithLabels:labels
                                                  dataSets:@[dataSet1]
                                                  animated:YES];
    // Load data
    [_chartView loadBarChart:bar];
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

#pragma mark - UnderLine Button
-(void)resetButtontitleColor
{
    [btn_Stories setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [btn_Responces setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    
}
-(void)setLineFrameUnderMenu:(UIButton *)btn
{
    [self resetButtontitleColor];
    
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
}
#pragma mark - ScrollView Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //NSLog(@"Y:%f",scrollView.contentOffset.y);
    
    if (scrollView == mainscrl)
    {
        if (scrollView.contentOffset.y > 154)
        {
            tbl_stories.scrollEnabled = TRUE;
            tbl_responces.scrollEnabled = TRUE;
        }
        else
        {
            tbl_stories.scrollEnabled = FALSE;
            tbl_responces.scrollEnabled = FALSE;
        }
    }
    if (scrollView == tbl_stories  || scrollView == tbl_responces)
    {
        if (mainscrl.contentOffset.y > 154)
        {
            if (scrollView.contentOffset.y <= 0)
            {
                int temp = mainscrl.contentOffset.y + scrollView.contentOffset.y;
                mainscrl.contentOffset = CGPointMake(scrollView.contentOffset.x, temp);
                
                tbl_stories.scrollEnabled = FALSE;
                tbl_responces.scrollEnabled = FALSE;
                
                mainscrl.scrollEnabled = TRUE;
            }
            else
            {
                tbl_stories.scrollEnabled = TRUE;
                tbl_responces.scrollEnabled = TRUE;
            }
        }
        else
        {
            tbl_stories.scrollEnabled = TRUE;
            tbl_responces.scrollEnabled = TRUE;
        }
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrllView
{
    if (scrllView == scrl)
    {
        CGFloat pageWidth = scrllView.frame.size.width;
        int page = floor((scrllView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
        
        CGPoint scrollPoint;
        
        
        [self resetButtontitleColor];
        UIButton *btn;
        
        
        if (page == 0)
        {
            btn = btn_Stories;
            [btn_Stories setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            scrollPoint = CGPointMake(0, 0);
            [scrl setContentOffset:scrollPoint animated:YES];
        }
        else if (page == 1)
        {
            btn = btn_Responces;
            [btn_Responces setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            scrollPoint = CGPointMake(WIDTH*1, 0);
            [scrl setContentOffset:scrollPoint animated:YES];
        }
        
        [self switchingtheSegments:page+1];
    }
}

- (IBAction)segmentTapped:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    int indx = 0;
    indx = (int)btn.tag;
    
    selectedTab = indx;
    switch (indx)
    {
        case 1:
            [self setLineFrameUnderMenu:btn_Stories];
            break;
            
        case 2:
            [self setLineFrameUnderMenu:btn_Responces];
            break;
            
            
        default:
            break;
    }
    
    [self switchingtheSegments:indx];
    
}


#pragma mark - switchSegments
-(void)switchSegments:(UIButton *)btn
{
    int indx = 0;
    indx = (int)btn.tag;
    [self switchingtheSegments:indx];
}
-(void)switchingtheSegments:(int)idx
{
    //LoadingMenu = idx;
    
    CGPoint scrollPoint;
    switch (idx)
    {
        case 1:
            scrollPoint = CGPointMake(0, 0);
            [scrl setContentOffset:scrollPoint animated:YES];
            break;
            
        case 2:
            scrollPoint = CGPointMake(WIDTH, 0);
            [scrl setContentOffset:scrollPoint animated:YES];
            break;
            
            
        default:
            break;
    }
}

#pragma mark - Tableview Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 98;
}
/*
 -(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
 {
 return 85;
 }
 */

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == tbl_stories)
    {
        return 2;
    }
    else
    {
        return 15;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == tbl_stories)
    {
        return [self statsCell:tableView indexPath:indexPath Message:nil];
    }
    else if (tableView == tbl_responces)
    {
        return [self statsCell:tableView indexPath:indexPath Message:nil];
    }
    return nil;
}

-(Cell_statsResponces *)statsCell:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath Message:(NSMutableDictionary *)dic
{
    NSString *CellIdentifier = [NSString stringWithFormat:@"cell %ld",(long)indexPath.row];
    
    Cell_statsResponces *cell = (Cell_statsResponces *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell = nil;
    if (cell == nil)
    {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"Cell_statsResponces" owner:nil options:nil];
        cell = [topLevelObjects objectAtIndex:0];
        cell.backgroundColor = [UIColor whiteColor];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        {
            
        }
        
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
}

@end
