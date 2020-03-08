FROM node:alpine AS builder 
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


FROM nginx
# Open port to external env
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

# $ docker run -p 8080:80 <image name>