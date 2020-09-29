## capistrano-monorepo
Capistrano tasks for working with a monorepo.

## Introduction
This plugin is a set of tasks designed to make interacting and deploying a set
of folders, each representing a single set of isolated code or module, within a
single repository (also called a 'monorepo'), using Capistrano.

Each of the subcomponents of the monorepo is typically deployed by setting
`:repo_tree` in the appropriate `<stage>.rb` file.

## Installation
If not using `bundler`, run:
```
gem install capistrano-monorepo
```

If using `bundler`, then in your `Gemfile`, add the following line:
```
group :development do
  ...
  gem 'capistrano-monorepo'
end
```

and run:

```
bundle install
````

## Components
Currently, the gem is composed of a single component, the `assets` component.

New components are encouraged. Please submit an issue and a PR after reading
[CONTRIBUTING.md](CONTRIBUTING.md).

### assets
The assets component is designed to allow for the deployment of assets from a
top-level folder within the monorepo into a subfolder during deployment.

Consider the following: If our monorepo contains a top level directory called
`assets`, where all images (and possibly other assets, such as stylesheets) are
stored, plus a top level directory called `app` which contains a Rails
application and depends on `assets`, we might have the following file structure
when working locally:
```
- app/
  - assets/
    - images/ -> symlink to ../../assets/images
- assets/
  - images/
    - background.png
    - logo.svg
    - ...
```

While this works when developing, once we deploy with `:repo_tree` set to the
path for `app`, we quickly realize that _only_ the `app` directory is deployed.
As such, the link in `app/assets/images` is broken, because on the deployment
target system, `../../assets/images` doesn't exist.

The `assets` component of `capistrano-monorepo` solves this by doing two things:
1. It removes any existing references to a specified assets folder within the
   deployed repository.
2. It checks out a specified `assets` folder from the top level of the monorepo
   and deploys it in a specified location in the deployment target repo.

#### Configuration
In your `deploy/<stage>.rb` file, add the following:

```
# This is an array that contains all of your asset paths. They must be unique
# (so you can't have multiple asset paths that point to the same target path)
set :monorepo_asset_paths, [
    {
        # This is the path within the deployment target where you want to deploy the
        # assets directory. For a Rails app, this will almost always be app/assets/
        asset_path: "path/to/assets/target/directory",
        
        # This is the name of the top level directory in the monorepo where the assets
        # are located.
        asset_source: "assets"
    }
]

```

Next, in your `deploy.rb` file, specify where in your pipeline you want the
deployment to happen:
```
after 'git:create_release', 'monorepo:import_assets'
```

To test, run `cap <stage> deploy --dry-run` and verify that
`monorepo:import_assets` would be executed and that the paths look correct.
