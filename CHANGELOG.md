# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [v1.2.1] - 2020-08-26

### Added

- fix bash passing.

## [v1.2.0] - 2020-08-26

### Added

- Add more properties.

```bash
	-Dsonar.projectName=${INPUT_PROJECTNAME} \
	-Dsonar.projectDescription=${INPUT_PROJECTDESCRIPTION} \
	-Dsonar.links.homepage=${INPUT_HOMEPAGE} \
	-Dsonar.links.ci=${INPUT_CI} \
	-Dsonar.links.issue=${INPUT_ISSUE} \
	-Dsonar.links.scm=${INPUT_SCM} \
```

## [v1.1.0] - 2020-08-26

### Added

- Add `-Dsonar.projectKey=${INPUT_PROJECTKEY} \`