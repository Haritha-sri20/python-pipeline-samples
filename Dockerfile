# Use a Python base image
FROM python:3.10.6-alpine

# Set the working directory inside the container
WORKDIR /python-pipeline-samples

# Copy the current directory contents into the container at /python-pipeline-samples
COPY . /python-pipeline-samples

# Expose port 8080 to make the app accessible outside the container
EXPOSE 8080

# Install the required Python packages listed in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Set the default command to run the Flask app
CMD ["python3", "app.py"]
