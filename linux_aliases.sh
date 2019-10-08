#linux aliases
echo "alias tf='terraform'" >> ~/.bash_profile
echo "alias tfa='tf apply -auto-approve'" >> ~/.bash_profile
echo "alias tfd='tf destroy -f'" >> ~/.bash_profile

echo "alias wip=\"git add . && git commit -m \"wip\" && git push\"" >> ~/.bash_profile
echo "alias gs='git status'" >> ~/.bash_profile
echo "alias gaa='git add .'" >> ~/.bash_profile
echo "alias gau='git add -u'" >> ~/.bash_profile
echo "alias gc='git commit -m'" >> ~/.bash_profile
echo "alias k='kubectl'" >> ~/.bash_profile

echo "alias d='docker'" >> ~/.bash_profile
echo "alias dc='docker-compose'" >> ~/.bash_profile
echo "alias r='ruby'" >> ~/.bash_profile

echo "alias sbp='source ~/.bash_profile'" >> ~/.bash_profile
echo "alias ebp='vim ~/.bash_profile'" >> ~/.bash_profile
echo "alias cbp='cat ~/.bash_profile'" >> ~/.bash_profile
echo "alias editor=vim" >> ~/.bash_profile

source ~/.bash_profile
