# 1. Use an official Python Alpine image for a small footprint
# The readme mentions Python 3.10+, so 3.11-alpine is a great choice.
FROM python:3.13.5-alpine3.22

# 2. Set the working directory in the container
WORKDIR /app

# 3. Copy the dependencies file to the working directory
# Based on your readme.md, a requirements.txt file is expected.
COPY requirements.txt .

# 4. Install dependencies
# Using --no-cache-dir keeps the image size down.
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy the rest of your application's source code
COPY . .

# 6. Expose port 8000 to allow communication to the container
EXPOSE 8000

# 7. Define the command to run your app using uvicorn
# We use --host 0.0.0.0 to make the server accessible from outside the container.
# The --reload flag is removed as it's not recommended for production.
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]

