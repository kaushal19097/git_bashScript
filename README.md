# git_bashScript
#Bash script designed to streamline the process of updating files on GitHub.

Please follow the below steps--
1. Clone Your Desired GitHub Repository: git clone <repository-url>
2. After cloning the repository, copy and paste the Bash script file (git_auto_pushV2.sh) into your GitHub repository directory.
3. Make the Script Executabl: run the following code in terminal-- sudo chmod +x git_auto_pushV2.sh
4. Now feel free to make any necessary changes to the files in your repository as needed.
5. To upload your changes to the GitHub repository, execute the following command in the terminal: sudo ./git_auto_pushV2.sh

Script Options Overview
1. Commit Options: The script allows you to choose between committing all files or specific files. If you select "specific," you can enter the names of the  files you want to include in the commit. Make sure to include the extension of files(.css, .js, .html) in the file name.
2. Commit Message: You will be prompted to enter a commit message, which will be associated with your changes in the GitHub repository.
3. Branch Selection: You will be asked to specify the branch you want to push your changes to. If the branch does not exist locally, you will have the option to create a new branch.
