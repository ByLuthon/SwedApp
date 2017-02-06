//
//  HomeViewController.m
//  Medium
//
//  Created by macmini on 03/02/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad
{
    
    //Tranding
    [collection_tranding registerClass:[CollectionCell_Trending class] forCellWithReuseIdentifier:@"CollectionCell_Trending"];
    
    //Publication
    [collection_publication registerClass:[CollectionCell_Publications class] forCellWithReuseIdentifier:@"CollectionCell_Publications"];

    [self setInitParam];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


-(void)setInitParam
{

    
    [collection_tranding reloadData];
    [collection_publication reloadData];
    
    tbl.tableHeaderView = view_header;
    
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

- (IBAction)search:(id)sender {
}

- (IBAction)Publications:(id)sender
{
    PublicationsViewController *move = [self.storyboard instantiateViewControllerWithIdentifier:@"PublicationsViewController"];
    [self.navigationController pushViewController:move animated:YES];
}

- (IBAction)Personalize:(id)sender
{
    PersonalizeViewController *move = [self.storyboard instantiateViewControllerWithIdentifier:@"PersonalizeViewController"];
    [self.navigationController pushViewController:move animated:YES];
}

#pragma mark - collectionview delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (collectionView == collection_tranding)
    {
        return 10;
    }
    else
    {
        return 5;
    }
}


- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout  *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView == collection_tranding)
    {
        return CGSizeMake(104, 90); // as per your cell size
    }
    else
    {
        return CGSizeMake(160, 140); // as per your cell size
    }
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView == collection_tranding)
    {
        static NSString *cellIdentifier = @"CollectionCell_Trending";
        CollectionCell_Trending *cell = (CollectionCell_Trending *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
        // Return the cell
        return cell;
    }
    else
    {
        static NSString *cellIdentifier = @"CollectionCell_Publications";
        CollectionCell_Publications *cell = (CollectionCell_Publications *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
        // Return the cell
        return cell;
    }
    return nil;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
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
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    HomeDetailsViewController *move = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeDetailsViewController"];
    [self.navigationController pushViewController:move animated:YES];
}

@end
