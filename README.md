# README

## Run staging rails console
```
heroku run rails console -r heroku-staging
```

## Run production rails console
```
heroku run rails console -r heroku
```

## Precompile assets
```
RAILS_ENV=production S3_KEY=test S3_SECRET=test SECRET_KEY_BASE=test bundle exec rake assets:precompile
```

## Deploy local staging branch to heroku staging
```
git push heroku-staging staging:master
```

## Deploy local master branch to heroku production
```
git push heroku master
```
