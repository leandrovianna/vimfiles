# vimfiles
It's my vim configuration. This setup is focused on C++, Python and Front-End languages. Eventually, I will improve it.

Change: Now I'm adding support for Dart and Go languages.

# Installation

First, remove your previous configurations, maybe you want to make a backup:
```
rm -rf ~/.vim ~/.vimrc ~/.viminfo
```

So, clone the repo:
```
git clone https://github.com/leandrovianna/vimfiles.git ~/.vim
```
Install necessary depedencies:

```
su -c "apt-get install build-essential git curl"
```

So just:
```
cd ~/.vim
make deploy
```

Done, this setup is installed.
