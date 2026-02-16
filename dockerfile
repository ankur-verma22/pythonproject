# -------------------------
# Stage 1: Builder Stage
# -------------------------
FROM python:3.11-slim AS builder

# Set working directory
WORKDIR /app

# Install system dependencies (if needed)
RUN apt-get update && apt-get install -y build-essential

# Copy only requirements first (for better caching)
COPY requirement.txt .

# Install dependencies inside /install directory
RUN pip install --no-cache-dir --prefix=/install -r requirement.txt


# -------------------------
# Stage 2: Final Runtime Image
# -------------------------
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy installed dependencies from builder stage
COPY --from=builder /install /usr/local

# Copy application code
COPY app.py .

# Expose port
EXPOSE 5000

# Run application
CMD ["python", "app.py"]

