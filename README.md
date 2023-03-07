# Kitsune

## Introduction

Kitsune is a website designed for artists to easily share, browse, and comment on different pieces of artwork. The purpose of this project was to gain experience with the process of developing a full-stack web project. The project is coded using the [Ruby on Rails](https://rubyonrails.org/) framework and uses [PostgreSQL](https://www.postgresql.org/) as the database. Additionally, the [Tailwind CSS](https://tailwindcss.com/) framework is used for CSS styling and [libvips](https://www.libvips.org/) is used for server-side image processing. All dependencies are managed using [Docker](https://www.docker.com/).

## How to Run

These instructions are intended for Linux machines running [Docker](https://www.docker.com/) and [Docker Compose](https://docs.docker.com/compose/).

1. Clone the repository to your local machine

`git clone https://github.com/tailflail/kitsune.git`

2. Modify the `.env.example` file with your chosen environment variables and rename it to `.env`. If you are unfamiliar with the `UID` and `GID` environment variables, these should respectively match the outputs of running the commands `echo $(id -u)` and `echo $(id -g)` in your terminal

3. Build the Docker images for Kitsune and PostgreSQL

`sudo docker compose up --build`

4. Create and migrate the databases

`sudo docker exec -it kitsune-app sh -c "bin/rails db:create && bin/rails db:migrate"`

5. Open http://localhost:3000 in your browser

## Screenshots

Kitsune is still a work in progress, but a brief overview of the website's style and features can be seen below.

<img src="https://user-images.githubusercontent.com/89919950/220822140-17c533ba-a28d-47dc-b2b1-7f7aaed9f318.png" width="1050">
<img src="https://user-images.githubusercontent.com/89919950/220822196-d65c1f43-5a1f-4c5a-9f53-4ea32f169153.png" width="1050">
<img src="https://user-images.githubusercontent.com/89919950/220822179-74b25333-7b23-4b29-81d6-192981d3bcc3.png" width="1050">
<img src="https://user-images.githubusercontent.com/89919950/220822191-2f54a295-feeb-4b23-95e8-842034dbc34c.png" width="1050">
<p align="center">
<img src="https://user-images.githubusercontent.com/89919950/220822420-4d56bdae-17b6-4681-9c62-fb6082bb6fe2.png" height="947">
</p>

## Features

- User registration and login authentication
- Profiles, favorites, comments, and followers
- Taggable posts
- Responsive design for mobile and tablet devices
- Thumbnails for posts and avatars to optimize page loading
- Sanitized parsing of URLs to shorten links in user profile biographies
- Authorization to prevent users modifying data they don't own

## Technologies Used

- Ruby
- Ruby on Rails
- PostgreSQL
- libvips
- Docker
