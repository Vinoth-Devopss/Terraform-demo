#!/bin/bash
sudo su developers																					
cd /home/developers/astrovidhi-backend
git checkout astrovidhi-prod
git pull
pm2 start app.js
cd ..
cd /home/developers/astrovidhi-cron-jobs
git checkout astrovidhi-prod
git pull
pm2 start ecosystem.config.js
cd ..
