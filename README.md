### Hexlet tests and linter status:
[![Actions Status](https://github.com/NikolayIz/php-project-57/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/NikolayIz/php-project-57/actions)

### Sonar status quality
[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=NikolayIz_php-project-57&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=NikolayIz_php-project-57)

### Link of project
https://php-project-57-3rcd.onrender.com/

### Start project
```
git clone git@github.com:NikolayIz/php-project-57.git
cd ~/php-project-57
mv .github ../.github_backup
mv README.md ../README_backup
mv .git ../git_backup
composer create-project --prefer-dist laravel/laravel .
mv ../git_backup .git
mv ../.github_backup .github
mv ../README_backup README.md
git add .
git commit -m "Initialize Laravel project"
git push
```