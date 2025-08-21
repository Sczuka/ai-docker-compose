if [[ ! -e "./.env" ]]; then
  echo "[INFO] Creating '.env' file..."
  if [[ -z $(which pwgen) ]]; then
    echo "[ERROR] Please install pwgen, using 'apt install pwgen'"
  fi

  PASSWORD=$(pwgen -sncr -n 30 1)

  echo "AI_MASTER_PASSWORD=${PASSWORD}" > .env
  echo "NEO4J_PASSWORD=${PASSWORD}" >> .env
  echo "NEO4J_AUTH=neo4j/${PASSWORD}" >> .env
  echo "DB_PASSWORD=${PASSWORD}" >> .env
else
  echo "[INFO] '.env' file already exists."
fi