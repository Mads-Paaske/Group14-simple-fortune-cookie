set -e

URL="${1:-http://localhost:8080/healthz}"

echo "Test is starting (debug to make sure we start it)"

STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$URL")

if [ "$STATUS" = "200" ]; then
  echo "Test passed $STATUS"
else
  echo "Test didnt pass $STATUS"
fi

exit 0