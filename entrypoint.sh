#!/bin/bash

set -e

if [[ "${GITHUB_EVENT_NAME}" == "pull_request" ]]; then
	EVENT_ACTION=$(jq -r ".action" "${GITHUB_EVENT_PATH}")
	if [[ "${EVENT_ACTION}" != "opened" ]]; then
		echo "No need to run analysis. It is already triggered by the push event."
		exit 78
	fi
fi

[[ ! -z ${INPUT_PASSWORD} ]] && SONAR_PASSWORD="${INPUT_PASSWORD}" || SONAR_PASSWORD=""

sonar-scanner \
	-Dsonar.host.url=${INPUT_HOST} \
	-Dsonar.projectBaseDir=${INPUT_PROJECTBASEDIR} \
	-Dsonar.projectKey=${INPUT_PROJECTKEY} \
	-Dsonar.projectName=${INPUT_PROJECTNAME} \
	-Dsonar.projectDescription='${INPUT_PROJECTDESCRIPTION}' \
	-Dsonar.links.homepage=${INPUT_HOMEPAGE} \
	-Dsonar.links.ci=${INPUT_CI} \
	-Dsonar.links.issue=${INPUT_ISSUE} \
	-Dsonar.links.scm=${INPUT_SCM} \
	-Dsonar.login=${INPUT_LOGIN} \
	-Dsonar.password=${INPUT_PASSWORD} \
	-Dsonar.sources=. \
	-Dsonar.sourceEncoding=UTF-8 \
	${SONAR_PASSWORD}