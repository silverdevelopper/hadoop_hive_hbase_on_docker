echo "Checking Docker network..."
if  ! docker network ls | grep -q 'big-data'; then
    echo "Creating Docker network..."
    docker network create --driver bridge big-data
else
    echo "Bigdata network exists"
fi