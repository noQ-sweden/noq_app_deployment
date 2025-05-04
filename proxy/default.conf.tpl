server {
    listen ${LISTEN_PORT};

    server_name ${SERVER_IP} localhost;
    root        /frontend/dist;

    error_page 404 =200 /index.html;

    location / {
        index       index.html;
    }

    location /api {
        uwsgi_pass              ${BACKEND_HOST}:${BACKEND_PORT};
        include                 /etc/nginx/uwsgi_params;
        client_max_body_size    10M;
    }

    location /admin {
        uwsgi_pass              ${BACKEND_HOST}:${BACKEND_PORT};
        include                 /etc/nginx/uwsgi_params;
        client_max_body_size    10M;
    }

    location /static {
        alias                   /vol/web;
    }
}
