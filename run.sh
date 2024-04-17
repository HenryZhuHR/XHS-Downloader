ENV_NAME="XHS-Downloader"
CUSTOM_PYTHON_VERSION=3.12

PROJECT_HOME=$(pwd)
ENV_PATH=$PROJECT_HOME/.env

if ! command -v conda &> /dev/null
then
    echo "conda could not be found"
    exit
fi

if [ ! -d $ENV_PATH ]; then
    SYS_PYTHON_VERSION=$(python3 -c 'import sys; print(".".join(map(str, sys.version_info[:3])))')
    if [ -z "$CUSTOM_PYTHON_VERSION" ]; then
        ENV_PYTHON_VERSION=$SYS_PYTHON_VERSION
    else
        ENV_PYTHON_VERSION=$CUSTOM_PYTHON_VERSION
    fi
    conda create -p .env -y python=$ENV_PYTHON_VERSION 
else
    echo "Conda environment '$ENV_PATH' already exists."
fi

echo "Activating conda environment '$ENV_PATH'..."
eval "$(conda shell.bash hook)"
conda activate $ENV_PATH
echo "Activated $(python --version) in ($ENV_PATH)"


python3 -m pip install -r requirements.txt

python3 main.py