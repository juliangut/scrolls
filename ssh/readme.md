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

### PEM Certificates

In order to generate a `.pem` certificate from generated ssh key

```bash
openssl rsa -in ~/.ssh/id_rsa -outform pem > ~/.ssh/id_rsa.pem
chmod 700 ~/.ssh/id_rsa.pem
```

#### Passphrase

If a passphrase was used in key pair generation you need to provide it

```bash
openssl rsa -in ~/.ssh/id_rsa -passin -outform pem > ~/.ssh/id_rsa.pem
chmod 700 ~/.ssh/id_rsa.pem
```

## Configuration

SSH configuration file is located under .ssh directory on user's home directory

```bash
touch ~/.ssh/config
chmod 644 ~/.ssh/config
```

### Aliases

To alias a server and avoid selecting user to that server

```bash
Host alias_name
    HostName host.example.com
    User user_name
```

### Using different SSH key per host

Assignation of specific SSH key file to a server/user is also possible

```
IdentityFile ~/.ssh/ssh_private_key_file
```

#### Example of different keys per host

```bash
#default id_rsa ssh key file name
#IdentityFile ~/.ssh/id_rsa

Host usera_github
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_rsa_usera_github
    IdentitiesOnly yes

Host userb_github
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_rsa_userb_github
    IdentitiesOnly yes

Host bitbucket.org
    HostName bitbucket.org
    User git
    IdentityFile ~/.ssh/id_rsa_bitbucket
    IdentitiesOnly yes
```

## Certificates

### Generate Private Key

```
openssl req -newkey rsa:2048 -nodes -keyout domain.key
```

### Generate a CSR

```
openssl req -key domain.key -new -out domain.csr
```

### Self-Signed Certificate

#### One step

```
openssl req -newkey rsa:2048 -nodes -keyout domain.key -x509 -days 365 -out domain.crt
```

#### From Private Key and CSR

```
// From private key
openssl req -key domain.key -new -x509 -days 365 -out domain.crt

// From private key and CSR
openssl x509 -signkey domain.key -in domain.csr -req -days 365 -out domain.crt
```

### Let's encrypt

#### Install certbot

Head to [certbot.eff.org](https://certbot.eff.org) to download instructions

```
sudo dnf install certbot-nginx
```

#### Register domain

Easiest registration process is through `webroot` method. This will automatically create `/{webroot}/.well-known/acme-challenge` file to verify let's encrypt challenge. Be careful how the server treats `.well-known` directory

```
certbot certonly --webroot -w=/path/to/webroot -d domain_name [-d domain_name]
```

#### Usage

Certificates are automatically created at `/etc/letsencrypt/live/domain_name`. You only need to point to the certificates on server configuration

```
server {
    listen 443 ssl;
    ssl_certificate           /etc/letsencrypt/live/domain_name/fullchain.pem;
    ssl_certificate_key       /etc/letsencrypt/live/domain_name/privkey.pem;
    ssl_protocols             TLSv1 TLSv1.1 TLSv1.2;
    ssl_session_cache         shared:SSL:10m;
    ssl_ciphers               "ECDHE-RSA-AES256-GCM-SHA384:ECDHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-SHA384:ECDHE-RSA-AES128-SHA256:ECDHE-RSA-AES256-SHA:ECDHE-RSA-AES128-SHA:DHE-RSA-AES256-SHA256:DHE-RSA-AES128-SHA256:DHE-RSA-AES256-SHA:DHE-RSA-AES128-SHA:ECDHE-RSA-DES-CBC3-SHA:EDH-RSA-DES-CBC3-SHA:AES256-GCM-SHA384:AES128-GCM-SHA256:AES256-SHA256:AES128-SHA256:AES256-SHA:AES128-SHA:DES-CBC3-SHA:HIGH:!aNULL:!eNULL:!EXPORT:!DES:!MD5:!PSK:!RC4";
    ssl_prefer_server_ciphers on;

    [...]
}
```

#### Renewal

Test renewal is possible

```
certbot renew --dry-run
```

Once everything is set up schedule a cron to renew certificates

```
# m h dom mon dow user command
10 2 * * 7 root certbot-auto renew --no-self-upgrade >> /var/log/certbot
```

#### List certificates

```
certbot certificates
```
