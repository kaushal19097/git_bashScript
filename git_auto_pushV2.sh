#!/bin/bash

initialize_repository() {
  if [ ! -d ".git" ]; then
    read -p "Enter the name of the remote repository (e.g., https://github.com/user/repo.git): " repoName
    git init
    git remote add origin "$repoName"
  fi
}

commit_and_push() {
  read -p "Do you want to commit all files or specific files? (all/specific): " choice

  if [[ "$choice" == "all" ]]; then
    git add .
    git reset -- git_auto_pushV2.sh 
  elif [[ "$choice" == "specific" ]]; then
    read -p "Enter the names of the files you want to commit (separated by space): " -a fileNames
    for file in "${fileNames[@]}"; do
      if [[ -f "$file" ]]; then
        git add "$file"
      else
        echo "File '$file' does not exist. Skipping."
      fi
    done
  else
    echo "Invalid choice. Exiting."
    exit 1
  fi

  read -p "Enter your commit message: " commitMessage
  git commit -m "$commitMessage"

  read -p "Enter the branch name you want to push to: " branchName

  if ! git show-ref --verify --quiet refs/heads/"$branchName"; then
    echo "Branch '$branchName' does not exist."
    read -p "Do you want to create a new branch? (y/n): " createBranch

    if [[ "$createBranch" == "y" ]] || [[ "$createBranch" == "Y" ]]; then
      git checkout -b "$branchName"
    else
      echo "Exiting without creating a new branch."
      exit 1
    fi
  else
    git checkout "$branchName"
  fi

  git push origin "$branchName"
}

if [ ! -d ".git" ]; then
  echo "This directory is not a Git repository."
  read -p "Do you want to initialize it as a Git repository? (y/n): " response
  if [[ "$response" == "y" ]] || [[ "$response" == "Y" ]]; then
    initialize_repository
  else
    echo "Exiting script."
    exit 1
  fi
fi

commit_and_push

if [ $? -eq 0 ]; then
  echo "Changes have been successfully pushed to the repository."
else
  echo "An error occurred during the push. Check your authentication or repository status."
fi
