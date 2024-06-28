#!/bin/bash

dir="phoenixbackend"

# Check if the directory already exists
if [ -d "$dir" ]; then
    read -p "$dir exists. Remove and recreate it? (y/n): " choice
    if [[ $choice == "y" ]]; then
        rm -rf "$dir"
        echo "Removed existing directory."
    else
        echo "Skipping directory creation."
        exit 1
    fi
fi

# Attempt to create the directory
mkdir -p "$dir" && echo "Directory created." || { echo "Failed to create directory."; exit 1; }

cd "$dir" || { echo "Failed to enter directory."; exit 1; }

# Define an array of repository names
repos=("fullstack" "phoenixapi-v1" "phoenixcheckin-v1" "phoenixcrew-v1" "phoenixinfo-v1" "phoenixjs" "phoenixmain-v1" "phoenixparticipate-v1")

# Loop through the array and clone each repository
for repo in "${repos[@]}"; do
    git clone "git@github.com:phoenixlan/${repo}.git" > /dev/null 2>&1
    echo "Cloning ${repo}"
done


echo "seting up the env files...."

cd fullstack/phoenix-development/

cat << EOF > .env
JWT_SECRET="test123!"

VIPPS_CLIENT_ID=
VIPPS_CLIENT_SECRET=
VIPPS_SUBSCRIPTION_KEY=
VIPPS_CALLBACK_URL=https://api.test.phoenix.no/hooks/vipps
VIPPS_MERCHANT_SERIAL_NUMBER=

STRIPE_API_KEY=
STRIPE_ENDPOINT_SECRET=
EOF


cat << EOF >  .db_env
POSTGRES_PASSWORD=example
POSTGRES_USER=phoenix
DB_HOST=db
EOF


cat << EOF > .mailgun_env
MAILGUN_DOMAIN= 
MAILGUN_API= 
MAILGUN_API_KEY= 
MAILGUN_FROM_EMAIL=
EOF


cat << EOF > .rabbitmq_env
RABBITMQ_DEFAULT_USER=phoenix
RABBITMQ_DEFAULT_PASS=testing

RABBITMQ_USER=phoenix
RABBITMQ_PASSWORD=testing
RABBITMQ_HOST=rabbitmq
EOF


cat << EOF >.participate_env
STRIPE_PK=" "
EOF

echo "Running yarn in the yarn repos"

cd ../../

yarnefolders=("phoenixcheckin-v1" "phoenixcrew-v1" "phoenixinfo-v1" "phoenixjs" "phoenixmain-v1" "phoenixparticipate-v1")

for yarnefolder in "${yarnefolders[@]}"; do
    if [ -d "$yarnefolder" ]; then
        pushd "$yarnefolder"
        yarn || { echo "Yarn failed in $yarnefolder"; popd; continue; }
        popd
    else
        echo "Directory $yarnefolder does not exist."
    fi
done

echo "running yarn build in phoenixjs"

if [ -d "phoenixjs" ]; then
    pushd phoenixjs
    yarn build || { echo "Yarn build failed in phoenixjs"; popd; exit 1; }
    popd
else
    echo "Directory phoenixjs does not exist."
    exit 1
fi

echo "Its done, congratulations you have fullstack setup Now!!."