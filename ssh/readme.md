# SSH

## Keys

### Location

SSH keys are located within user's home directory.

```bash
cd ~/.ssh/
```

### Default Keys

Default keys are named `id_rsa` for private key and `id_rsa.pub` for public key

### Key generation

```bash
ssh-keygen -t rsa -b 2048 -C "your@email.com"
```

You'll be asked to enter a name for the key, if none provided default name `id_rsa` is used

#### Passphrase

In the process of generating a key pair you'll be asked to assign a passphrase to it to protect the key from being
accessed by another person.

It is a good thing to do although not a mandatory step.

## Configuration

### File

SSH configuration file is located under .ssh directory on user's home directory

```bash
cat ~/.ssh/config
```

## Certificates

### PEM

In order to generate a `.pem` certificate from generated ssh key

```bash
openssl rsa -in ~/.ssh/id_rsa -outform pem > ~/.ssh/id_rsa.pem
chmod 700 ~/.ssh/id_rsa.pem
```

If a passphrase was used in key pair generation you need to provide it

```bash
openssl rsa -in ~/.ssh/id_rsa -passin -outform pem > ~/.ssh/id_rsa.pem
chmod 700 ~/.ssh/id_rsa.pem
```

### Aliases

To alias a server and avoid selecting user to that server

```
Host alias_name
    HostName host.example.com
    User user_name
```

### Using SSH key per host

Assignation of specific SSH key file to a server/user is also possible

```
IdentityFile ~/.ssh/ssh_private_key_file
```

#### Example of different keys per host

```
#default id_rsa ssh key file name
IdentityFile ~/.ssh/id_rsa

Host github.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_rsa_github

Host bitbucket.org
    HostName bitbucket.org
    User git
    IdentityFile ~/.ssh/id_rsa_bitbucket
```
