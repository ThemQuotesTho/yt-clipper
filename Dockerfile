FROM python:3.11-slim

RUN apt-get update && apt-get install -y \
    ffmpeg \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

RUN pip install yt-dlp

RUN pip install git+https://github.com/openai/whisper.git

WORKDIR /app

COPY run_workflow.sh /app/run_workflow.sh
RUN chmod +x /app/run_workflow.sh

CMD ["./run_workflow.sh"]
