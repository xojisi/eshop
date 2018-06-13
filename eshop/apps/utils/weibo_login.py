# -*- coding:utf-8 -*-
__author__ = 'xojisi'

def get_auth_url():
    weibo_auth_url = "https://api.weibo.com/oauth2/authorize"
    redirect_uri = "http://120.79.223.17:8000/complete/weibo"
    auth_url = weibo_auth_url + \
               "?client_id={client_id}&redirect_uri={redirect_url}".\
                   format(client_id='3399394341',redirect_url=redirect_uri) + '&response_type=code'
    print(auth_url)

def get_access_token(code=""):
    access_token_url = "https://api.weibo.com/oauth2/access_token"
    import requests
    redict = requests.post(access_token_url, data={
        "client_id" : 3399394341,
        "client_secret" : "b81017536f3c40c02ca625cedd2c1d39",
        "grant_type" : "authorization_code",
        "code" : code,
        "redirect_uri" : "http://120.79.223.17:8000/complete/weibo",
    })
    pass

def get_user_info(access_token="",uid=""):
    user_url = "https://api.weibo.com/2/users/show.json?access_token={token}&uid={uid}".\
        format(token=access_token,uid=uid)

    print(user_url)

if __name__ == "__main__":
    # get_auth_url()
    # get_access_token(code="04331618d4d31642f283fb66e5ac4c46")
    get_user_info(access_token="2.00eVrpEDzkVDiD7b294004d5GVC87D",uid="2819864262")