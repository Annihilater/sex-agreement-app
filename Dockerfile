# ---- Builder Stage ----
# Purpose: Build the Next.js static export.
FROM node:18-alpine AS builder

# Set working directory
WORKDIR /app

# Install dependencies based on package-lock.json for consistency
COPY package*.json ./
RUN npm ci

# Copy the rest of the application code
# Note: .dockerignore should prevent node_modules, .next, etc. from being copied
COPY . .

# Build the Next.js application for static export
# Because next.config.js has output: 'export', this will generate files in the 'out' directory
RUN npm run build

# ---- Runner Stage ----
# Purpose: Serve the static files using Nginx.
FROM nginx:1.25-alpine

# Remove default Nginx welcome page
RUN rm /etc/nginx/conf.d/default.conf

# Copy custom Nginx configuration (we will create this next)
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy the static build output from the builder stage to Nginx's web root
COPY --from=builder /app/out /usr/share/nginx/html

# Expose port 80 (standard HTTP port for Nginx)
EXPOSE 80

# Command to start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
