CWD=$(pwd)
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

function handle_sigint() {
    echo "SIGINT received. Cleaning up..."
    # Add your cleanup logic here
    cd "$CWD"
}

# Trap SIGINT and associate it with the handle_sigint function
trap 'handle_sigint' SIGINT

cd "$SCRIPT_DIR"

mvn verify

cd "$CWD"

java -jar "$SCRIPT_DIR/target/quarkus-app/quarkus-run.jar"