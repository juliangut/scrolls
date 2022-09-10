# SSH

## Keys

### Location

SSH keys are located within user's home directory.

```bash
cd ~/.ssh/
```

### Key generation

When possible favor using ED25519

#### ED25519

```bash
ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/id_ed25519 -C "your@email.com"
```

#### RSA

```bash
ssh-keygen -a 100 -t rsa -b 4096 -f ~/.ssh/id_rsa4096 -C "your@email.com"
```

#### Passphrase

In the process of generating a key pair you'll be asked to assign a passphrase to it to protect the key from being accessed by another person.

It is a good thing to do although not a mandatory step.

### PEM Certificates

In order to derive a `.pem` certificate from the generated ssh key

```bash
openssl rsa -in ~/.ssh/id_rsa4096 -outform pem > ~/.ssh/id_rsa4096.pem
chmod 700 ~/.ssh/id_rsa4096.pem
```

#### Passphrase

If a passphrase was used in key pair generation you need to include it

```bash
openssl rsa -in ~/.ssh/id_rsa4096 -passin -outform pem > ~/.ssh/id_rsa4096.pem
chmod 700 ~/.ssh/id_rsa4096.pem
```

## Configuration

SSH configuration file is located under .ssh directory on user's home directory

```bash
touch ~/.ssh/config
chmod 644 ~/.ssh/config
```

### Aliases

To alias a server and take advantage of using the alias in CLI

```bash
Host alias_name
    HostName host.example.com
    User user_name
```

Now accessing `host.example.com` is simpler

```bash
ssh alias_name
```

### Using different SSH key per host

Assigning a specific key file to a server/user is also possible

```bash
Host alias_name
    HostName host.example.com
    User user_name
    IdentityFile ~/.ssh/custom_id_rsa
    IdentitiesOnly yes
```

#### Example of different keys per host

```bash
Host usera_github
    HostName github.com
    User git
    IdentityFile ~/.ssh/usera_github_id_rsa
    IdentitiesOnly yes

Host userb_github
    HostName github.com
    User git
    IdentityFile ~/.ssh/userb_github_id_rsa
    IdentitiesOnly yes

Host bitbucket.org
    HostName bitbucket.org
    User git
    IdentityFile ~/.ssh/bitbucket_id_rsa
    IdentitiesOnly yes
```

### RSA algorithm support

If you need to enable ssh-rsa algorithm to connect to a server

```bash
PubkeyAcceptedKeyTypes +ssh-rsa

Host alias_name
    HostName host.example.com
    User user_name
    IdentityFile ~/.ssh/custom_id_rsa
    IdentitiesOnly yes
    HostkeyAlgorithms +ssh-rsa
```

## Certificates

### Generation

#### Private Key

```
openssl req -newkey rsa:4096 -nodes -keyout domain.key
```

#### CSR

```
openssl req -key domain.key -new -out domain.csr
```

### Self-Signed Certificate

#### At once

```
openssl req -newkey rsa:4096 -nodes -keyout domain.key -x509 -days 365 -out domain.crt
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
