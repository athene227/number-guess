git filter-branch --env-filter '
WRONG_EMAIL="wrong@example.com"
NEW_NAME="athene227"
NEW_EMAIL="athene227@gmail.com"

if [ "$GIT_COMMITTER_EMAIL" = "$WRONG_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$NEW_NAME"
    export GIT_COMMITTER_EMAIL="$NEW_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$WRONG_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$NEW_NAME"
    export GIT_AUTHOR_EMAIL="$NEW_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags
git update-ref -d refs/original/refs/heads/master
git remote remove origin
git remote add origin 
git branch -M main
git push -u origin main