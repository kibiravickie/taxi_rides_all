set  -e 

TAXI_TYPE=$1
YEAR=$2

URL_PREFIX = "https://github.com/DataTalksClub/nyc-tlc-data/releases/download/yellow/"

for MONTH IN (1..12); do

    FMONTH='print "%02d" ${MONTH}'

    URL="${URL_PREFIX}${TAXI_TYPE}_tripdata_${YEAR}-${MONTH}.csv.gz"
    LOCAL_PREFIX="data/raw/${TAXI_TYPE}_tripdata_${YEAR}/${FMONTH}"
    LOCAL_FILE="${TAXI_TYPE}_tripdata_${YEAR}_${FMONTH}.csv.gz"
    LOCAL_PATH="${LOCAL_PREFIX}/${LOCAL_FILE}"

    mkdir -p ${LOCAL_PREFIX}
    wget ${URL} -O ${LOCAL_PATH}
done
