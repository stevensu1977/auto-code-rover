sigint_handler() {
    pkill -P $$
    exit 1
}
trap 'sigint_handler' SIGINT

if [ -f /run/nginx.pid ]; then
    nginx -s reload -c /opt/auto-code-rover/demo_vis/nginx.conf
else
    nginx -c /opt/auto-code-rover/demo_vis/nginx.conf
fi

source ~/miniconda3/etc/profile.d/conda.sh
conda activate auto-code-rover
python main.py & 
cd ./front/ && npm run start