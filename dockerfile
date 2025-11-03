# Use a lightweight Nginx image
FROM nginx:alpine

# Remove default nginx config
RUN rm /etc/nginx/conf.d/default.conf

# Copy our custom config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy site files
COPY index.html /usr/share/nginx/html/

# Expose port 5000 for ECS / Docker
EXPOSE 5000

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
