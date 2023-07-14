# Use Node.js version 16 as the base image.
FROM node:16

# Set the global npm directory.
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global

# Add the global npm binaries to PATH.
ENV PATH=$PATH:/home/node/.npm-global/bin 

# Create an application directory
WORKDIR /tiny

# Install Tinylicious globally
RUN npm install -g tinylicious

# Copy the modified config.json into Tinylicious's root directory
COPY config.json /home/node/.npm-global/lib/node_modules/tinylicious/config.json

# Expose the port Tinylicious will be running on.
EXPOSE 7070

# Specify the volume to store git and leveldb files
VOLUME ["/var/tmp"]

# Run Tinylicious
CMD ["node", "/home/node/.npm-global/lib/node_modules/tinylicious/dist/index.js"]
