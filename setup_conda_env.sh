#!/bin/bash

# First, check if Conda is installed
check_conda() {
    if ! command -v conda &> /dev/null; then
        echo "Conda is not installed. Please install Miniconda or Anaconda first."
        exit 1
    fi
}

# Create a Conda environment
create_env() {
    ENV_NAME="myenv"
    PYTHON_VERSION="3.9"

    echo "Creating Conda environment: $ENV_NAME with Python $PYTHON_VERSION..."
    conda create --name "$ENV_NAME" python="$PYTHON_VERSION" -y

    echo "Environment '$ENV_NAME' created successfully!"
}

# Function to activate the Conda environment
activate_env() {
    ENV_NAME="myenv"
    echo "Activating environment '$ENV_NAME'..."
    source "$(conda info --base)/etc/profile.d/conda.sh"
    conda activate "$ENV_NAME"

    echo "Environment '$ENV_NAME' activated!"
}

# Function to install required packages
install_packages() {
    echo "Installing necessary packages..."
    conda install numpy pandas matplotlib scikit-learn -y
    echo "Packages installed successfully!"
}

# Function to display usage instructions
usage_instructions() {
    echo -e "\nTo use the environment, run:"
    echo "conda activate myenv"
    echo "To deactivate, run:"
    echo "conda deactivate"
}

# Run the script functions
check_conda
create_env
activate_env
install_packages
usage_instructions
