# builder is stage or phase
FROM node:16-alpine as builder 
WORKDIR "/app"

COPY package.json . 
RUN npm install 
COPY . .
# the build folder will be created and is in  container /app/build
RUN npm run build


# Run phase
FROM nginx
# copy something from another phase under /app/build into nginx container under /usr/share/nginx/html
COPY --from=builder /app/build /usr/share/nginx/html


