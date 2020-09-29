require 'pathname'

##
# Import assets from a top level monorepo directory into the current working
# directory.
#
# When you use :repo_tree to deploy a specific directory of a monorepo, but your
# asset repository is in a different directory, you need to check out this
# top-level directory and add it to the deployment path. For example, if your
# monorepo directory structure looks something like:
#
# - /app
#   - src/
#     - assets -> symlink to ../../assets
# - /assets
# - /api
#
# And you want to deploy /app, the symlink to the upper directory won't exist if
# capistrano is configured to use :repo_tree "app". In order to overcome this,
# this task checks out a specified piece of the larger monorepo (in this case,
# the assets directory), and places it in the deployment directory at a
# specified location.
#
# Configuration:
# In your deploy/<stage>.rb file, you will need to specify a variable
# `:monorepo_asset_paths` that contains an array of objects. Each of
# these objects must contain the following variables:
#   - asset_path - The location within the deployment directory where the
#                  assets should be placed. Relative to the deployment working
#                  directory.
#   - asset_source - The location of the top-level asset folder in the
#                    monorepo. Relative to the top level of the monorepo (i.e.
#                    the directory that would be used as a deployment if
#                    :repo_tree was not specified).
#
# In the above example, you would specify:
#
# set :monorepo_asset_paths, [
#   {
#     asset_path: "src/assets",
#     asset_source: "assets"
#   }
# ]
#
namespace :monorepo do
  desc "Import assets from a top-level monorepo directory"
  task :import_assets do
   on roles(:all) do |host|
      within repo_path do
        fetch(:monorepo_asset_paths).each { |asset|
          final_asset_location = "#{release_path}/#{asset[:asset_path]}"
          asset_stat_result = capture "stat", "-t", "#{final_asset_location}"
          asset_stat_result = asset_stat_result.split(" ")
          if asset_stat_result[0] == "#{final_asset_location}"
            info "Removing existing asset directory #{final_asset_location}..."
            execute "rm", "-rf", "#{final_asset_location}"
          end

          source_dir = Pathname.new(final_asset_location).parent.to_s
          info "Importing assets to #{source_dir}/#{asset[:asset_source]}"
          execute "GIT_WORK_TREE=#{source_dir}", :git, "checkout", "#{fetch(:branch)}", "--", "#{asset[:asset_source]}"

          info "Moving asset directory #{source_dir}/#{asset[:asset_source]} to #{final_asset_location}..."
          execute :mv, "#{source_dir}/#{asset[:asset_source]}", "#{final_asset_location}"
        }
      end
    end
  end
end
