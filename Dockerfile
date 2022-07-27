FROM PYTHON:3.10.5-bullseye

# Install Tessaract OCR
# Instructions: https://tesseract-ocr.github.io/tessdoc/Home.html#binaries
RUN apt -y install apt-transport-https
RUN echo "deb https://notesalexp.org/tesseract-ocr5/$(lsb_release -cs)/ $(lsb_release -cs) main" \
| sudo tee /etc/apt/sources.list.d/notesalexp.list > /dev/null
RUN apt -y update -oAcquire::AllowInsecureRepositories=true
RUN apt -y install notesalexp-keyring -oAcquire::AllowInsecureRepositories=true
RUN apt -y update
RUN apt -y install tesseract-ocr

# Copy data to the /codebase directory
COPY . /codebase

# Set the current directory
WORKDIR /codebase

# Install pip requirements  
RUN pip install setuptools

# Run the OCR setup tool
RUN python setup.py

CMD ['python' 'example.py']