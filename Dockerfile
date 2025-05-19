# 1. Choose your base Node.js image
# Use an official Node.js image. LTS versions are generally recommended.
# Example: Node.js 18 LTS (Long Term Support)
FROM node:18-alpine

# 2. Set the working directory inside the container
WORKDIR /usr/src/app

# 3. Copy package.json and package-lock.json (or yarn.lock)
# This step is done separately to leverage Docker's layer caching.
# If these files haven't changed, Docker can skip re-installing dependencies.
COPY package*.json ./
# If you use yarn:
# COPY yarn.lock ./
# COPY package.json ./

# 4. Install your application's dependencies
# If you use npm:
RUN npm install
# If you use yarn:
# RUN yarn install --frozen-lockfile

# 5. Copy the rest of your application's code into the container
COPY . .

# 6. Expose the port your application runs on
# Replace 3000 with the port your app actually listens on
EXPOSE 3000

# 7. Define the command to run your application
# This is what Docker will run when the container starts.
# Replace 'node server.js' or 'npm start' with your actual start command.
CMD [ "npm", "start" ]
# Or if you run directly with node:
# CMD [ "node", "your-main-script.js" ] 