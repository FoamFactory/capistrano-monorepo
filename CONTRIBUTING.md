Contributing Information
========================

First, _thank you_ for wanting to contribute to capistrano-monorepo. This should
serve as a brief guide to contributing to the project. If you have any
questions, please feel free to send a message to
[@jwir3](mailto:jaywir3@gmail.com) for more information.

Contact Information
-------------------
  - [Email](mailto:jaywir3@gmail.com)
  - [Twitter](https://twitter.com/jwir3)

Workflow
---------

In general, we use [git-flow](http://nvie.com/posts/a-successful-git-branching-model/)
to complete our development. If you aren't a developer, don't worry too much
about this. We can work with you to ensure that your contributions are accepted
either over email or via another mechanism. [@jwir3](http://github.com/jwir3)
(the founder of this project) is happy to mentor you in any way possible. If you
are a developer, and aren't familiar with git-flow, we encourage you to read the
aforementioned article, since it is used at a number of different development
companies, and will likely be useful to you in your career.

### Detailed Workflow Process
The following is what you should do to start working on a ticket:
1. Fork the `capistrano-monorepo` repository.
2. Create a branch called `<username>/#XX-brief-description` where `<username>`
is your github username, `XX` is the ticket number, and  `brief description` is
a brief description (no more than 4 or 5 words, separated by `-`) of what you
plan to fix in the ticket.
3. Make your changes to the code. Each commit should be as small as possible,
self-contained, independently compilable, and related to the ticket. Commit
messages should be in the imperative tense, have no more than 80 characters in
their summary line, and include a reference to the ticket being fixed. See
[How I Write a Git Commit Message](https://www.jwir3.com/how-to-write-a-commit-message/)
for more information.
4. Submit a pull request from your branch to the `develop` branch of
`FoamFactory/capistrano-monorepo`. Prior to submitting your pull request, please
rebase your branch to the tip of `develop` branch of
`FoamFactory/capistrano-monorepo` and resolve any merge conflicts.
5. The pull request will be assigned to one of our core developers, who will
review it. Typically, there are minor changes that are requested, which can be
addressed with follow-up commits. Once the review is passed, the developer
reviewing your code will automatically merge your commit into `develop`.
