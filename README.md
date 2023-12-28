<h1 align="center" id="title">xenonStackLinuxTask</h1>

<h2>🛠️ Installation Steps:</h2>

<p>1. Switch to root user first to create custom command enter root password and hit enter</p>

```
sudo -i
```

<p>2. Go to bin directory where all the commands are stored</p>

```
cd /usr/bin/
```

<p>3. Create new command</p>

```
nano internsctl
```

<p>4. Code every functions needed</p>

```
// refer to uploaded bash file (.sh) in this repo
```

<p>5. Make the script executable from everywhere</p>

```
chmod +x internsctl
```

<p>6. Open a new terminal and test the each script commands</p>

<p>7. To get help</p>

```
internsctl --help
```
<img src="https://github.com/the-satyajeet/xenonStackLinuxTask/blob/main/screenshots/help.png" alt="project-screenshot">

<p>8. To print the version</p>

```
internsctl --version
```
<img src="https://github.com/the-satyajeet/xenonStackLinuxTask/blob/main/screenshots/version.png" alt="project-screenshot">

<p>9. T print manual script</p>

```
man internsctl
```
<img src="https://github.com/the-satyajeet/xenonStackLinuxTask/blob/main/screenshots/man.png" alt="project-screenshot">

<p>10. CPU and memory information</p>

```
internsctl cpu getinfo
internsctl memory getinfo
```
<img src="https://github.com/the-satyajeet/xenonStackLinuxTask/blob/main/screenshots/cpu.png" alt="project-screenshot">
<img src="https://github.com/the-satyajeet/xenonStackLinuxTask/blob/main/screenshots/memory.png" alt="project-screenshot">

<p>11. Create a new user, and list all users or users with and without sudo permissions</p>

```
internsctl user create newuser_name   
internsctl user list internsctl user list --sudo-only
```
<img src="https://github.com/the-satyajeet/xenonStackLinuxTask/blob/main/screenshots/intermediate.png" alt="project-screenshot">

<p>13. Test with options to get specific information about the file</p>

```
internsctl file getinfo --size /path/to/hello.txt
internsctl file getinfo --permissions /path/to/hello.txt
internsctl file getinfo --owner /path/to/hello.txt
internsctl file getinfo --last-modified /path/to/hello.txt
```

<img src="https://github.com/the-satyajeet/xenonStackLinuxTask/blob/main/screenshots/advanced.png" alt="project-screenshot">
  
  
<h2>💻 Built with</h2>

Technologies used in the project:

*   Bash Language
*   RedHat Linux 9
