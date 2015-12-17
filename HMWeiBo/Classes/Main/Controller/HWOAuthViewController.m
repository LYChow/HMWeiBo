//
//  HWOAuthViewController.m
//  HMWeiBo
//
//  Created by lychow on 12/16/15.
//  Copyright © 2015 LY'S MacBook Air. All rights reserved.
//

#import "HWOAuthViewController.h"
#import "AFNetworking.h"
#import "HWAccount.h"
#import "HWAccountTool.h"
#import "HWTabbarController.h"

#define APPKey         @"1100997733"
#define APPSecret      @"5fbfde2d451d5ec23ff5624b6586c769"
#define RedirectUri    @"http://baidu.com"
@interface HWOAuthViewController()<UIWebViewDelegate,NSURLSessionDelegate>
@end
@implementation HWOAuthViewController

-(void)viewDidLoad
{
    // 1.创建一个webView
    UIWebView *webView = [[UIWebView alloc] init];
    webView.frame = self.view.bounds;
    webView.delegate = self;
    [self.view addSubview:webView];
    
    // 2.用webView加载登录页面（新浪提供的）
    // 请求地址：https://api.weibo.com/oauth2/authorize
    /* 请求参数：
     client_id	true	string	申请应用时分配的AppKey。
     redirect_uri	true	string	授权回调地址，站外应用需与设置的回调地址一致，站内应用需填写canvas page的地址。
     */
    NSString *urlString =[NSString stringWithFormat:@"https://api.weibo.com/oauth2/authorize?client_id=%@&redirect_uri=%@",APPKey,RedirectUri];
    NSURL *url =[NSURL URLWithString:urlString];
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *urlString =request.URL.absoluteString;
    NSRange range =[urlString rangeOfString:@"code="];
    if (range.length) {
        NSString *code =[urlString substringFromIndex:range.location+range.length];
        
        [self requestAccessTokenWithCode:code];
        
        return NO;
    }
    return YES;
}

-(void)requestAccessTokenWithCode:(NSString *)code
{
  //请求AccessCode的参数列表
    /*
     URL：https://api.weibo.com/oauth2/access_token
     
     请求参数：
     client_id：申请应用时分配的AppKey
     client_secret：申请应用时分配的AppSecret
     grant_type：使用authorization_code
     redirect_uri：授权成功后的回调地址
     code：授权成功后返回的code
     */

    //1.请求管理者
        AFHTTPRequestOperationManager *mananger =[AFHTTPRequestOperationManager manager];
//    AFHTTPSessionManager *mananger =[AFHTTPSessionManager manager];
//    mananger.responseSerializer = [AFJSONResponseSerializer serializer];
    
    
//    NSMutableURLRequest *request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://api.weibo.com/oauth2/access_token"]];
//    request.HTTPMethod=@"POST";
   
//    ASIFormDataRequest *request =[ASIFormDataRequest requestWithURL:[NSURL URLWithString:@"https://api.weibo.com/oauth2/access_token"]];
    

    
    
    //2.请求参数
   NSMutableDictionary *params =[NSMutableDictionary dictionary];
    params[@"client_id"] =@"1100997733";
    params[@"client_secret"] =@"5fbfde2d451d5ec23ff5624b6586c769";
    params[@"grant_type"] =@"authorization_code";
    params[@"redirect_uri"] =@"http://baidu.com";
    params[@"code"] =code;
    
    [mananger POST:@"https://api.weibo.com/oauth2/access_token" parameters:params success:^(AFHTTPRequestOperation *operation, NSDictionary * responseObject) {
        //1.把获取的AccessToken等其他信息归档在本地
        HWAccount *account =[HWAccount initWithDict:responseObject];
        
        //2.把model 归档到沙盒
        [HWAccountTool archiveToFilePathWithModel:account];
  
        UIWindow *window =[[UIApplication sharedApplication] keyWindow];
        window.rootViewController =[[HWTabbarController alloc] init];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];

    

    
//    __weak typeof(request) weakRequest = request;
//    [request setCompletionBlock:^{
//        NSLog(@"%@----",weakRequest);
//    }];
    
    
//    request.HTTPBody=data;
//    
//    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    
//    NSOperationQueue *queue =[NSOperationQueue mainQueue];
//[NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError)
//    {
//        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
//        NSLog(@"-----response---%@",dict);
//}];
    
    //发送请求
//    [mananger POST:@"https://api.weibo.com/oauth2/access_token" parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//        
//    } progress:^(NSProgress * _Nonnull uploadProgress) {
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//    
//        NSLog(@"success---%@",responseObject);
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//         NSLog(@"failue---%@",error);
//        
//    }];
}




-(void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"webViewDidStartLoad");
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"webViewDidFinishLoad");
}

@end
