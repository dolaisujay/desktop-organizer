===========================================
      1-CLICK AUTO GIT PUSH TOOL
===========================================

This tool allows you to push any folder to a GitHub repository simply by entering the repository URL and pressing a single number.

HOW TO USE IT:
--------------
1. Copy the "AutoGitPush.bat" file.
2. Paste it directly inside the folder containing the project/files you want to upload to Git.
3. Double-click "AutoGitPush.bat" to run it.

MENU OPTIONS EXPLAINED:
-----------------------
[1] Setup Git Repository
Run this option the very first time you are pushing a folder.
It will ask for your Git Repository URL. 
- If your repo is public: Enter the normal GitHub URL.
- If your repo is private/requires authentication: Paste the URL with your Personal Access Token (PAT) included like this:
  https://YOUR_GITHUB_TOKEN@github.com/Username/RepositoryName.git

[2] Auto-Commit and Push ALL files
Once you have run the setup (Option 1) at least once, use Option 2!
It will automatically gather all new or modified files, commit them with the current date/time, and push them to GitHub. No typing required!

[3] Enable Git LFS for Large Files
Use this option ONLY if you have files larger than 100MB (like huge .zip or .mp4 files). GitHub rejects files over 100MB unless Git Large File Storage (LFS) is enabled. 
Press 3 and follow the prompt to ensure your massive files push successfully.

[4] Exit
Closes the menu.

Enjoy hassle-free pushing!
