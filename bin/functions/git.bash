function refresh-git-project-cache {
  local git_directories=$(find ~ -type d -name Library -o -name '* *' -prune -o -name '.git' -type d -print)

  touch ~/.cache.git_projects
  mv ~/.cache.git_projects ~/.bak.cache.git_projects
  touch ~/.cache.git_projects

  for git_directory in $git_directories
  do
    project_directory=$(dirname "$git_directory")
    project_name="$(basename $project_directory)"
    echo "$project_directory"$'\t'"$project_name" >> ~/.cache.git_projects
  done

  sort -o ~/.cache.git_projects.sorted ~/.cache.git_projects
  mv ~/.cache.git_projects.sorted ~/.cache.git_projects
}
