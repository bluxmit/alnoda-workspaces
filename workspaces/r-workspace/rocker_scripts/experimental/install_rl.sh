#!/bin/bash
set -e

python -m venv /opt/venv/rl
. /opt/venv/rl/bin/activate

pip install wheel
pip install gym tensorflow keras keras-rl

chown -R :staff /opt/venv/rl
chmod g+rx /opt/venv/rl
