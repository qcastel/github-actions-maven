# github-actions-maven

The GitHub Action for Maven wraps the Maven CLI to enable Maven commands to be run. This can be used to run every Maven Command.

This repo contains two github actions around maven:
- maven-action: generic maven action, allowing you to simply run a maven command. It will be executed into a docker image, with Java 11 and maven.
- release: allowing you to release your java applications by a bot. Very handy if you want to automatise the release for each of your commits.

Note: The release will allow you to setup a GPG key.

# Usage

## Custom maven command

To build your java app

```
    - name: Build and Test	
      uses: qcastel/github-actions-maven/actions/maven@master
      with:
        maven-args: "clean install"
```

If you need to setup a private maven repository:

```
    - name: Build and Test	
      uses: qcastel/github-actions-maven/actions/maven@master
      with:
        maven-repo-server-id: YOUR_SERVER
        maven-repo-server-username: YOUR_BUILD_BOT_USER
        maven-repo-server-password: YOUR_BUILD_BOT_PASSWORD
        maven-args: "clean install"
```

## Maven release

```
 - name: Release
      uses: qcastel/github-actions-maven/actions/release@master
      with:
        release-branch-name: "master"
        gpg-enabled: "true"
        gpg-key-id: ${{ secrets.GITHUB_GPG_KEY_ID }}
        gpg-key: ${{ secrets.GITHUB_GPG_KEY }}
        maven-repo-server-id: f${{ secrets.MVN_REPO_PRIVATE_REPO_USER }}
        maven-repo-server-username: ${{ secrets.MVN_REPO_PRIVATE_REPO_USER }}
        maven-repo-server-password: ${{ secrets.MVN_REPO_PRIVATE_REPO_PASSWORD }}
        maven-args: "-Dmaven.javadoc.skip=true -DskipTests -DskipITs -Ddockerfile.skip -DdockerCompose.skip"
        git-release-bot-name: "release-bot"
        git-release-bot-email: "release-bot@example.com"
        access-token: ${{ secrets.GITHUB_ACCESS_TOKEN }}
```

# License
The Dockerfile and associated scripts and documentation in this project are released under the MIT License.
