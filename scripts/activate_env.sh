#!/bin/bash

# set project root
export PROJECT_ROOT=$(pwd)

# load environment variables
set -a
source .env
set +a

# create necessary directories
mkdir -p "${AIRFLOW_HOME}"
mkdir -p "${AIRFLOW__CORE__DAGS_FOLDER}"
mkdir -p "${AIRFLOW__LOGGING__BASE_LOG_FOLDER}"

# generate Fernet key (if needed)
if [ -z "${AIRFLOW__CORE__FERNET_KEY}" ]; then
    echo "Generating new Fernet key..."
    FERNET_KEY=$(python -c "from cryptography.fernet import Fernet; print(Fernet.generate_key().decode())")
    echo "AIRFLOW__CORE__FERNET_KEY=$FERNET_KEY" >> .env
fi

# activate poetry virtual environment
poetry shell

# Note: initialize Airflow (if needed)
if [ ! -f "${AIRFLOW_HOME}/airflow.db" ]; then
    echo "Initializing Airflow database..."
    airflow db init
    
    echo "Creating admin user..."
    airflow users create \
        --username admin \
        --firstname Admin \
        --lastname User \
        --role Admin \
        --email admin@example.com \
        --password admin
fi

echo "Environment activated and Airflow initialized!"
echo "Run 'airflow webserver' to start the web interface"
echo "Run 'airflow scheduler' to start the scheduler"