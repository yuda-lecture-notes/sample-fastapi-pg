# base image
FROM tiangolo/uvicorn-gunicorn-fastapi:python3.8

# membuat folder project di container nanti
WORKDIR /src

# install package
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# ngoding -> menyimpan source code ke folder src (workdir)
COPY . .

# execute
# uvicorn src.app.main:app --proxy-headers --host 0.0.0.0 --port 80
CMD ["uvicorn", "src.app.main:app", "--proxy-headers", "--host", "0.0.0.0", "--port", "80"]