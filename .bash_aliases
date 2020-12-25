#git
alias status="git status -sb"
alias new="git checkout -b"
alias ck="git checkout"
alias vi="$which vim"
alias cdev="git checkout development-deployment && git pull origin development-deployment"
alias psdev="git push origin development-deployment"
alias pldev="git pull origin development-deployment"
alias mdev="git merge development-deployment "
alias cm="git checkout master && git pull origin master"
alias gl="git log --oneline -n 10"
#kubernetes
alias k="kubectl"
#aws cli
alias cfvalid="aws cloudformation validate-template --template-body"
alias scterminate="aws servicecatalog terminate-provisioned-product --provisioned-product-name"

