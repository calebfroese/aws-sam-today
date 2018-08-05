#!/bin/bash

git clone https://$GITHUB_USR:$GITHUB_PWD@github.com/calebfroese/today.github.io.git
cd today.github.io/
npm install

# Update the day
today=$(date +"%A")
echo $today
sed -i -e "s/  day = .*/  day = '$today';/g" src/app/app.component.ts

rm src/assets/poem.json
curl -s https://www.poemist.com/api/v1/randompoems >> src/assets/poem.json

# git add src/app/app.component.ts
# git add src/assets/poem.json

npm run deploy
git add docs/

git commit -m "Update for $today"
git push