# vim
下面是配置步骤

###### 下载Vim-plug

1,unix

```shell
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

2, windows(powershell)

```powershell
md ~\vimfiles\autoloaduri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'(New-Object Net.WebClient).DownloadFile(  uri,  $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(    "~\vimfiles\autoload\plug.vim"  ))
```

###### clone 本工程到 `~`目录 

###### 把_vimrc文件入到'~'目录，打开vim，安装插件：`PlugInstall`

###### 安装power line 字体

###### 解压ctags(universal-ctag)，把ctag.exe和readtag.exe放到vim目录下或$PATH路径下

###### 如果系统中没有python3.5（看vim需要），安装python3.5

