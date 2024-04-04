# Use an official Python runtime as a parent image

FROM python:3.12
# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install Poetry
RUN pip install poetry

# Copy poetry and project configuration
COPY poetry.lock pyproject.toml /app/

# Install dependencies
RUN poetry config virtualenvs.create false
RUN poetry install --no-interaction --no-ansi

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Define environment variable
ENV NAME World

# Run app.py when the container launches
CMD ["poetry", "run", "python", "manage.py", "runserver", "0.0.0.0:8000"]

