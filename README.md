# status_updater

Simple ruby script for setting a github commit's status.

## usage

```
$ docker run --rm partkyle/status_updater --help
Usage: update-github-status.rb [options]
        --token [TOKEN]              TOKEN to access GitHub with
        --git-url [GIT_URL]          GIT_URL to update
        --commit [COMMIT]            COMMIT to update
        --status [STATUS]            STATUS to update
        --context [CONTEXT]          CONTEXT to update
        --target-url [TARGET_URL]    TARGET_URL to update
```
