*** Settings ***
Library                Collections
Library                DateTime
Library                OperatingSystem
Library                String
Library                RequestsLibrary
Library                DatabaseLibrary
Variables              ${CURDIR}/configs/${ENV}/env_config.yaml
Variables              ${CURDIR}/configs/common/api_path.yaml

*** Variables ***
${ENV}    dev 