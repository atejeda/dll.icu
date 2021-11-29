#!/usr/bin/env bash

curl https://pyenv.run | bash

cat <<EOF > $HOME/.pyenv.profile
_PYENV_PYVERSION=${INSTALL_PYTHON_VERSION:-3.8.2}
export PYENV_ROOT=\$HOME/.pyenv
export PATH=\$PYENV_ROOT/bin:\$PATH
eval "\$(pyenv init --path)"
eval "\$(pyenv init -)"
eval "\$(pyenv virtualenv-init -)"
EOF

echo ". $HOME/.pyenv.profile" >> $HOME/.bashrc
. $HOME/.bashrc

pyenv install $_PYENV_PYVERSION
pyenv global $_PYENV_PYVERSION
python --version
