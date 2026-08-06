# Railway Xray XHTTP TLS


Railway deployment for Xray-core.

Architecture:


Client

↓

Railway TCP Proxy :443

↓

Nginx TLS Reverse Proxy

↓

Xray VLESS XHTTP


## Protocol

VLESS XHTTP TLS


## Ports


Public:

443


Internal:

8443 Xray

9000 Health API



## Environment Variables


UUID

DOMAIN

XHTTP_PATH=/xhttp



## Deployment


1. Push repository to GitHub

2. Connect repository to Railway

3. Add environment variables

4. Enable TCP Proxy

5. Deploy



## Client Configuration


Protocol:

VLESS


Transport:

XHTTP


Security:

TLS


Port:

443


Path:

/xhttp
