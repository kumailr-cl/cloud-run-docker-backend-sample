# Use a lightweight Nginx image
FROM nginx:alpine

# Remove default nginx config
RUN rm /etc/nginx/conf.d/default.conf

# Copy our custom config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy site files
COPY index.html /usr/share/nginx/html/

# Set Cloud Run expected port (injected dynamically)
ENV PORT=8080

# Update Nginx to listen on $PORT dynamically
RUN sed -i "s/listen 5000;/listen ${PORT};/" /etc/nginx/conf.d/default.conf

# Expose Cloud Run port
EXPOSE 8080

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
