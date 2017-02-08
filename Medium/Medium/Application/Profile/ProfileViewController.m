//
//  ProfileViewController.m
//  Medium
//
//  Created by macmini on 06/02/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad
{
    [self setInitParam];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setInitParam
{
    arrSection1 = [[NSMutableArray alloc] init];
    [arrSection1 addObject:@"Drafts"];
    [arrSection1 addObject:@"Stats"];
    [arrSection1 addObject:@"Bookmarks"];
    [arrSection1 addObject:@"Reading history"];
    [arrSection1 addObject:@"Follow your intrests"];

    arrSection2 = [[NSMutableArray alloc] init];
    [arrSection2 addObject:@"Settings"];
    [arrSection2 addObject:@"Help"];
    
    
   // tbl.tableHeaderView = subview_profile;
   // [tbl reloadData];
}


- (IBAction)viewProfile:(id)sender
{
    ViewProfileViewController *move = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewProfileViewController"];
    [self.navigationController pushViewController:move animated:YES];
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
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 80;
    }
    else
    {
        return 22;
    }
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return subview_profile;
    }
    else
    {
        UIView *headerVw = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 22)] ;
        //headerVw.backgroundColor=[UIColor colorWithRed:236.0/255.0 green:236.0/255.0 blue:236.0/255.0 alpha:1.0];  // set color of header
        headerVw.backgroundColor = self.view.backgroundColor;;
        
        return headerVw;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 44;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return  0;
    }
    else if (section == 1)
    {
        return  [arrSection1 count];
    }
    else if (section == 2)
    {
        return [arrSection2 count];
    }
    else
    {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = [NSString stringWithFormat:@"cell %ld %ld",(long)indexPath.row,(long)indexPath.section];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell = nil;
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
        
        if (indexPath.section == 1)
        {
            cell.textLabel.text = [arrSection1 objectAtIndex:indexPath.row];
        }
        else if (indexPath.section == 2)
        {
            cell.textLabel.text = [arrSection2 objectAtIndex:indexPath.row];
        }
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    if (indexPath.section == 1)
    {
        if ([[arrSection1 objectAtIndex:indexPath.row] isEqualToString:@"Drafts"])
        {
            DraftsViewController *move = [self.storyboard instantiateViewControllerWithIdentifier:@"DraftsViewController"];
            [self.navigationController pushViewController:move animated:YES];
        }
        else if ([[arrSection1 objectAtIndex:indexPath.row] isEqualToString:@"Stats"])
        {
            StatsViewController *move = [self.storyboard instantiateViewControllerWithIdentifier:@"StatsViewController"];
            [self.navigationController pushViewController:move animated:YES];
        }
        else if ([[arrSection1 objectAtIndex:indexPath.row] isEqualToString:@"Bookmarks"])
        {
            BookmarksViewController *move = [self.storyboard instantiateViewControllerWithIdentifier:@"BookmarksViewController"];
            move.isshowBack = TRUE;
            [self.navigationController pushViewController:move animated:YES];
        }
        else if ([[arrSection1 objectAtIndex:indexPath.row] isEqualToString:@"Reading history"])
        {
            HistoryViewController *move = [self.storyboard instantiateViewControllerWithIdentifier:@"HistoryViewController"];
            [self.navigationController pushViewController:move animated:YES];
        }
        else if ([[arrSection1 objectAtIndex:indexPath.row] isEqualToString:@"Follow your intrests"])
        {
            PersonalizeViewController *move = [self.storyboard instantiateViewControllerWithIdentifier:@"PersonalizeViewController"];
            [self.navigationController pushViewController:move animated:YES];
        }
    }
    else if (indexPath.section == 2)
    {
        if ([[arrSection2 objectAtIndex:indexPath.row] isEqualToString:@"Settings"])
        {
            SettingsViewController *move = [self.storyboard instantiateViewControllerWithIdentifier:@"SettingsViewController"];
            [self.navigationController pushViewController:move animated:YES];
        }
        else
        {
            NSString *iTunesLink = @"https://medium-external.ada.support/chat/";
            //[[UIApplication sharedApplication] openURL:[NSURL URLWithString:iTunesLink]];
            
            SFSafariViewController *svc = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:iTunesLink]];
            svc.delegate = self;
            [self presentViewController:svc animated:YES completion:nil];

        }
    }

}
#pragma mark - SafariController Delegate

- (void)safariViewControllerDidFinish:(SFSafariViewController *)controller
{
    [self dismissViewControllerAnimated:true completion:nil];
}

@end
