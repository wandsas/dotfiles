
mkdir -p ~/.logs
exec sh ~/.xinitrc > ~/.log/xsession-errors 2>&1
