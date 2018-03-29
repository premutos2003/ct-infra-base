#!/usr/bin/env bash
terraform output -json  | curl -H 'Content-Type: application/json' -d @- http://localhost:3000/infra