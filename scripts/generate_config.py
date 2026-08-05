import os
import json


port=int(
    os.environ.get(
        "PORT",
        8080
    )
)


config={

"log":{
"loglevel":"warning"
},


"inbounds":[

{

"listen":"0.0.0.0",

"port":port,

"protocol":"vless",

"settings":{

"clients":[

],

"decryption":"none"

},


"streamSettings":{

"network":"xhttp",

"security":"none",

"xhttpSettings":{

"path":"/xhttp"

}

}

}

],


"outbounds":[

{

"protocol":"freedom"

}

]

}


with open(
"/config/config.json",
"w"
) as f:

    json.dump(
        config,
        f,
        indent=2
    )
