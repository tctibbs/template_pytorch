# Use the official Python 3.12 image as the base image
FROM python:3.12

# Force Python to send output directly to the terminal (stdout/stderr) without buffering
ENV PYTHONUNBUFFERED=1

# Install tzdata for timezone configuration
RUN apt-get update && \
    apt-get install -y tzdata sudo

# Set the timezone to EST (use a region like America/New_York that observes EST)
ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install uv, a fast Python package installer and resolver
RUN pip install uv

# Create and set the working directory
WORKDIR /app

# Copy all necessary files
COPY . .

# Install dependencies using uv (both production and development)
RUN uv pip install --system ".[dev]"

# Create a non-root user and add to sudo group
RUN useradd -m -s /bin/bash developer && \
    echo "developer ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Switch to the non-root user
USER developer

# Update the package list
RUN sudo apt-get update
