#!/bin/sh

echo "Starting Metabase..."

export MB_JETTY_PORT=12345
java -jar ~/metabase/metabase.jar
