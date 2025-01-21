server {
    listen ${LISTEN_PORT};

    server_name localhost;

    location / {
        root                    /frontend/dist;
        index                   index.html;
        try_files $uri /index.html; 
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
