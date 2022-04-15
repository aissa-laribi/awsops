FROM public.ecr.aws/lambda/python:3.7

# Copy function code
COPY lambda_function.py ${LAMBDA_TASK_ROOT}

# Install the function's dependencies using file requirements.txt
# from your project folder.
RUN yum update -y
RUN yum install libwebp libwebp-dev libwebp-tools ImageMagick ImageMagick-devel ImageMagick-perl wget -y

COPY requirements.txt  .
RUN  pip3 install -r requirements.txt --target "${LAMBDA_TASK_ROOT}"

# Set the CMD to your handler (could also be done as a parameter override outside of the Dockerfile)
CMD [ "lambda_function.lambda_handler" ]  

