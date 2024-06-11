#!bin/bash
su developers
cd~
cd astrovidhi-backend
git checkout astrovidhi-prod
git pull
pm2 start app.js
cd..
cd astrovidhi-cron-jobs
git checkout astrovidhi-prod
git pull
pm2 start ecosystem.config.js
cd..


