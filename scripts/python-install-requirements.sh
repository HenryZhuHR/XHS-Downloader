
print_info "Using Python: $(which python3)"
print_info "Installing Python requirements..."

if [ -z "${PIP_QUIET}" ]; then
    PIP_QUIET=false
fi

if [ "$PIP_QUIET" = true ]; then
    PIP_QUIET_FLAG="-q"
else
    PIP_QUIET_FLAG=""
fi

print_info "Upgrading pip..."
python3 -m pip install $PIP_QUIET_FLAG --upgrade pip

python3 -m pip install $PIP_QUIET_FLAG -r requirements.txt



# freeze the requirements 
# python3 -m pip list --format=freeze > requirements.version.txt
