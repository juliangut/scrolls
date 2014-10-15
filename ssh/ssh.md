SSH
===

Keys
----

### Location

SSH keys are located within user's home directory.

> $ cd ~/.ssh/

### Default Keys

Default keys are named ```id_rsa``` for private key and  ```id_rsa.pub``` for public key

### Key generation

> $ ssh-keygen -t rsa -C "your@email.com"

You'll be asked to enter a name for the key, if none provided default name id_rsa is used

#### Passphrase
In the process of generating a key pair you'll be asked to assign a passphrase to it to protect the key from being
accessed by other person.
It is a good thing to do although not an unavoidable step.


Configuration
-------------

### File

SSH configuration file is located under .ssh directory on user's home directory

> $ cat ~/.ssh/config

### Aliases

To alias a server and avoid selecting user to that server

```bash
Host alias_name
HostName host.example.com
User user_name
```

### Using SSH key per host

Assignation of specific SSH key file to a server/user is also possible

```bash
IdentityFile ~/.ssh/ssh_private_key_file
```

#### Example of different keys per host

```bash
// default id_rsa ssh key file name
IdentityFile ~/.ssh/user_name_ssh_private_key

Host host_one_name
HostName host_one.example.com
IdentityFile ~/.ssh/host_one_user_ssh_private_key
User host_one_user_name

Host host_two_name
HostName host_two.example.com
IdentityFile ~/.ssh/host_two_user_ssh_private_key
User host_two_user_name
```
