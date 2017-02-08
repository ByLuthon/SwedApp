//
//  DraftsViewController.m
//  Medium
//
//  Created by macmini on 08/02/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import "DraftsViewController.h"

@interface DraftsViewController ()

@end

@implementation DraftsViewController

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
    arrDrafts = [[NSMutableArray alloc] init];
    
    
    NSMutableDictionary *dic1 = [[NSMutableDictionary alloc] init];
    [dic1 setObject:@"I have a lot of fun with this application bla bla ....." forKey:@"title"];
    [dic1 setObject:@"Edited 15 min ago" forKey:@"date"];
    [arrDrafts addObject:dic1];
    
    NSMutableDictionary *dic2 = [[NSMutableDictionary alloc] init];
    [dic2 setObject:@"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s" forKey:@"title"];
    [dic2 setObject:@"Edited 6 February" forKey:@"date"];
    [arrDrafts addObject:dic2];

    
    NSMutableDictionary *dic3 = [[NSMutableDictionary alloc] init];
    [dic3 setObject:@"@Test" forKey:@"title"];
    [dic3 setObject:@"Edited 1 February" forKey:@"date"];
    [arrDrafts addObject:dic3];

    
    NSMutableDictionary *dic4 = [[NSMutableDictionary alloc] init];
    [dic4 setObject:@"Can you please share my your updated resume :)" forKey:@"title"];
    [dic4 setObject:@"Edited 20 December, 2016" forKey:@"date"];
    [arrDrafts addObject:dic4];

    
    NSMutableDictionary *dic5 = [[NSMutableDictionary alloc] init];
    [dic5 setObject:@"Hi Jems" forKey:@"title"];
    [dic5 setObject:@"Edited 1 November, 2016" forKey:@"date"];
    [arrDrafts addObject:dic5];

    [tbl reloadData];
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


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  [arrDrafts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = [NSString stringWithFormat:@"cell %ld %ld",(long)indexPath.row,(long)indexPath.section];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell = nil;
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] ;
        cell.backgroundColor = [UIColor clearColor];
        
        cell.textLabel.text = [[arrDrafts objectAtIndex:indexPath.row] objectForKey:@"title"];
        cell.detailTextLabel.text = [[arrDrafts objectAtIndex:indexPath.row] objectForKey:@"date"];;
        
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        cell.textLabel.textColor = [UIColor blackColor];
        
        cell.detailTextLabel.font = [UIFont systemFontOfSize:12];
        cell.detailTextLabel.textColor = [UIColor lightGrayColor];

        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    AddActivityViewController *move = [self.storyboard instantiateViewControllerWithIdentifier:@"AddActivityViewController"];
    [self presentViewController:move animated:YES completion:nil];
}

@end
