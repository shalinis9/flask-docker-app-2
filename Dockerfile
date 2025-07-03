# Use the official Python image
FROM python:3.12-slim

# Set the working directory in the container
WORKDIR /app

# Copy requirements and install
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . .

# Expose port 5000 and run the app
EXPOSE 5000
CMD ["python", "app.py"]

