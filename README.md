### Docker image for Jetson Nano using JP 4.4 ###

## Build image ##
`docker build -t nano/tf2_jupyterlab:0.1 .`

## Run image ##
`docker container run --network='host'  --gpus all --name master_ai nano/tf2_jupyterlab:0.1`

You will see on the screen something similar to this:  
`  
    To access the notebook, open this file in a browser:
        file:///root/.local/share/jupyter/runtime/nbserver-1-open.html
    Or copy and paste one of these URLs:
        http://host:8888/?token=a8eb01b5b69b17923d2041c92444a11c6b5567c7e216df1f
     or http://127.0.0.1:8888/?token=a8eb01b5b69b17923d2041c92444a11c6b5567c7e216df1f
`
1. Open your webrowser with host:8888 without the token.
2. Use the token to set a password. 
