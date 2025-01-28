# dotnet-core

A web application based on .Net Core 6.0

[[_TOC_]]

---

## ℹ About this static template

This project has been generated from dep/library/dynamic-project-templates>.

Instead of forking this project or creating a new GitLab project from this template, you are strongly advised to use [Project Booster][project-booster-link]. It will give you many options to customize this project template.

Additionally, using [Project Booster][project-booster-link], you will be able to configure one of the authentication options to secure your application deployment.

[project-booster-link]: https://docs.dep.soprasteria.com/docs/assets/project-booster/

## How to work on this project

### Software requirements

List of tools to be installed:

- .Net SDK & .Net CLI v6.0

### How to start developing

Clone the repo, and open it in your IDE.

#### Install the dependencies


Run `dotnet restore` to download and install all dependencies required for the build on your machine.

### How to run locally

#### Development server

Run `dotnet watch --project Demo` for a dev server. This will open your browser on `http://localhost:5264/`. The app will automatically reload if you change any of the source files.

#### Build

Run `dotnet build -o Demo/build` and `dotnet publish Demo/Demo.csproj -c Release -o Demo/app` to build the project. The build artifacts will be stored in the `Demo/build/` directory.

#### Test

Run `dotnet test Demo.Test/Demo.Test.csproj --collect:"XPlat Code Coverage" --logger junit` to execute the unit tests.

## Further help

To get more help on .Net Core, refer this official documentation https://learn.microsoft.com/en-us/aspnet/core/tutorials/first-mvc-app/start-mvc

## Recommended development workflow

With GitFlow, the main branch should always be releasable to production, and there should never be untested or incomplete code on the main branch.

When using this Git workflow, no one commits to the main branch but rather uses a feature and fix branches. Feature and fix branches are branches created by the developers to commit their modifications. Merge requests are then opened with these branches as the source and targeting the main branch (or production branch if it is a hotfix).

Once the changes are merged to main branch, merge requests are then opened with this main branch as the source and target the production branch

```mermaid
   gitGraph
      commit
      commit
      branch feature
      branch production
      checkout feature
      commit
      commit
      checkout main
      merge feature
      commit
      commit
      checkout production
      merge main
```

In short, we distinguish 4 types of branches:

| Branch                | Naming convention (prefix)      | Description    |
|-----------------------|---------------------------------|----------------|
| Main branch(es)       | master,main,dev                 | The main branch contains the work done for the incoming release and is the base branch for any new feature or bug fix.<br>Your team should open merge requests targeting this branch when working on the project.<br>*There is usually a single main branch per project but if your team is developing several versions simultaneously then you can have versioned main branches, e.g. `main/vX.X.X`.* |
| Test branches         | staging,pre-prod,qualif,qa,test | Test branches are optional. They are useful when you have a Continuous Deployment pipeline that is able to create a new test/qualification environment on the fly.<br>In that case you can have as many test environment as necessary and you merge from one to another until the product is ready for production. |
| Production branch(es) | prod,rel                        | The production branch represents the version of your application currently deployed to production.<br>It is the base branch for any new hot fix that should quickly be shipped to production.<br>*There is usually a single production branch per project but if your team is maintaining several versions simultaneously then it is handy to have versioned release/production branches, e.g. `rel/vX.X.X`.* |
| Feature/Fix branches  | feat,ft,hotfix,fix,dependabot,renovate   | Feature and fix branches are branches created by the developers to commit their modifications. Merge requests are then opened with these branches as the source and targeting the main branch (or production branch if it is a hotfix).<br>These branches must have a short lifespan, they must be integrated or deleted as fast as possible. |

## How does the pipeline work

In this project, there is a CI/CD pipeline that covers code quality, unit testing, security scans and also deployment to Openshift. We briefly introduce the role of each stages in pipeline below,

- init: does some initial checks before going further in the pipeline.
- build-application: builds (or promotes) the application artifacts (e.g. .war, .jar, .exe...).
- test-application: tests the application (this stage is optional as the tests can also be executed during the build-application stage).
- build-image: builds (or promotes) the application image from the Dockerfile present in the repo and the artifacts generated previously.
- analysis: runs some static analysis on the application (both security and lint/best practices).
- security-check: serves as a security gate based on the results of the static analysis done previously.
- deploy: deploys the application on an environment (test or production).
- pre-acceptance: prepares for the acceptance tests (for instance load some test data in a database).
- acceptance: executes the acceptance tests that will validate the application.
- performance: executes the performance tests that will validate the application.
- release: runs a set of actions when the application is released (i.e. merged to a production branch).
- destroy: defines a manual job that can be run to destroy a deployed environment (see deploy stage).
- .post: runs some specific actions at the end of the pipeline

## Modern Workstation

Modern Workstation is a desktop tool to automate the setup of your local workstation.

In this project, `.mw-config.yaml` file has been added to your repository.

Please refer [Modern Workstation](https://innersource.soprasteria.com/dep/assets/modern-workstation/mw-cli) repository to set up your local workstation with minimal configuration.

## Security concerns

The DEP updates the original template regularly but you can not benefit automatically from the updates.

In all cases, the project is responsible for assessing and mitigating security issues on their repositories.

The OCI images used in [.gitlab-ci.yml](.gitlab-ci.yml) file are built from the [dep/library/project-oci-images](dep/library/project-oci-images) repository. You can check periodically for potential updates of these images.

## OAuth Proxy Authentication

Your application can be protected with an oauth-proxy side container. For more details, please refer to the [DEP Documentation](https://docs.dep.soprasteria.com/docs/devsecops/oauth-proxy/)

## How to improve this template

This GitLab project template has been generated dynamically using [mustache templating](https://mustache.github.io/). If you want to help the DEP team improve this template, please open an issue or a merge request at [dep/library/dynamic-project-templates](https://innersource.soprasteria.com/dep/library/dynamic-project-templates).
